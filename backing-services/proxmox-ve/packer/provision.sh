#!/bin/bash
set -euxo pipefail

# configure apt for non-interactive mode.
export DEBIAN_FRONTEND=noninteractive

# switch to the non-enterprise repository.
# see https://pve.proxmox.com/wiki/Package_Repositories
rm -f /etc/apt/sources.list.d/pve-enterprise.list
echo 'deb http://download.proxmox.com/debian/pve buster pve-no-subscription' >/etc/apt/sources.list.d/pve.list

# switch the apt mirror from us to ie.
sed -i -E 's,ftp\.us\.debian,ftp.ie.debian,' /etc/apt/sources.list

# use traditional interface names like eth0 instead of enp0s3
# by disabling the predictable network interface names.
sed -i -E 's,^(GRUB_CMDLINE_LINUX=).+,\1"net.ifnames=0",' /etc/default/grub
sed -i -E 's,^(GRUB_CMDLINE_LINUX=).+,\1"console=ttyS0",' /etc/default/grub
sed -i -E 's,#(GRUB_TERMINAL\s*=).*,\1console,g' /etc/default/grub
update-grub

# configure the network for working in a vagrant environment.
# NB proxmox has created the vmbr0 bridge and placed eth0 on the it, but
#    that will not work, vagrant expects to control eth0. so we have to
#    undo the proxmox changes.
cat >/etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

iface ens3 inet manual

auto vmbr0
iface vmbr0 inet dhcp
  bridge_ports ens3
  bridge_stp off
  bridge_fd 0

auto vmbr1
iface vmbr1 inet static
  address  10.10.10.1
  netmask  255.255.255.0
  bridge_ports none
  bridge_stp off
  bridge_fd 0

  post-up echo 1 > /proc/sys/net/ipv4/ip_forward
  post-up   iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE
  post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o vmbr0 -j MASQUERADE

EOF

cat >/etc/rc.local <<'EOF'
#!/bin/bash
dhclient
exit 0
EOF


chmod 755 /etc/rc.local
systemctl enable rc-local


# set the timezone.
ln -fs /usr/share/zoneinfo/Europe/Dublin /etc/localtime
dpkg-reconfigure tzdata

# reset the machine-id.
# NB systemd will re-generate it on the next boot.
# NB machine-id is indirectly used in DHCP as Option 61 (Client Identifier), which
#    the DHCP server uses to (re-)assign the same or new client IP address.
# see https://www.freedesktop.org/software/systemd/man/machine-id.html
# see https://www.freedesktop.org/software/systemd/man/systemd-machine-id-setup.html
echo '' >/etc/machine-id
rm -f /var/lib/dbus/machine-id

# reset the random-seed.
# NB systemd-random-seed re-generates it on every boot and shutdown.
# NB you can prove that random-seed file does not exist on the image with:
#       sudo virt-filesystems -a ~/.vagrant.d/boxes/proxmox-ve-amd64/0/libvirt/box.img
#       sudo guestmount -a ~/.vagrant.d/boxes/proxmox-ve-amd64/0/libvirt/box.img -m /dev/pve/root --pid-file guestmount.pid --ro /mnt
#       sudo ls -laF /mnt/var/lib/systemd
#       sudo guestunmount /mnt
#       sudo bash -c 'while kill -0 $(cat guestmount.pid) 2>/dev/null; do sleep .1; done; rm guestmount.pid' # wait for guestmount to finish.
# see https://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
# see https://manpages.debian.org/stretch/manpages/random.4.en.html
# see https://manpages.debian.org/stretch/manpages/random.7.en.html
# see https://github.com/systemd/systemd/blob/master/src/random-seed/random-seed.c
# see https://github.com/torvalds/linux/blob/master/drivers/char/random.c
systemctl stop systemd-random-seed
rm -f /var/lib/systemd/random-seed

apt update
pveam update

apt install -y dnsmasq

cat >/etc/dnsmasq.d/dhcp.conf <<'EOF'
# Set the interface on which dnsmasq operates.
# If not set, all the interfaces is used.
interface=vmbr1

port=0
# To enable dnsmasq's DHCP server functionality.
dhcp-range=10.10.10.3,10.10.10.100,12h
dhcp-option=option:dns-server,1.1.1.1

# Set gateway as Router. Following two lines are identical.
dhcp-option=3,10.10.10.1

# Logging.
log-facility=/var/log/dnsmasq.log   # logfile path.
log-async
log-queries # log queries.
log-dhcp    # log dhcp related messages.
EOF
systemctl restart dnsmasq

apt install -y python3
apt install -y python3-pip
apt install -y pkg-config
apt install -y git
apt install -y jq
pip3 install -r /playbooks/requirements.txt
cd /playbooks 
ansible-playbook -i hosts provision.yml || true

# clean packages.
apt-get -y autoremove
apt-get -y clean
