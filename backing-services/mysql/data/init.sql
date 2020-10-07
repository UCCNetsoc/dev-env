CREATE USER IF NOT EXISTS 'pterodactyl'@'127.0.0.1' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS panel;
CREATE DATABASE IF NOT EXISTS promexporter;
GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
DROP TABLE IF EXISTS schedules;

USE panel;
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- SQL Dump for games panel configuration

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocations`
--

CREATE TABLE `allocations` (
  `id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_alias` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `port` mediumint(8) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allocations`
--

INSERT INTO `allocations` (`id`, `node_id`, `ip`, `ip_alias`, `port`, `server_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', 'localhost', 1045, 1, NULL, NULL, '2020-09-18 16:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `key_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `identifier` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `r_servers` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_nodes` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_allocations` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_users` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_locations` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_nests` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_eggs` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_database_hosts` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `r_server_databases` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `authorized` tinyint(1) NOT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `key` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_successful` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignored_files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bytes` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `databases`
--

CREATE TABLE `databases` (
  `id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `database_host_id` int(10) UNSIGNED NOT NULL,
  `database` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '%',
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_connections` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_hosts`
--

CREATE TABLE `database_hosts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_databases` int(10) UNSIGNED DEFAULT NULL,
  `node_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eggs`
--

CREATE TABLE `eggs` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nest_id` int(10) UNSIGNED NOT NULL,
  `author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `docker_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `config_startup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `config_logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `config_stop` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_from` int(10) UNSIGNED DEFAULT NULL,
  `startup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `script_container` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'alpine:3.4',
  `copy_script_from` int(10) UNSIGNED DEFAULT NULL,
  `script_entry` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ash',
  `script_is_privileged` tinyint(1) NOT NULL DEFAULT '1',
  `script_install` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `eggs`
--

INSERT INTO `eggs` (`id`, `uuid`, `nest_id`, `author`, `name`, `description`, `docker_image`, `config_files`, `config_startup`, `config_logs`, `config_stop`, `config_from`, `startup`, `script_container`, `copy_script_from`, `script_entry`, `script_is_privileged`, `script_install`, `created_at`, `updated_at`) VALUES
(2, '9f51b84d-a3c3-4b1f-a2f7-6f4b19d36e7b', 1, 'support@pterodactyl.io', 'Forge Minecraft', 'Minecraft Forge Server. Minecraft Forge is a modding API (Application Programming Interface), which makes it easier to create mods, and also make sure mods are compatible with each other.', 'quay.io/pterodactyl/core:java', '{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}', '{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}', '{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}', 'stop', NULL, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}', 'openjdk:8-jdk-slim', NULL, 'bash', 1, '#!/bin/bash\r\n# Forge Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y curl jq\r\n\r\n#Go into main direction\r\nif [ ! -d /mnt/server ]; then\r\n    mkdir /mnt/server\r\nfi\r\n\r\ncd /mnt/server\r\n\r\nif [ ! -z ${FORGE_VERSION} ]; then\r\n    DOWNLOAD_LINK=https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}\r\nelse\r\n    JSON_DATA=$(curl -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json)\r\n\r\n    if [ \"${MC_VERSION}\" == \"latest\" ] || [ \"${MC_VERSION}\" == \"\" ] ; then\r\n        echo -e \"getting latest recommended version of forge.\"\r\n        MC_VERSION=$(echo -e ${JSON_DATA} | jq -r \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains(\"recommended\")) | split(\"-\")[0]\' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -1)\r\n    	BUILD_TYPE=recommended\r\n    fi\r\n\r\n    if [ \"${BUILD_TYPE}\" != \"recommended\" ] && [ \"${BUILD_TYPE}\" != \"latest\" ]; then\r\n        BUILD_TYPE=recommended\r\n    fi\r\n\r\n    echo -e \"minecraft version: ${MC_VERSION}\"\r\n    echo -e \"build type: ${BUILD_TYPE}\"\r\n\r\n    ## some variables for getting versions and things\r\n    FILE_SITE=$(echo -e ${JSON_DATA} | jq -r \'.homepage\' | sed \"s/http:/https:/g\")\r\n    VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" --arg BUILD_TYPE \"${BUILD_TYPE}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains($BUILD_TYPE))\')\r\n\r\n    ## locating the forge version\r\n    if [ \"${VERSION_KEY}\" == \"\" ] && [ \"${BUILD_TYPE}\" == \"recommended\" ]; then\r\n        echo -e \"dropping back to latest from recommended due to there not being a recommended version of forge for the mc version requested.\"\r\n        VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains(\"recommended\"))\')\r\n    fi\r\n\r\n    ## Error if the mc version set wasn\'t valid.\r\n    if [ \"${VERSION_KEY}\" == \"\" ] || [ \"${VERSION_KEY}\" == \"null\" ]; then\r\n    	echo -e \"The install failed because there is no valid version of forge for the version on minecraft selected.\"\r\n    	exit 1\r\n    fi\r\n\r\n    FORGE_VERSION=$(echo -e ${JSON_DATA} | jq -r --arg VERSION_KEY \"$VERSION_KEY\" \'.promos | .[$VERSION_KEY]\')\r\n\r\n    if [ \"${MC_VERSION}\" == \"1.7.10\" ] || [ \"${MC_VERSION}\" == \"1.8.9\" ]; then\r\n        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}\r\n        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}.jar\r\n        if [ \"${MC_VERSION}\" == \"1.7.10\" ]; then\r\n            FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}-universal.jar\r\n        fi\r\n    else\r\n        DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}\r\n        FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}.jar\r\n    fi\r\nfi\r\n\r\n\r\n#Adding .jar when not eding by SERVER_JARFILE\r\nif [[ ! $SERVER_JARFILE = *\\.jar ]]; then\r\n  SERVER_JARFILE=\"$SERVER_JARFILE.jar\"\r\nfi\r\n\r\n#Downloading jars\r\necho -e \"Downloading forge version ${FORGE_VERSION}\"\r\nif [ ! -z \"${DOWNLOAD_LINK}\" ]; then \r\n    if curl --output /dev/null --silent --head --fail ${DOWNLOAD_LINK}-installer.jar; then\r\n        echo -e \"installer jar download link is valid.\"\r\n    else\r\n        echo -e \"link is invalid closing out\"\r\n        exit 2\r\n    fi\r\n\r\n    echo -e \"no download link closing out\"\r\n    exit 3\r\nfi\r\n\r\ncurl -s -o installer.jar -sS ${DOWNLOAD_LINK}-installer.jar\r\n\r\n#Checking if downloaded jars exist\r\nif [ ! -f ./installer.jar ]; then\r\n    echo \"!!! Error by downloading forge version ${FORGE_VERSION} !!!\"\r\n    exit\r\nfi\r\n\r\n#Installing server\r\necho -e \"Installing forge server.\\n\"\r\njava -jar installer.jar --installServer || { echo -e \"install failed\"; exit 4; }\r\n\r\nmv $FORGE_JAR $SERVER_JARFILE\r\n\r\n#Deleting installer.jar\r\necho -e \"Deleting installer.jar file.\\n\"\r\nrm -rf installer.jar', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(3, '2ffe5a37-8918-4824-b560-5cdc0a549811', 1, 'parker@pterodactyl.io', 'Paper', 'High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.', 'quay.io/pterodactyl/core:java', '{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}', '{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}', '{}', 'stop', NULL, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}', 'alpine:3.9', NULL, 'ash', 1, '#!/bin/ash\r\n# Paper Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napk add --no-cache --update curl jq\r\n\r\nif [ -n \"${DL_PATH}\" ]; then\r\n    echo -e \"using supplied download url\"\r\n    DOWNLOAD_URL=`eval echo $(echo ${DL_PATH} | sed -e \'s/{{/${/g\' -e \'s/}}/}/g\')`\r\nelse\r\n    VER_EXISTS=`curl -s https://papermc.io/api/v1/paper | jq -r --arg VERSION $MINECRAFT_VERSION \'.versions[] | IN($VERSION)\' | grep true`\r\n    LATEST_PAPER_VERSION=`curl -s https://papermc.io/api/v1/paper | jq -r \'.versions\' | jq -r \'.[0]\'`\r\n    \r\n    if [ \"${VER_EXISTS}\" == \"true\" ]; then\r\n        echo -e \"Version is valid. Using version ${MINECRAFT_VERSION}\"\r\n    else\r\n        echo -e \"Using the latest paper version\"\r\n        MINECRAFT_VERSION=${LATEST_PAPER_VERSION}\r\n    fi\r\n    \r\n    BUILD_EXISTS=`curl -s https://papermc.io/api/v1/paper/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} \'.builds.all[] | IN($BUILD)\' | grep true`\r\n    LATEST_PAPER_BUILD=`curl -s https://papermc.io/api/v1/paper/${MINECRAFT_VERSION} | jq -r \'.builds.latest\'`\r\n    \r\n    if [ \"${BUILD_EXISTS}\" == \"true\" ] || [ ${BUILD_NUMBER} == \"latest\" ]; then\r\n        echo -e \"Build is valid. Using version ${BUILD_NUMBER}\"\r\n    else\r\n        echo -e \"Using the latest paper build\"\r\n        BUILD_NUMBER=${LATEST_PAPER_BUILD}\r\n    fi\r\n    \r\n    echo \"Version being downloaded\"\r\n    echo -e \"MC Version: ${MINECRAFT_VERSION}\"\r\n    echo -e \"Build: ${BUILD_NUMBER}\"\r\n    DOWNLOAD_URL=https://papermc.io/api/v1/paper/${MINECRAFT_VERSION}/${BUILD_NUMBER}/download \r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"running curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\"\r\n\r\nif [ -f ${SERVER_JARFILE} ]; then\r\n    mv ${SERVER_JARFILE} ${SERVER_JARFILE}.old\r\nfi\r\n\r\ncurl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\r\n\r\nif [ ! -f server.properties ]; then\r\n    echo -e \"Downloading MC server.properties\"\r\n    curl -o server.properties https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft_java/server.properties\r\nfi', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(5, 'df51c666-6b9b-4cba-9458-56a30ee9d1db', 1, 'support@pterodactyl.io', 'Vanilla Minecraft', 'Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.', 'quay.io/pterodactyl/core:java', '{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"enable-query\": \"true\",\r\n            \"server-port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}', '{\r\n    \"done\": \")! For help, type \",\r\n    \"userInteraction\": [\r\n        \"Go to eula.txt for more info.\"\r\n    ]\r\n}', '{\r\n    \"custom\": false,\r\n    \"location\": \"logs/latest.log\"\r\n}', 'stop', NULL, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}', 'alpine:3.10', NULL, 'ash', 1, '#!/bin/ash\r\n# Vanilla MC Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napk add curl --no-cache --update jq\r\n\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\n\r\nLATEST_VERSION=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r \'.latest.release\'`\r\n\r\necho -e \"latest version is $LATEST_VERSION\"\r\n\r\nif [ -z \"$VANILLA_VERSION\" ] || [ \"$VANILLA_VERSION\" == \"latest\" ]; then\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $LATEST_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nelse\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $VANILLA_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nfi\r\n\r\nDOWNLOAD_URL=$(curl ${MANIFEST_URL} | jq .downloads.server | jq -r \'. | .url\')\r\n\r\necho -e \"running: curl -o ${SERVER_JARFILE} $DOWNLOAD_URL\"\r\ncurl -o ${SERVER_JARFILE} $DOWNLOAD_URL\r\n\r\necho -e \"Install Complete\"', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(7, 'c128fb68-28bb-454a-8b80-21f65d7657ed', 2, 'support@pterodactyl.io', 'Counter-Strike: Global Offensive', 'Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation.', 'quay.io/pterodactyl/core:source', '{}', '{\r\n    \"done\": \"Connection to Steam servers successful\",\r\n    \"userInteraction\": []\r\n}', '{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}', 'quit', NULL, './srcds_run -game csgo -console -port {{SERVER_PORT}} +ip 0.0.0.0 +map {{SRCDS_MAP}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}', 'ubuntu:18.04', NULL, 'bash', 1, '#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(9, '4763f733-15b7-454c-a0df-639099ab7041', 2, 'support@pterodactyl.io', 'Garrys Mod', 'Garrys Mod, is a sandbox physics game created by Garry Newman, and developed by his company, Facepunch Studios.', 'quay.io/pterodactyl/core:source', '{}', '{\r\n    \"done\": \"gameserver Steam ID\",\r\n    \"userInteraction\": []\r\n}', '{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}', 'quit', NULL, './srcds_run -game garrysmod -console -port {{SERVER_PORT}} +ip 0.0.0.0 +host_workshop_collection {{WORKSHOP_ID}} +map {{SRCDS_MAP}} +gamemode {{GAMEMODE}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}} +maxplayers {{MAX_PLAYERS}}  -tickrate {{TICKRATE}}', 'ubuntu:18.04', NULL, 'bash', 1, '#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so\r\n\r\n# Creating needed default files for the game\r\ncd /mnt/server/garrysmod/lua/autorun/server\r\necho \'\r\n-- Docs: https://wiki.garrysmod.com/page/resource/AddWorkshop\r\n-- Place the ID of the workshop addon you want to be downloaded to people who join your server, not the collection ID\r\n-- Use https://beta.configcreator.com/create/gmod/resources.lua to easily create a list based on your collection ID\r\n\r\nresource.AddWorkshop( \"\" )\r\n\' > workshop.lua\r\n\r\ncd /mnt/server/garrysmod/cfg\r\necho \'\r\n// Please do not set RCon in here, use the startup parameters.\r\n\r\nhostname		\"New Gmod Server\"\r\nsv_password		\"\"\r\nsv_loadingurl   \"\"\r\n\r\n// Steam Server List Settings\r\nsv_region \"255\"\r\nsv_lan \"0\"\r\nsv_max_queries_sec_global \"30000\"\r\nsv_max_queries_window \"45\"\r\nsv_max_queries_sec \"5\"\r\n\r\n// Server Limits\r\nsbox_maxprops		100\r\nsbox_maxragdolls	5\r\nsbox_maxnpcs		10\r\nsbox_maxballoons	10\r\nsbox_maxeffects		10\r\nsbox_maxdynamite	10\r\nsbox_maxlamps		10\r\nsbox_maxthrusters	10\r\nsbox_maxwheels		10\r\nsbox_maxhoverballs	10\r\nsbox_maxvehicles	20\r\nsbox_maxbuttons		10\r\nsbox_maxsents		20\r\nsbox_maxemitters	5\r\nsbox_godmode		0\r\nsbox_noclip		    0\r\n\r\n// Network Settings - Please keep these set to default.\r\n\r\nsv_minrate		75000\r\nsv_maxrate		0\r\ngmod_physiterations	2\r\nnet_splitpacket_maxrate	45000\r\ndecalfrequency		12 \r\n\r\n// Execute Ban Files - Please do not edit\r\nexec banned_ip.cfg \r\nexec banned_user.cfg \r\n\r\n// Add custom lines under here\r\n\' > server.cfg', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(11, '1194e7b1-e0b1-4177-8115-24f3eb4290f0', 2, 'support@pterodactyl.io', 'Team Fortress 2', 'Team Fortress 2 is a team-based first-person shooter multiplayer video game developed and published by Valve Corporation. It is the sequel to the 1996 mod Team Fortress for Quake and its 1999 remake.', 'quay.io/pterodactyl/core:source', '{}', '{\r\n    \"done\": \"gameserver Steam ID\",\r\n    \"userInteraction\": []\r\n}', '{\r\n    \"custom\": true,\r\n    \"location\": \"logs/latest.log\"\r\n}', 'quit', NULL, './srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart', 'ubuntu:18.04', NULL, 'bash', 1, '#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends install curl lib32gcc1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(13, 'a3494c96-95f4-4c0c-8af7-d9b30e60d1d1', 3, 'support@pterodactyl.io', 'Teamspeak3 Server', 'VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.', 'quay.io/parkervcp/pterodactyl-images:base_debian', '{}', '{\r\n    \"done\": \"listening on 0.0.0.0:\",\r\n    \"userInteraction\": []\r\n}', '{\r\n    \"custom\": true,\r\n    \"location\": \"logs/ts3.log\"\r\n}', '^C', NULL, './ts3server default_voice_port={{SERVER_PORT}} query_port={{SERVER_PORT}} filetransfer_ip=0.0.0.0 filetransfer_port={{FILE_TRANSFER}} license_accepted=1', 'alpine:3.9', NULL, 'ash', 1, '#!/bin/ash\r\n# TS3 Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napk add --no-cache tar curl jq\r\n\r\nif [ -z ${TS_VERSION} ] || [ ${TS_VERSION} == latest ]; then\r\n    TS_VERSION=$(wget https://teamspeak.com/versions/server.json -qO - | jq -r \'.linux.x86_64.version\')\r\nfi\r\n\r\ncd /mnt/server\r\n\r\n\r\necho -e \"getting files from http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2\"\r\ncurl http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2 | tar xj --strip-components=1', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(14, '9ac73929-08d8-440b-a69a-7c56451401e0', 4, 'support@pterodactyl.io', 'Rust', 'The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.', 'quay.io/pterodactyl/core:rust', '{}', '{\r\n    \"done\": \"Server startup complete\",\r\n    \"userInteraction\": []\r\n}', '{\r\n    \"custom\": false,\r\n    \"location\": \"latest.log\"\r\n}', 'quit', NULL, './RustDedicated -batchmode +server.port {{SERVER_PORT}} +server.identity \"rust\" +rcon.port {{RCON_PORT}} +rcon.web true +server.hostname \\\"{{HOSTNAME}}\\\" +server.level \\\"{{LEVEL}}\\\" +server.description \\\"{{DESCRIPTION}}\\\" +server.url \\\"{{SERVER_URL}}\\\" +server.headerimage \\\"{{SERVER_IMG}}\\\" +server.worldsize \\\"{{WORLD_SIZE}}\\\" +server.seed \\\"{{WORLD_SEED}}\\\" +server.maxplayers {{MAX_PLAYERS}} +rcon.password \\\"{{RCON_PASS}}\\\" +server.saveinterval {{SAVEINTERVAL}} {{ADDITIONAL_ARGS}}', 'ubuntu:16.04', NULL, 'bash', 1, 'apt update\r\napt -y --no-install-recommends install curl unzip lib32gcc1 ca-certificates\r\ncd /tmp\r\ncurl -sSL -o steamcmd.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz\r\n\r\nmkdir -p /mnt/server/steam\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steam\r\ncd /mnt/server/steam\r\nchown -R root:root /mnt\r\n\r\nexport HOME=/mnt/server\r\n./steamcmd.sh +login anonymous +force_install_dir /mnt/server +app_update 258550 +quit\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v /mnt/server/steam/linux32/steamclient.so /mnt/server/.steam/sdk32/steamclient.so', '2020-09-17 23:37:42', '2020-09-17 23:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `egg_mount`
--

CREATE TABLE `egg_mount` (
  `egg_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `egg_variables`
--

CREATE TABLE `egg_variables` (
  `id` int(10) UNSIGNED NOT NULL,
  `egg_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `env_variable` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_viewable` tinyint(3) UNSIGNED NOT NULL,
  `user_editable` tinyint(3) UNSIGNED NOT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `egg_variables`
--

INSERT INTO `egg_variables` (`id`, `egg_id`, `name`, `description`, `env_variable`, `default_value`, `user_viewable`, `user_editable`, `rules`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bungeecord Version', 'The version of Bungeecord to download and use.', 'BUNGEE_VERSION', 'latest', 1, 1, 'required|alpha_num|between:1,6', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(2, 1, 'Bungeecord Jar File', 'The name of the Jarfile to use when running Bungeecord.', 'SERVER_JARFILE', 'bungeecord.jar', 1, 1, 'required|regex:/^([\\w\\d._-]+)(\\.jar)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(3, 2, 'Server Jar File', 'The name of the Jarfile to use when running Forge Mod.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|regex:/^([\\w\\d._-]+)(\\.jar)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(4, 2, 'Forge version', 'The version of minecraft you want to install for.\r\n\r\nLeaving latest will install the latest recommended version.', 'MC_VERSION', 'latest', 1, 1, 'required|string|max:9', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(5, 2, 'Build Type', 'The type of server jar to download from forge.\r\n\r\nValid types are \"recommended\" and \"latest\".', 'BUILD_TYPE', 'recommended', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(6, 2, 'Forge Version', 'Gets an exact version.\r\n\r\nEx. 1.15.2-31.2.4\r\n\r\nOverrides MC_VERSION and BUILD_TYPE. If it fails to download the server files it will fail to install.', 'FORGE_VERSION', '', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(7, 3, 'Minecraft Version', 'The version of minecraft to download. \r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.', 'MINECRAFT_VERSION', 'latest', 1, 0, 'nullable|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(8, 3, 'Server Jar File', 'The name of the server jarfile to run the server with.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(9, 3, 'Download Path', 'A URL to use to download a server.jar rather than the ones in the install script. This is not user viewable.', 'DL_PATH', '', 0, 0, 'nullable|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(10, 3, 'Build Number', 'The build number for the paper release.\r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.', 'BUILD_NUMBER', 'latest', 1, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(11, 4, 'Sponge Version', 'The version of SpongeVanilla to download and use.', 'SPONGE_VERSION', '1.11.2-6.1.0-BETA-21', 1, 0, 'required|regex:/^([a-zA-Z0-9.\\-_]+)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(12, 4, 'Server Jar File', 'The name of the Jarfile to use when running SpongeVanilla.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|regex:/^([\\w\\d._-]+)(\\.jar)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(13, 5, 'Server Jar File', 'The name of the server jarfile to run the server with.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|regex:/^([\\w\\d._-]+)(\\.jar)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(14, 5, 'Server Version', 'The version of Minecraft Vanilla to install. Use \"latest\" to install the latest version.', 'VANILLA_VERSION', 'latest', 1, 1, 'required|string|between:3,15', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(15, 6, 'Server Name', 'ARK server name', 'SESSION_NAME', 'ARK SERVER', 1, 1, 'required|string|max:128', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(16, 6, 'Server Password', 'If specified, players must provide this password to join the server.', 'ARK_PASSWORD', '', 1, 1, 'nullable|alpha_dash|between:1,100', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(17, 6, 'Admin Password', 'If specified, players must provide this password (via the in-game console) to gain access to administrator commands on the server.', 'ARK_ADMIN_PASSWORD', '', 1, 1, 'nullable|alpha_dash|between:1,100', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(18, 6, 'Server Port', 'ARK server port used by client.', 'PORT', '7777', 1, 1, 'required|numeric', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(19, 6, 'Use Rcon', 'Enable or disable rcon system. (true or false)', 'ENABLE_RCON', 'false', 1, 1, 'required|string|max:5', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(20, 6, 'Rcon Port', 'ARK rcon port used by rcon tools.', 'RCON_PORT', '27020', 1, 1, 'required|numeric', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(21, 6, 'Query Port', 'ARK query port used by steam server browser and ark client server browser.', 'QUERY_PORT', '27015', 1, 1, 'required|numeric', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(22, 6, 'Maximum Players', 'Specifies the maximum number of players that can play on the server simultaneously.', 'SERVER_MAX_PLAYERS', '20', 1, 1, 'required|numeric|digits_between:1,4', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(23, 6, 'App ID', 'ARK steam app id for auto updates. Leave blank to avoid auto update.', 'SRCDS_APPID', '376030', 1, 0, 'nullable|numeric', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(24, 6, 'Server Map', 'Available Maps: TheIsland, TheCenter, Ragnarok, ScorchedEarth_P, Aberration_P, Extinction', 'SERVER_MAP', 'TheIsland', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(25, 7, 'Map', 'The default map for the server.', 'SRCDS_MAP', 'de_dust2', 1, 1, 'required|string|alpha_dash', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(26, 7, 'Steam Account Token', 'The Steam Account Token required for the server to be displayed publicly.', 'STEAM_ACC', '', 1, 1, 'required|string|alpha_num|size:32', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(27, 7, 'Source AppID', 'Required for game to update on server restart. Do not modify this.', 'SRCDS_APPID', '740', 0, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(28, 8, 'Game ID', 'The ID corresponding to the game to download and run using SRCDS.', 'SRCDS_APPID', '', 1, 0, 'required|numeric|digits_between:1,6', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(29, 8, 'Game Name', 'The name corresponding to the game to download and run using SRCDS.', 'SRCDS_GAME', '', 1, 0, 'required|alpha_dash|between:1,100', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(30, 8, 'Map', 'The default map for the server.', 'SRCDS_MAP', '', 1, 1, 'required|string|alpha_dash', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(31, 9, 'Map', 'The default map for the server.', 'SRCDS_MAP', 'gm_flatgrass', 1, 1, 'required|string|alpha_dash', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(32, 9, 'Steam Account Token', 'The Steam Account Token required for the server to be displayed publicly.', 'STEAM_ACC', '', 1, 1, 'nullable|string|alpha_num|size:32', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(33, 9, 'Source AppID', 'Required for game to update on server restart. Do not modify this.', 'SRCDS_APPID', '4020', 0, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(34, 9, 'Workshop ID', 'The ID of your workshop collection (the numbers at the end of the URL)', 'WORKSHOP_ID', '', 1, 1, 'nullable|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(35, 9, 'Gamemode', 'The gamemode of your server.', 'GAMEMODE', 'sandbox', 1, 1, 'required|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(36, 9, 'Max Players', 'The maximum amount of players allowed on your game server.', 'MAX_PLAYERS', '32', 1, 1, 'required|integer|max:128', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(37, 9, 'Tickrate', 'The tickrate defines how fast the server will update each entities location.', 'TICKRATE', '22', 1, 1, 'required|integer|max:100', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(38, 10, 'Game ID', 'The ID corresponding to the game to download and run using SRCDS.', 'SRCDS_APPID', '237410', 1, 0, 'required|regex:/^(237410)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(39, 10, 'Game Name', 'The name corresponding to the game to download and run using SRCDS.', 'SRCDS_GAME', 'insurgency', 1, 0, 'required|regex:/^(insurgency)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(40, 10, 'Default Map', 'The default map to use when starting the server.', 'SRCDS_MAP', 'sinjar', 1, 1, 'required|regex:/^(\\w{1,20})$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(41, 11, 'Game ID', 'The ID corresponding to the game to download and run using SRCDS.', 'SRCDS_APPID', '232250', 1, 0, 'required|regex:/^(232250)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(42, 11, 'Game Name', 'The name corresponding to the game to download and run using SRCDS.', 'SRCDS_GAME', 'tf', 1, 0, 'required|regex:/^(tf)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(43, 11, 'Default Map', 'The default map to use when starting the server.', 'SRCDS_MAP', 'cp_dustbowl', 1, 1, 'required|regex:/^(\\w{1,20})$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(44, 12, 'Maximum Users', 'Maximum concurrent users on the mumble server.', 'MAX_USERS', '100', 1, 0, 'required|numeric|digits_between:1,5', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(45, 12, 'Server Version', 'Version of Mumble Server to download and use.', 'MUMBLE_VERSION', '1.3.1', 1, 1, 'required|regex:/^([0-9_\\.-]{5,8})$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(46, 13, 'Server Version', 'The version of Teamspeak 3 to use when running the server.', 'TS_VERSION', 'latest', 1, 1, 'required|string|max:6', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(47, 13, 'File Transfer Port', 'The Teamspeak file transfer port', 'FILE_TRANSFER', '30033', 1, 0, 'required|integer|between:1,65535', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(48, 14, 'Server Name', 'The name of your server in the public server list.', 'HOSTNAME', 'A Rust Server', 1, 1, 'required|string|max:40', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(49, 14, 'OxideMod', 'Set whether you want the server to use and auto update OxideMod or not. Valid options are \"1\" for true and \"0\" for false.', 'OXIDE', '0', 1, 1, 'required|boolean', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(50, 14, 'Level', 'The world file for Rust to use.', 'LEVEL', 'Procedural Map', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(51, 14, 'Description', 'The description under your server title. Commonly used for rules & info. Use \\n for newlines.', 'DESCRIPTION', 'Powered by Pterodactyl', 1, 1, 'required|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(52, 14, 'URL', 'The URL for your server. This is what comes up when clicking the \"Visit Website\" button.', 'SERVER_URL', 'http://pterodactyl.io', 1, 1, 'nullable|url', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(53, 14, 'World Size', 'The world size for a procedural map.', 'WORLD_SIZE', '3000', 1, 1, 'required|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(54, 14, 'World Seed', 'The seed for a procedural map.', 'WORLD_SEED', '', 1, 1, 'nullable|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(55, 14, 'Max Players', 'The maximum amount of players allowed in the server at once.', 'MAX_PLAYERS', '40', 1, 1, 'required|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(56, 14, 'Server Image', 'The header image for the top of your server listing.', 'SERVER_IMG', '', 1, 1, 'nullable|url', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(57, 14, 'RCON Port', 'Port for RCON connections.', 'RCON_PORT', '28016', 1, 0, 'required|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(58, 14, 'RCON Password', 'RCON access password.', 'RCON_PASS', 'CHANGEME', 1, 1, 'required|string|max:64', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(59, 14, 'Save Interval', 'Sets the server’s auto-save interval in seconds.', 'SAVEINTERVAL', '60', 1, 1, 'required|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(60, 14, 'Additional Arguments', 'Add additional startup parameters to the server.', 'ADDITIONAL_ARGS', '', 1, 1, 'nullable|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL,
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `failed_at`, `exception`) VALUES
(1, 'database', 'standard', '{\"uuid\":\"98ee7edf-c986-4d66-ac08-3fb91d2c6ded\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";N;s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"b92f3e74-befb-4b31-b32e-c7b39736978b\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', '2020-09-17 23:39:46', 'Swift_TransportException: Cannot send message without a sender address in /app/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:195\nStack trace:\n#0 /app/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(71): Swift_Transport_AbstractSmtpTransport->send(Object(Swift_Message), Array)\n#1 /app/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#2 /app/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#3 /app/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#4 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(146): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(Pterodactyl\\Models\\User), Object(Pterodactyl\\Notifications\\AccountCreated))\n#5 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(105): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(Pterodactyl\\Models\\User), \'9dc2880b-cbb0-4...\', Object(Pterodactyl\\Notifications\\AccountCreated), \'mail\')\n#6 /app/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#7 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(107): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#8 /app/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Pterodactyl\\Notifications\\AccountCreated), Array)\n#9 /app/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Pterodactyl\\Notifications\\AccountCreated), Array)\n#10 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#11 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#12 /app/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /app/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#19 /app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#21 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#22 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#25 /app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 /app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'high,standard,l...\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'high,standard,l...\')\n#31 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(33): call_user_func_array(Array, Array)\n#33 /app/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#34 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(91): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#35 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#36 /app/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#37 /app/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#38 /app/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 /app/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /app/vendor/symfony/console/Application.php(911): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 /app/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /app/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /app/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /app/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 {main}'),
(2, 'database', 'standard', '{\"uuid\":\"3977f80e-406f-4bd0-b98a-2cfbf2631592\",\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":13:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":11:{s:5:\\\"token\\\";s:64:\\\"f636b86b2371877456cd5bbef7dffd0f5f3fa349e510a5a666e0a9bcdc85098c\\\";s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"7815df56-0162-421c-a8b2-a17e3bb58614\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', '2020-10-06 11:05:09', 'Swift_TransportException: Cannot send message without a sender address in /app/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:195\nStack trace:\n#0 /app/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(71): Swift_Transport_AbstractSmtpTransport->send(Object(Swift_Message), Array)\n#1 /app/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send(Object(Swift_Message), Array)\n#2 /app/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#3 /app/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(65): Illuminate\\Mail\\Mailer->send(Object(Illuminate\\Support\\HtmlString), Array, Object(Closure))\n#4 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(Pterodactyl\\Models\\User), Object(Pterodactyl\\Notifications\\AccountCreated))\n#5 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(Pterodactyl\\Models\\User), \'fff716fe-8684-4...\', Object(Pterodactyl\\Notifications\\AccountCreated), \'mail\')\n#6 /app/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#7 /app/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#8 /app/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Pterodactyl\\Notifications\\AccountCreated), Array)\n#9 /app/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(94): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Pterodactyl\\Notifications\\AccountCreated), Array)\n#10 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#11 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array(Array, Array)\n#12 /app/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /app/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#19 /app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#21 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#22 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#25 /app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 /app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 /app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'database\', \'high,standard,l...\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 /app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'high,standard,l...\')\n#31 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): call_user_func_array(Array, Array)\n#33 /app/vendor/laravel/framework/src/Illuminate/Container/Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#34 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#35 /app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#36 /app/vendor/laravel/framework/src/Illuminate/Container/Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#37 /app/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#38 /app/vendor/symfony/console/Command/Command.php(258): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 /app/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /app/vendor/symfony/console/Application.php(920): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 /app/vendor/symfony/console/Application.php(266): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /app/vendor/symfony/console/Application.php(142): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /app/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /app/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 {main}');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `short` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `short`, `long`, `created_at`, `updated_at`) VALUES
(1, 'cork.ie', 'cork', '2020-09-18 16:00:06', '2020-09-18 16:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_01_23_195641_add_allocations_table', 1),
(2, '2016_01_23_195851_add_api_keys', 1),
(3, '2016_01_23_200044_add_api_permissions', 1),
(4, '2016_01_23_200159_add_downloads', 1),
(5, '2016_01_23_200421_create_failed_jobs_table', 1),
(6, '2016_01_23_200440_create_jobs_table', 1),
(7, '2016_01_23_200528_add_locations', 1),
(8, '2016_01_23_200648_add_nodes', 1),
(9, '2016_01_23_201433_add_password_resets', 1),
(10, '2016_01_23_201531_add_permissions', 1),
(11, '2016_01_23_201649_add_server_variables', 1),
(12, '2016_01_23_201748_add_servers', 1),
(13, '2016_01_23_202544_add_service_options', 1),
(14, '2016_01_23_202731_add_service_varibles', 1),
(15, '2016_01_23_202943_add_services', 1),
(16, '2016_01_23_203119_create_settings_table', 1),
(17, '2016_01_23_203150_add_subusers', 1),
(18, '2016_01_23_203159_add_users', 1),
(19, '2016_01_23_203947_create_sessions_table', 1),
(20, '2016_01_25_234418_rename_permissions_column', 1),
(21, '2016_02_07_172148_add_databases_tables', 1),
(22, '2016_02_07_181319_add_database_servers_table', 1),
(23, '2016_02_13_154306_add_service_option_default_startup', 1),
(24, '2016_02_20_155318_add_unique_service_field', 1),
(25, '2016_02_27_163411_add_tasks_table', 1),
(26, '2016_02_27_163447_add_tasks_log_table', 1),
(27, '2016_03_18_155649_add_nullable_field_lastrun', 1),
(28, '2016_08_30_212718_add_ip_alias', 1),
(29, '2016_08_30_213301_modify_ip_storage_method', 1),
(30, '2016_09_01_193520_add_suspension_for_servers', 1),
(31, '2016_09_01_211924_remove_active_column', 1),
(32, '2016_09_02_190647_add_sftp_password_storage', 1),
(33, '2016_09_04_171338_update_jobs_tables', 1),
(34, '2016_09_04_172028_update_failed_jobs_table', 1),
(35, '2016_09_04_182835_create_notifications_table', 1),
(36, '2016_09_07_163017_add_unique_identifier', 1),
(37, '2016_09_14_145945_allow_longer_regex_field', 1),
(38, '2016_09_17_194246_add_docker_image_column', 1),
(39, '2016_09_21_165554_update_servers_column_name', 1),
(40, '2016_09_29_213518_rename_double_insurgency', 1),
(41, '2016_10_07_152117_build_api_log_table', 1),
(42, '2016_10_14_164802_update_api_keys', 1),
(43, '2016_10_23_181719_update_misnamed_bungee', 1),
(44, '2016_10_23_193810_add_foreign_keys_servers', 1),
(45, '2016_10_23_201624_add_foreign_allocations', 1),
(46, '2016_10_23_202222_add_foreign_api_keys', 1),
(47, '2016_10_23_202703_add_foreign_api_permissions', 1),
(48, '2016_10_23_202953_add_foreign_database_servers', 1),
(49, '2016_10_23_203105_add_foreign_databases', 1),
(50, '2016_10_23_203335_add_foreign_nodes', 1),
(51, '2016_10_23_203522_add_foreign_permissions', 1),
(52, '2016_10_23_203857_add_foreign_server_variables', 1),
(53, '2016_10_23_204157_add_foreign_service_options', 1),
(54, '2016_10_23_204321_add_foreign_service_variables', 1),
(55, '2016_10_23_204454_add_foreign_subusers', 1),
(56, '2016_10_23_204610_add_foreign_tasks', 1),
(57, '2016_11_04_000949_add_ark_service_option_fixed', 1),
(58, '2016_11_11_220649_add_pack_support', 1),
(59, '2016_11_11_231731_set_service_name_unique', 1),
(60, '2016_11_27_142519_add_pack_column', 1),
(61, '2016_12_01_173018_add_configurable_upload_limit', 1),
(62, '2016_12_02_185206_correct_service_variables', 1),
(63, '2017_01_03_150436_fix_misnamed_option_tag', 1),
(64, '2017_01_07_154228_create_node_configuration_tokens_table', 1),
(65, '2017_01_12_135449_add_more_user_data', 1),
(66, '2017_02_02_175548_UpdateColumnNames', 1),
(67, '2017_02_03_140948_UpdateNodesTable', 1),
(68, '2017_02_03_155554_RenameColumns', 1),
(69, '2017_02_05_164123_AdjustColumnNames', 1),
(70, '2017_02_05_164516_AdjustColumnNamesForServicePacks', 1),
(71, '2017_02_09_174834_SetupPermissionsPivotTable', 1),
(72, '2017_02_10_171858_UpdateAPIKeyColumnNames', 1),
(73, '2017_03_03_224254_UpdateNodeConfigTokensColumns', 1),
(74, '2017_03_05_212803_DeleteServiceExecutableOption', 1),
(75, '2017_03_10_162934_AddNewServiceOptionsColumns', 1),
(76, '2017_03_10_173607_MigrateToNewServiceSystem', 1),
(77, '2017_03_11_215455_ChangeServiceVariablesValidationRules', 1),
(78, '2017_03_12_150648_MoveFunctionsFromFileToDatabase', 1),
(79, '2017_03_14_175631_RenameServicePacksToSingluarPacks', 1),
(80, '2017_03_14_200326_AddLockedStatusToTable', 1),
(81, '2017_03_16_181109_ReOrganizeDatabaseServersToDatabaseHost', 1),
(82, '2017_03_16_181515_CleanupDatabasesDatabase', 1),
(83, '2017_03_18_204953_AddForeignKeyToPacks', 1),
(84, '2017_03_31_221948_AddServerDescriptionColumn', 1),
(85, '2017_04_02_163232_DropDeletedAtColumnFromServers', 1),
(86, '2017_04_15_125021_UpgradeTaskSystem', 1),
(87, '2017_04_20_171943_AddScriptsToServiceOptions', 1),
(88, '2017_04_21_151432_AddServiceScriptTrackingToServers', 1),
(89, '2017_04_27_145300_AddCopyScriptFromColumn', 1),
(90, '2017_04_27_223629_AddAbilityToDefineConnectionOverSSLWithDaemonBehindProxy', 1),
(91, '2017_05_01_141528_DeleteDownloadTable', 1),
(92, '2017_05_01_141559_DeleteNodeConfigurationTable', 1),
(93, '2017_06_10_152951_add_external_id_to_users', 1),
(94, '2017_06_25_133923_ChangeForeignKeyToBeOnCascadeDelete', 1),
(95, '2017_07_08_152806_ChangeUserPermissionsToDeleteOnUserDeletion', 1),
(96, '2017_07_08_154416_SetAllocationToReferenceNullOnServerDelete', 1),
(97, '2017_07_08_154650_CascadeDeletionWhenAServerOrVariableIsDeleted', 1),
(98, '2017_07_24_194433_DeleteTaskWhenParentServerIsDeleted', 1),
(99, '2017_08_05_115800_CascadeNullValuesForDatabaseHostWhenNodeIsDeleted', 1),
(100, '2017_08_05_144104_AllowNegativeValuesForOverallocation', 1),
(101, '2017_08_05_174811_SetAllocationUnqiueUsingMultipleFields', 1),
(102, '2017_08_15_214555_CascadeDeletionWhenAParentServiceIsDeleted', 1),
(103, '2017_08_18_215428_RemovePackWhenParentServiceOptionIsDeleted', 1),
(104, '2017_09_10_225749_RenameTasksTableForStructureRefactor', 1),
(105, '2017_09_10_225941_CreateSchedulesTable', 1),
(106, '2017_09_10_230309_CreateNewTasksTableForSchedules', 1),
(107, '2017_09_11_002938_TransferOldTasksToNewScheduler', 1),
(108, '2017_09_13_211810_UpdateOldPermissionsToPointToNewScheduleSystem', 1),
(109, '2017_09_23_170933_CreateDaemonKeysTable', 1),
(110, '2017_09_23_173628_RemoveDaemonSecretFromServersTable', 1),
(111, '2017_09_23_185022_RemoveDaemonSecretFromSubusersTable', 1),
(112, '2017_10_02_202000_ChangeServicesToUseAMoreUniqueIdentifier', 1),
(113, '2017_10_02_202007_ChangeToABetterUniqueServiceConfiguration', 1),
(114, '2017_10_03_233202_CascadeDeletionWhenServiceOptionIsDeleted', 1),
(115, '2017_10_06_214026_ServicesToNestsConversion', 1),
(116, '2017_10_06_214053_ServiceOptionsToEggsConversion', 1),
(117, '2017_10_06_215741_ServiceVariablesToEggVariablesConversion', 1),
(118, '2017_10_24_222238_RemoveLegacySFTPInformation', 1),
(119, '2017_11_11_161922_Add2FaLastAuthorizationTimeColumn', 1),
(120, '2017_11_19_122708_MigratePubPrivFormatToSingleKey', 1),
(121, '2017_12_04_184012_DropAllocationsWhenNodeIsDeleted', 1),
(122, '2017_12_12_220426_MigrateSettingsTableToNewFormat', 1),
(123, '2018_01_01_122821_AllowNegativeValuesForServerSwap', 1),
(124, '2018_01_11_213943_AddApiKeyPermissionColumns', 1),
(125, '2018_01_13_142012_SetupTableForKeyEncryption', 1),
(126, '2018_01_13_145209_AddLastUsedAtColumn', 1),
(127, '2018_02_04_145617_AllowTextInUserExternalId', 1),
(128, '2018_02_10_151150_remove_unique_index_on_external_id_column', 1),
(129, '2018_02_17_134254_ensure_unique_allocation_id_on_servers_table', 1),
(130, '2018_02_24_112356_add_external_id_column_to_servers_table', 1),
(131, '2018_02_25_160152_remove_default_null_value_on_table', 1),
(132, '2018_02_25_160604_define_unique_index_on_users_external_id', 1),
(133, '2018_03_01_192831_add_database_and_port_limit_columns_to_servers_table', 1),
(134, '2018_03_15_124536_add_description_to_nodes', 1),
(135, '2018_05_04_123826_add_maintenance_to_nodes', 1),
(136, '2018_09_03_143756_allow_egg_variables_to_have_longer_values', 1),
(137, '2018_09_03_144005_allow_server_variables_to_have_longer_values', 1),
(138, '2019_03_02_142328_set_allocation_limit_default_null', 1),
(139, '2019_03_02_151321_fix_unique_index_to_account_for_host', 1),
(140, '2020_03_22_163911_merge_permissions_table_into_subusers', 1),
(141, '2020_03_22_164814_drop_permissions_table', 1),
(142, '2020_04_03_203624_add_threads_column_to_servers_table', 1),
(143, '2020_04_03_230614_create_backups_table', 1),
(144, '2020_04_04_131016_add_table_server_transfers', 1),
(145, '2020_04_10_141024_store_node_tokens_as_encrypted_value', 1),
(146, '2020_04_17_203438_allow_nullable_descriptions', 1),
(147, '2020_04_22_055500_add_max_connections_column', 1),
(148, '2020_04_26_111208_add_backup_limit_to_servers', 1),
(149, '2020_05_20_234655_add_mounts_table', 1),
(150, '2020_05_21_192756_add_mount_server_table', 1),
(151, '2020_07_02_213612_create_user_recovery_tokens_table', 1),
(152, '2020_07_09_201845_add_notes_column_for_allocations', 1),
(153, '2020_08_20_205533_add_backup_state_column_to_backups', 1),
(154, '2020_08_22_132500_update_bytes_to_unsigned_bigint', 1),
(155, '2020_08_23_175331_modify_checksums_column_for_backups', 1),
(156, '2020_09_13_110007_drop_packs_from_servers', 1),
(157, '2020_09_13_110021_drop_packs_from_api_key_permissions', 1),
(158, '2020_09_13_110047_drop_packs_table', 1),
(159, '2020_09_13_113503_drop_daemon_key_table', 1),
(160, '2020_04_28_034007_add_oauth_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mounts`
--

CREATE TABLE `mounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_only` tinyint(3) UNSIGNED NOT NULL,
  `user_mountable` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mount_node`
--

CREATE TABLE `mount_node` (
  `node_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mount_server`
--

CREATE TABLE `mount_server` (
  `server_id` int(11) NOT NULL,
  `mount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nests`
--

CREATE TABLE `nests` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nests`
--

INSERT INTO `nests` (`id`, `uuid`, `author`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '1bd59a12-ad53-4cb0-9a62-00f56f9cb2e7', 'support@pterodactyl.io', 'Minecraft', 'Minecraft - the classic game from Mojang. With support for Vanilla MC, Spigot, and many others!', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(2, 'a792420e-9e27-4130-84c0-6ed243e6626a', 'support@pterodactyl.io', 'Source Engine', 'Includes support for most Source Dedicated Server games.', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(3, 'c10ea164-85bf-4f11-890a-4135d324f6e6', 'support@pterodactyl.io', 'Voice Servers', 'Voice servers such as Mumble and Teamspeak 3.', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(4, '3bd5d409-5e57-4652-a4b0-3cf1cca46e91', 'support@pterodactyl.io', 'Rust', 'Rust - A game where you must fight to survive.', '2020-09-17 23:37:42', '2020-09-17 23:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `nodes`
--

CREATE TABLE `nodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_id` int(10) UNSIGNED NOT NULL,
  `fqdn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https',
  `behind_proxy` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `memory` int(10) UNSIGNED NOT NULL,
  `memory_overallocate` int(11) NOT NULL DEFAULT '0',
  `disk` int(10) UNSIGNED NOT NULL,
  `disk_overallocate` int(11) NOT NULL DEFAULT '0',
  `upload_size` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `daemon_token_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daemon_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daemonListen` smallint(5) UNSIGNED NOT NULL DEFAULT '8080',
  `daemonSFTP` smallint(6) NOT NULL DEFAULT '2022',
  `daemonBase` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/home/daemon-files',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`id`, `uuid`, `public`, `name`, `description`, `location_id`, `fqdn`, `scheme`, `behind_proxy`, `maintenance_mode`, `memory`, `memory_overallocate`, `disk`, `disk_overallocate`, `upload_size`, `daemon_token_id`, `daemon_token`, `daemonListen`, `daemonSFTP`, `daemonBase`, `created_at`, `updated_at`) VALUES
(1, '2619c456-1526-4c58-95a1-66fe3bc75af7', 1, 'test', 'test', 1, 'games-daemon.netsoc.local', 'http', 0, 0, 100, 100, 100, 100, 100, 'F99ENnPSLTlVdKvD', 'eyJpdiI6ImttSS90S0RadUM3akdqaTRIQi9VeEE9PSIsInZhbHVlIjoiZTFQQWpEdEM4OHlZZ1N2RXQzZXBITFdFNkNYd0ovaHVVUkVIcVZrQWR5ejZ4WHk4VGpKTG9KOUZFcWsrZ01nSGhXYkZkd2lCcXg3ckRHUWZkSXhoVVdxZW83VlFGWUFLeWpSOHpTenR3WnM9IiwibWFjIjoiNGVhMjE5MzEyNGMwYzUwNjIwMTgyYzFlZTJiZTYzMGRmNTU1Nzg3YzEyMmUxZTM1NDFlZWUwNjczOTgwYjllMCJ9', 8080, 2022, '/var/lib/pterodactyl/volumes', '2020-09-18 16:01:17', '2020-09-18 16:01:17');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('eric@example.com', '$2y$10$rP78kwieW.gnuPibVSa18OduupQkcTq.4KbYH/XAEhvJluNVXRri.', '2020-10-06 11:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `recovery_tokens`
--

CREATE TABLE `recovery_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_day_of_week` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_day_of_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_hour` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cron_minute` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_processing` tinyint(1) NOT NULL,
  `last_run_at` timestamp NULL DEFAULT NULL,
  `next_run_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuidShort` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `skip_scripts` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `memory` int(10) UNSIGNED NOT NULL,
  `swap` int(11) NOT NULL,
  `disk` int(10) UNSIGNED NOT NULL,
  `io` int(10) UNSIGNED NOT NULL,
  `cpu` int(10) UNSIGNED NOT NULL,
  `threads` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oom_disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `allocation_id` int(10) UNSIGNED NOT NULL,
  `nest_id` int(10) UNSIGNED NOT NULL,
  `egg_id` int(10) UNSIGNED NOT NULL,
  `startup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `installed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `allocation_limit` int(10) UNSIGNED DEFAULT NULL,
  `database_limit` int(10) UNSIGNED DEFAULT '0',
  `backup_limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `external_id`, `uuid`, `uuidShort`, `node_id`, `name`, `description`, `skip_scripts`, `suspended`, `owner_id`, `memory`, `swap`, `disk`, `io`, `cpu`, `threads`, `oom_disabled`, `allocation_id`, `nest_id`, `egg_id`, `startup`, `image`, `installed`, `allocation_limit`, `database_limit`, `backup_limit`, `created_at`, `updated_at`) VALUES
(1, NULL, '5f336a0a-f78b-43d5-a212-f182861d775c', '5f336a0a', 1, 'Test', 'test', 0, 0, 1, 100, 0, 100, 500, 100, '6', 1, 1, 1, 1, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}', 'quay.io/pterodactyl/core:java', 1, 0, 0, 0, '2020-09-18 16:05:11', '2020-09-18 16:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `server_transfers`
--

CREATE TABLE `server_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `successful` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `old_node` int(10) UNSIGNED NOT NULL,
  `new_node` int(10) UNSIGNED NOT NULL,
  `old_allocation` int(10) UNSIGNED NOT NULL,
  `new_allocation` int(10) UNSIGNED NOT NULL,
  `old_additional_allocations` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_additional_allocations` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server_variables`
--

CREATE TABLE `server_variables` (
  `id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED DEFAULT NULL,
  `variable_id` int(10) UNSIGNED NOT NULL,
  `variable_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `server_variables`
--

INSERT INTO `server_variables` (`id`, `server_id`, `variable_id`, `variable_value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'latest', NULL, NULL),
(2, 1, 2, 'bungeecord.jar', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3DTSgdxuM7gILYO6BRp8KzForUy7T5AAkT5V6web', 2, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJa0ZSTlhGU0x6Tk1ZMGx2YURRMU1UWm1hRkp3YmxFOVBTSXNJblpoYkhWbElqb2lWakZEYURSTVRtRmxORTVoY0RkWFYzUlhaM2R0UlVwaWRGTlFNM2hTUkcxb1VtOTVOVmMyTnpCNVpGUlpXRXB5UzI1R2FtZFNTRXBQWm5sUFRVRlNWVFpUVEdGWFltNVZNemRLVEZkR1NUUk5NMjl5U0VKMmVXMHlSWG8xZEdOaFpqbG9SamhMTjNJd2QxSXZaRWhKVDBSWk0wTnVjSFl6Y0doRWJFSkVZMjg1WVhvMVprNWxVSFZyVFdrMlRWSjRUa3RFZGxvM1RtTnBkbU41WVVGWVVWRmpUMU14VGpGbVpXZE5WR2RhZUZWMVUwaExWbnBMTDNKSE5VODNSbmxOVkVWUVIwRjNRM1EwY2psMk1HczNNRXhNWmtzckwwcGpRbnBXTjNSblYwUjViV3d4YUhVMk9FcHhOemRJZUM5M1NDdHZNSE5wVDNORGVqRXZSRFl4YTNvMkszQmhTbTlJU1M5WmRXbGFVV1JKYzFOR2VVRkdORzUxVmxKTGEzTlVlSE5wZEdaQlp6Vktla2RKZFd4S2FXcFdhbWRTY0hwcVJFVktWREpOUlhSaVRHd3pZV2hqYUd4Nk5VaGhSRWMyYkUxTE15OXVRM1o0WVhGdlQzZHhRM2RhT1VWR2F6RlJNRFJpVlhaTlVHbE1kVXB6TXpneVpYaENkR0ppVldSeFZGUXZTazB5U1ZGdVZubHpZbGxEYkRCQ1lrUmtiMVZPVjBOR00yWTBRWGhrYTBseFZrMDBUbVZXYmk4d2JEUmpWbGRPU2xObVJsTm9kM1V6VFUxa1JrMUZkMEZTWkhSWE0wNURaM0EyT0ZkNlZXcGpSRlZEY2pKSlRUbEdTamxQV0ZwVlZFSTNaV2hWTWpreVZVTmpVRWN4YWxwaVNUSnVlVzV2UkZsQ1VIUjFUWFJRUVVsMFdGQTNiR0ZRUVhOMlUwUjFlRkl4WTBGVWEySlJVRGhWYTJaa2VFWlJRblZMUnpaM1BTSXNJbTFoWXlJNklqQmhOekZpWVRZeE9UZGhOMkZtT1RsaE5tSTJOekExTkRjNE5tVmtZMlpqWldaak9EWmhPV0V4WkRJeU9EVXhNVFJoTURneFlqYzVPR1V6T0RFMU5qRWlmUT09', 1601995528),
('4UdLW4ifmqlRqSeaVu1FBQ0sqS3BpbUQOpVuYgq4', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJa1ZrY2s5MlJ5dHJMME5PT0N0SlYwWlBRbXQwZUZFOVBTSXNJblpoYkhWbElqb2lVRFZKY21SU1kzcEpNMUkwYTNKelYwWXhWbGxsYXpBelpFeG9NM0V3U1hSRlkwTTVlRXgzWm5aRVJXbERNMDVWUm5kUVJGaHVZbVZ4WkVaT1FXRm5UMFZMZDNWWGJDdFNRMVIzTTJVcmJWQmFXVzE2YjJnd2JtTndjbGwzV0VSc1ZUaEhUemRqTVhOSlZWQnZOVkUzZGxKT1JERjJSamxOV1hWVFZVc3Zaa0VyY0c1NWNUZHNkbGx0VEVsNFlVRmtVREp4Y1ZsSWJsSXZVMDFZVnpkb2NsTlFabVZJV210amRFTTVOVUZNY2taM05HTkpjbTQyYldkVmRWSnpMMlZIYzFCMFpXSm1OVEJOVTFkWFFsbDNURzVPVVZaNlpsZEhhakFyV0RONGVTdFlWV1pMZVhGWWVHTmtVVXBrVjB4dU5GQmhRamt5V1ZGaldsUTVaekpJWlRscVVsWXhRVTlqUmpZd1VVVTFjV1JET0hwWGRWcGpiRzVTTjBkWmFXVXdNMWxGUm1OUVJHbzVlVUlyVTJGWWVFOWhNMWt2VVZKNVFtTlZlamg1VUZZdmJITjFhVVV2VFRKd00zWTBTVTk1Y0ZVM1JIVkJWbXBVWW5CVFNHaDRVMUk0ZG1aMldVaGxXRVp0VWpsblp6VnBSM3BVYW05RE1XMUtVRFo2VmxnNVNqSTRTRXBhWTNwMk1HTnNha3MxVTNFeVUyVndRMEZKTnpCVFVVbHhTR2hqYWprM1pHVmFVME15YzNBelRWWmhSbTEyU1dvMFJqUllhMkppVjJ4cmQyRlhTRXhyYVhwdWNqUnlkR1JqZVRocVJrRktaWEI2VERoclpGaEJWVkF6YzNoSlNYVjVOVGxOUmpGeGRscEtlRWxaYjBrelJrbHlXVWxRUkhGaVUxUnNPR1pxUTBWb1dIWkJTRVZVUzBNMFduVjRPRzFpVUhkME9ERTBlVTU0VUVaT1ZscHBiaTlrVjNKRVpuZFBjMDFtTDNseFRGQmlTSFVyYXpCdU5UaEpTWFJCWjJ0WFJIbHBVRVJHWkd0RlRUVlZRWEZvZWpoU2Iya3JaVEZuTjA1b2IzWk1aWE1yTkU5QlQwdFVPVVZ3VVc1RVZ5dFVOV05OZW04MU4yc3Zibmd4ZFVGMFprb3lNakJDY0RCdFVVdE1jRE5FWW5kaVpUQnBSbm80U1hWMVkxcEVWbVpMTWxsaFdXSlRZMnBPWTBGak9VeEdRM0JvVEd0UU1rRmpiMVkwUTJwVFpHTnhhblZtY2sxbFRraHNTUzh5Y2sxaVNHZ3laRFJ1UW1WRWRUVlRZVTkwZGs0MVZEaHlNVEYxYUUxaVUwWnZXSGhFVDFRNVMwcE5UMlZ0V0ZOUE1tdHJaeloyVlRKdWNWY3laR2xMZEhGbFYwdFRhRXR1VlZWTGJGcDBSWFJQYW5GemVVdDFXQ3RLT0V0b09HZzBPRXBrVTJWQ0x6Uk9PSGx1U0hSaVEzQkpLMUJwWjBGT2ExZDFZMnR3UmxOVWJEWmxZWEJPY1Rrd0wwTlpObWxZV1ZCQmRscE9lVEpoWVU1VlpHUjFSblZsVlc4M1NFRmtVakJ3TldrdlEwcG9WSFZXUmtjeWVtMDVRMkZEU1drNE1ITjBWWFpGVm0xd1RHcGtSamx2ZUdSWVEwSlpOVE15ZHpaVlVrWXpPVTVWWld0NlIwRnhTa1JWVGxwM1drTmtaMGx6VkVzeEsyTm9WbUZJUzFFemFpczNRVDA5SWl3aWJXRmpJam9pTnpZeU1qWXlaRGhtTXpVNU1tUmxabVV5TkdKbU9XRmhNalE0TXpGaU9XWXlZekV5WVRZMVptVTRNell5WkRFeE9HRTFaakEyWkRrd1ltTmtObU5tT0NKOQ==', 1601984067),
('Ec48ML58Yz9oSsXjxndBMVj7AuGZvDdMO7ZZshcs', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJaTluTm05TmFrcHRiSGgyV0RKRWFWTlZZMEZGUmxFOVBTSXNJblpoYkhWbElqb2lNalJqUkZGNmIwODRNMlJyY0cxRE5FNUdTMnhCYzJORE1VdzRTbGRqV1RoT2NrdG9UVGR5VXl0aVdIUk5SVmd3TldoeFpWTlllVU5xUVVoMk1UWm5jVUZNVGxveVlsaGtSM0ZoY21oREwzTktRVXM1VDJGYU4zWnhUWGhLWW1JclMyNVlNMEk0TUdsWlowOUpOR0l2WlVaMWRXUXZOamRoZWk5Uk0yMUxUMlV6UzJwc2R6TlRkWFpJUmtNMGNGazRaUzlFU1VSbGMwaGlObkkwY3paalJEQmpObVE0VUhaSVZWRklXSEpuVVVobFdHdEdhVmRKVlhnNFZtNTFla3A0V25CdFVVMDJTbmRyVEZkck9HeERhRWRpWTFseVpVeFlVME0yVVhjMGJtUXdPRFJPTlhKUE5WTldkSFE1T1M5SVl6UlZSR1F4Y0hScVdGSktieTlLVGpsWlRsTnlUbEV2YUhkNGF6QnhMekZhWTFKMVJVTkNaRUo2WlZoWEwyVkljWFZRTDNsamIzQkVNR1o1ZEUxNGNtOU5aR042Y1dWR1dVWnBTVFI1YjFWMk0xbGtkVlIwTldkUlVpdFRORGRVYUVobVFWWk9NV3RwZEZGRWQzQXlUbEZ5U21wbFZsWnBOVTVVUVM5d1RuZFpUVGhEU0ZKeGJrTnRiVk5CTWtweFkxQlBUVFYzZW5kQ1UzbFFiMmNyYldJM09IcFRVbGsxVVVZNE1tRkpNazVpZUROcVZWTkdjMVEzYkRkWE9HbDRWVTVPV0U1WWEzcEtTMVpEUVZKSWVTSXNJbTFoWXlJNklqY3daR05oTWpsaVpUaGtOVGRoTldFeFkyWmlaalZqTUdOaE5ESm1PRGhqTkdOaE1ETmlNVFV6TnpGbVltSTROek5oTm1Zek9UWXlZamhpWTJJM016WWlmUT09', 1601981919),
('gIMkvPUwSZyWcXKjeTOResO9VieiJCCOICJiyst3', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJa0pMVURScUwydEhPR05JVW5Kd056aEhVSEJ6UTBFOVBTSXNJblpoYkhWbElqb2lURE56U1ZNMk5HY3hRVE13Wlhsb1oxRkpRME1yVkV0RldWVkhOMVl6ZG1adVRtMHhZa0UwTkhCaVZrdHZNMjFtZUhFeWNqUnZOR2d2V0U5R1NtbDJkbkJpVGxCVk1FSldiazAxTm1wdFEyNXJSVzR2ZG5CTWRWUlhjbWRPUjFseVFXMTBTVmt2UldscmFqZDFlVVo2UTNaa1NqQlRXRTF6VGt0UmQxRmxaRGhoWWpGNGJURjBPRzl3WW0xbVREQTBjVEpsY2pCNVZtbFFRMUJUYlcxbVEyeDVObWhCYzNkR1dIVlFMMnNyT1dobmJsQnpVWFk1YTJOdFdHbEVVbGxyYWpsbUwxRXJZM0pqYjNsNldXRlBTV2RQWkUxSmIyeFpNVUk1YTFjMk4zZG1TRUZVUW5Oak1tbG5lV0pZYlVzelNFNHJZMjVMUXpoaVIxQkJWMDFUV0ZJeGR6VjFiSEJyZDNSRWFtUjVLMjF1Um1sTVJFUlZibVJ1Y0U1U1RIUTBWMGhyUkRVclQxTkVlalphVVdVMVMzcEZhbFI0YTA1NWRreDVWRTlqTUZsaFVqVklLMDFaTDJOS05GcDFablVyWmtkWFVuRnhORFJ3ZDJJd2FubzJZamRXZVdwTlUxbE1RVEE1VG1KUlQzSmhaWEJxVjBGb2EzWnZMMHBXUlV0bFRGRnBUMk5JU21WUGQwbDBSVEk1UzJFeFJ6Wmlha2xNV1hWd1NuSnBTMmN5WjA5cVdHVkpjWGwzVUhoNlNFNDROazltVTNoS1IzYzJUMk5XY0hOR1JVVndaM0JzT1VVME1DdHpjVFJWVDNwV1dHdHhZV2M5UFNJc0ltMWhZeUk2SWpjNFpqVXdOMlE0WldNME5XRTRPRGt6T0dabU1UQTRNREF3T0RSaE9XRmtZbVprWTJGbU1ESXhOMk5pWXpFd01ETmhOV00xTWpBeU5HUXlZMlV5WkdJaWZRPT0=', 1601983531),
('IBrMpDJU23TOFGxHzshpvfPT4tnJ9DaI9FBJX19X', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbTFJVEcxeGExaE9URFpTVVhWdmEyRlJTMUpaSzFFOVBTSXNJblpoYkhWbElqb2lOMUExT1dVMUswMVhNVzlRYlVOcmVsRlJRVTFOZGtnelQxRXlSVU5WWmt3NE1td3ZlRTFzTW1sc1ZuSTFPRmt5TDA1Q09HbHpla2RsY0dWS05FZGxlbWgwZVhWMlptNWlOVmt2TkcxbE5USkROVlp6VWxCbFdYazNja2R5Y2paVWF6Qk9RazVJUjJGck4wSkViR2RtVkVRMk1ucG9jV3h3UVhwT09GQTJUbU13TjIxeVltOU9kVkZEYVc1TFVrUkxSM1pWY1ZaNmIxUjVSRGxKTkhkWVFqUmhiM296UkUwMGRuSlBOQzl0V1hScllXWklSbVIyY2xKWVFrcHlXbHBMVTFCR1RrRndhVXhXZEhkUFVUUk5TSE5HVGtWWWJqazFOa2hRV2tZMFVFWmtWazVOT1hvM2FFMUtOeXRuVGpkeGMzSkVSRGQxVFZOYVpVcHlNVlJ0VW5sdmVqUmtRa2xuVlhoVFpYcFZXSGx1Y0d0TFlYSnRSR2hMSzJjNVYxQjVkRXhrWkM5TmQzRnljR0l6TkVSd1pHWTVSbUoySzBkNlNFZElOa1IzV0dGWU1VaFZiekJUU0dsaVNteHhTR1Z5WkdOclQxSTBXRFkxVVdOTVZtWkxRblV6UVVRMGVFVlplWEEzWVZScVQyUm5ibWhZUlhoTmVIUTNPVGRFYTBoa1RVRkJTR2hoYlVKS05UZGtibFoyY1VJdmExaExSV1Y2T1ZCaGJqVnVMM2hNV1VsUE5uQlhjbEZYYmpnNWRsWk5ZVFJ0ZFhwdFRHZE5kalpvT1NzdlNESkdOMlEzVTBSMVQzRkRhMjVGZUd0c2R6ZzNhMk5WZGxobFQwSkROVXRxVm5GbVIxZG5NM2hKUTNSaU4xbHRaM295UVRaM2FuVjVRalpDT1VwM2QzQjZPRXB4TVZSNGFFRXlUbGRZUlhCTVJXVnlTbmhZV1UxYVVsaFFPVFpTU0NzclVscGhXVGM0WXl0TE5sUldZM1Y2V0VvelVHcExVbkJCTDFwdFYzcEZUM0JVZEVNME5FbFVPRXhCYTBSV01FeHNhVFJrVGxWd2RqTkNXa1J4UTBWa2VYWmxVM2RpWW5aaldUUjFkMUVyYUZCd1ZYWnZRVUk0VjBvMVdUbFZjRnBYTkZSU2NsbG5hM1JuVFZwcU5URmxOMEpzWlVFOVBTSXNJbTFoWXlJNklqWXhPR0UwTUdJNE1XWmhNekl5TVdNMVpUTXlNbVJsWWpGalpURXpPR1ZsTTJSaFpHWTVZelV4TmpOaE1EQmpZMkl6T1RnNE9UTXdaREV3T1Roall6WWlmUT09', 1601985202),
('Lxh0hw0yZaEXtTSq3NlfQSBVsXv3U1lVTHuq1rkV', 2, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbFpCV1ZCT1ZqQkZlbTFKYjBsSlYyOTJNRnB1TTNjOVBTSXNJblpoYkhWbElqb2llV2xuWTI1dWMweHhaRWxsVWlzeVVrdEhaM1ZhVUUxUk1IQXhXVFowUWtOdGJGazBSM0JhTmxKSlYwOXlTRmxEZUdwUlRFTnBNWHA0UkhSS00wc3ZNbGhZZEZSVmJTOUVZMWh3V2pkbFVYUnljbXRGZG1wemJUUTROSGt4UWt4bVZsRlViMFUxVTJWVlZGSXZSVVJSY1NzNGVYSkxabVI2UWtvMFZtbHhMemcxZVVSc1QyOVZXR2M0YUVRdk1UUjRXaTlIZGtreE9FNUNUblZXTW5veE5qVXphemxpY2xGd1JTOVdRbXMwY21wSmNqWTJLMmt4V0hsVlVIRm5aREZqWWtWc1ExZzJSMVJoYldGeWFraHJVVGd2VVdKSWIzRXZWRXRqYUdob1NUaEpTMjF1VkRjeVMwcExhVk12Wm1kTU0yTnZPVmhFVFZGaVVsRnlUR2c0ZDJjd0syb3JTVFV3T0VGRVZVd3dVakJ4YlVvck5UZFBWa1JXUml0bFJUZG1kVXgwVkZWbFUxcHVOVkZwVjNoc2RsWTRRMVJUZGxoTmFrOWhSWEpRZUVGWVdUVnNNMVpWYkZSNVlXWlJUR295VGxsb1pERkhiSFpHYVc1Wk1TdGlWVWQ2UzNwa1dHUk1OV0ZxWjI5WmVEVlBaRkJvZURCYVRrbHBTMWtyVTNZNVNWbzNSMEZISzJKUmJETk5TM0owTWxSUU1td3dWa2hMZUdOcGRIaHpWM05tY2xsR1lrVjRSRVZEZFZacWJUTjFlVk4zVVc5SlMzWTJNMEp3WXlzM1dFNVZjelF4VWpkU2NtOWFkbTAzVTNscmFsbEVXSHBZZVhneGRrTmFiWFZNWkRWTFMwcHpZMGh5Y1dwMlUxcE5ReTlqZFVKU1IwMDRhbEJaTXpWMmJYQlplR3hYT0RRdllXSnlWVXRoTkU5Q1MybG1lRU5HZDBaNWNYZHVVVGhQVXpOWFJGaEVaekY1ZVVvdlpFTXdTR2QwZEhOQ2JVbENZbk5NVlVSa2NXSm1jV0kxVWxwTGMwZFFORFJ0Y0ZaWlEwUmhPVzQ0TjBoUVZ5dFFZU3N5U210WmMzUTNiRGhwVVZSeVdsTnFRbVZtVlRka1dWRmtkM0JDTW1GdUwza3dWVXhSYldoS1VXWXdUbTUzZG5CSE5rRnVPUzlRTHpFemFDdHJiV2swWjNGbmN6Qm5lazkxY1VReGVXZHdZUzlPV2xOYUswdHNVWEFyYTNwRGJuUm9Ua3BhYzJGdVYzQm9lSHBVU2pWR1dYcE1hV0ZaUkVoQmNXdDZNekF5U2pST1EzWmtjVFJ5VDNoTFJVRTBRakEzSzJWT09VSTJSbTlLU1ZsWFRrSndXbXRSY1hOd2RVaEhPSFZ1VlZSRWExcGxMMGR1VURsbmQzWllTbk5vWkhGQ2FtMVlTazFCVEhrck1tUTJjejBpTENKdFlXTWlPaUkwTXpnek9UaGtNelZsTnpZMk0yRm1aR001WkdZMlpUZGxNVEExWVRWbU9EUXlPVGhqTURJd1ltRm1NalpqWVRJM05HUmxZbUZqWlRRd05ERmtOekkxSW4wPQ==', 1601998040),
('mEhTQBqFt0RO5xeEDkCx4mvv5B8shlGDtlEgU1jh', 2, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbmRTVDFsMVRHMXhWREJEVWpocVoyOUdkMlpWUkhjOVBTSXNJblpoYkhWbElqb2lka3cxVDNoMlJrWjBjRk55WkhGSVdHNU5Ta05zTXpSdU9GRnVhRkpuVlZkRlZWRkRkblpGUWs5a1NFdERkM2wwYzIxNUx6aFFaME41VkdGSVV6RTBSbE5FTVZnd04xQm5NMlZ4UVVsTFFtUkNWWHAwUVVoTEsxcHJWSGRsTWxKdVYwSkJhVWh2YURSTE56UnhPVU5qU0hSWFpuZGtZM2xxWjNsMVlWUk1jRFZoVGtsSE1IUlpOV3hKYVVocWMwbFlZVlJvV0dZeVFYQlphVkZtTVZVMFF6bFhZVWd5UjBwamFtWm1OR2N6ZEZGQ1MyOUZNRElyTVdoNVJGVjBkSFZYT0dwcFQyeHBPVUkyV1VNMVVUaEhjRzh3U1RkMFMyTnJPV1ZXY1U4eFdGZFVUSGRXV2xJeVJETm1kblIwZW1oTlZrTk1VamhSYW1kRksxSlhlamRNVW1JelowVjZVMjFJUmpnd2FVNTZXbnBQY25sdVpqWnFNaXN3ZHpScE9ISkxhSFppY1hSMWR5OHdkakJqVlVKcE9UbGhWMXBxY0VWWVMySjNWMlZqWWtSNFJ6SnFXbU5RWVU5VVJURjViemxEYWt4V1VDOVFSbkZOYjFwQlNWcFRjak5RUjJabVNFaDZSVmhPT0hsaFJUSkRkbkphVERNeFNqTkRiMnByWkVoRlNqaFJjR04wVTNBM2MzWmlkVW95Y0RCUFNFa3ZTV3RtVm5jeVozYzBhSE5hUVVWcWExUlVOM3BXWldKQlV6bDFiR1J5WW14SlNscG5RMkl6WkV4VVZEZDBOU3R3VkVsSWFHeDRUQzlHVFhOelluRklWR3RwZEdGRGJXeFNhMEZYYVZSQ1JYbEJWRGxYV1N0VVdtOHdZMVZpZWtOQ1YzZHFTa0pWWkhSeFdUUnVUVm8xYlhwTU1sRk9WVUZCV2poS1VqRmlUMHBFUm5RMlpGVTJMMDR2VDNad2NsRkdiREZLU1hSRlBTSXNJbTFoWXlJNklqUmpNVFUzWVRCaVpXRXlaVGN4TVRVMk1tTTFPVEZoWkRKaU1EYzFOR1kzT0RBMFpqSXdaV1EyWlRsa1lUZzBNMlF6TVRWbU16WTJNMlppWm1SbVlUZ2lmUT09', 1601995265),
('Qgcgw8ZTdjdpYEgPCcGw9NPhrrbAzLJFTM0PF8u2', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJa0l5TWpRdlJqZE9MM0JCYTBaTFUza3pVelJGVGtFOVBTSXNJblpoYkhWbElqb2llbFE0VkhOWFJEVjNVMDgzUzJKbVVUbHpMMnh3ZVU1SFVrVmtLMVF3VW1Sd1VWRnhOVms1YzAxT1QxZFNURmRsT1RaMWNIWjVjMXBMZWpGSk5sZDJjekkyWldjd2NFcDJLM0pQYVRsSmJXcDJaRVpZUlUxNksxaGFRMnBVUWxkM1RFTkRiV05WYW05MGFsVmlibmcyWnk5NVZYSXJMMHR3Um5oWllYWTRRbEp1WkVoc2FuQXlkMFJhYUZWME0wNWxhWFJqT1hSaWNHVlJTeTlRTmpWTlkyZDRZbWgwVmt3MmIzWTJjVzAxVDFaNE9FUjROVWRWVG1WU016RTBhbWRxZDJGblZXVTRUVlJNU1VKdUwwbDVOWE5OUzI1bk1rcHVTRWswWWxnNFFuaDJUMmx2VVcxa01HbFBSV0V5TlZrM2F5dHhZemxvTmsxd2JHaDNla1pUU21aamRUTkhNM3BKUjI5ME1WUjBTVkZIWVVOd09Xa3ZjRXR0Y1ZOSFJWVmxOWFZGZVdSTGVUWXhXRXBuTVZBNFUycExabFJDVjNCWGJXZFdieTg0U0hsbmVGQmhiM2RpYjJGNGNtbHpPUzgzTWpjeFJFWjFNRk5OVW5OWFMxUjRTak00U2tkbVJXeHVXbXRMTldzeU5XeExNSHBRZDNWQ1ZXZHBORlZ3U3pOWGVETlBTbXQ1YmxaaFRTOVVWMll5YVhSclVrOW1kVXRUWm5wT2RIQm9MMUYxTnprcmJIZHpWa3AxVTJaNGRXSTRlSGhQV1N0RGMzVlZlV3AwY3pjME5FaHNNRmRRV1ZwQmNXOHpSa2xUVUV4VGVFRm9Zemd2TWxodk1ITkRUMmhRVFVJMWR5OTZWbmxqUzBadU5VVndha2xNWkc5VGFqTlBjMGR5YkdSRlFtSnpVa3QxWjBKYUsyaDNOR054U3pjdlVreDZVbFJyY2xCNFYyTjNRems0UkdaUVRraDJZMUpqZVZOU2Rsb3pVMmswYzNNd1pYb3lVazlIY1ZKVE5rcDNRbE4zYm1WU0wyNWxkR1ZNUnpGaVRIZGxXVEJaZVdOVFdFaG5ZekJrVDJkWU5IaHNTMHB1TWxGR1kwaFFRbEJWYjFCcE5WTXhNV1pYUVRSaVJreG5lVVp4SzNGUUsySm5lVXQyZG1wM1lVa3ZkMnBVZEVFOVBTSXNJbTFoWXlJNkltUXdObUZqTUdRME0yUmhOVEJqWXpneE1XTXhaVE0wWWpRellqYzFZV0prTURaa01XWTFZVFk1WVRrNE16UXdOMkU1TldOa1l6UmpPV1UxTkRVMlpXRWlmUT09', 1601994936),
('qyGIpPL6OlgEIlIPGZaCshyWiRxKlverev5XB9BY', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbWQzZW5BNFNqRk9TMHc1VkZkWFNDczVhR1ZMYVZFOVBTSXNJblpoYkhWbElqb2lRWE5uTjB4NllVWTROSEptZDFjMFIxRk1XalJTTVdwRlRHTmpWRzVUVlRsNGNYTlNabmcxUVVkUWNqWnBkamgySzNoUVVXNVNlVVZHWTFsTVJYUlJWMHQzU2xCVGNtazBhRWh0VVhSQ09DdHJlbmhQWkRsdWMzVnpkM013VUZad1RERnRValpMVGpkb1duRmFMek5vVHpWeVp5OTROQ3RwVm5CT1FVMXJiMEZqVW1NMFduWm1RMVkwU0ZoQlFpOTFNa3cwWldaeVIxZzRORTEzU1ZWSGIySXZlVTR6YVVVMmJqSXJTVmQyUlZCd09VVTRaWHBWWW1oMFNuY3hUekpMUzJSWFdFTnZRU3NyYmxOSlJtd3dOMEZGVEZadGRFVmFORlZyVlVKT1NIQklUazFUVm5KbmMxUTFaVlpaUkc1cVF6WnhWRVZ5TWt4bGQxVXhZazFwV2tNck5tZDZTREprZVhWR2RHOXZXWHByWXpWSVozcHdiRkpYVkVkell5dE5ZVk53YkRkek1XZG1aV3RpZGk5dFVXWXhjVEZ3YjIwdmF6RnJORFp5YkVsME1FaHRiMVpLTjIxWFZrWlBaR3hHVjNWTVYxWnlSRFpsU0VFeWJrTTRjMXBKY0RCc1JDc3haek5zVFhJM1NtVlNWMDV1ZGtKS1ZUbGxjMVZ1ZEV0MWFHaHpSV2wyVW1wcFNuaFVXVm8zV2xod1JYUndaRXBxZDFkUmRFdFlkVTR4YWs5clJVcFFhRkppVWpkMk5sWkdNVVZOYXpOd2VuUkZjVzB4Wm5OdldXVktXQzlhUldoUVNFUmxTRWdyWkRSUllreEtVakYyT1ZkVFpERXpNakZCV0doQlIwRnlMMXAzZGxaRWRrWnJZVUpPV25ScVJYTlNWa2RaUzJGQ2FYRklUR2RsWVZkU016bGpTamxDVUU4NE1IbEJhMlJWVlZaWmFUVlZVWGhTYmxSSVQzaExRbGMyWW1WT1ZreHNhVUp4YmxKd1pWUkdkMk5sTjNwMFFURjRWR2d3VFdjNFNHWkdjR05IY0d0RWIycE9NazVUWWpSUFUwaEZVVk5hTUcxNFJWSlBjVzlsTDJJM1dEZHdZMEpNYjNCaldTdHZSRmhxVDBSU2QwbDRjRkJZWWs5dlExUnRaR3BtY0VGaGVXOUVPVXdyYjNFemVXTkpObkZXU3l0WmJWaGpjRmRMU2s0M2J6VTBlbmhLVlVkNGVFMU5iV2h3YW5kMlowWTNWRU56ZEU5MVZrZEtWbGRyT0dWWmVDOVJORVp1V21VMWN6ZHZTRVlyVTJGNVNHNWthR2xCTDJSV05sazBQU0lzSW0xaFl5STZJakF6TTJGbVlXRTVaVFJoTkRVeU5UTTNORGRpT0RRek1XWTVZVFUyT1dVeE9ESTNNbVU0TVRsaFpUSm1OV0kzWldVME5EQTBNVFkxTW1ZelpUZzBNV0VpZlE9PQ==', 1601983122),
('r2S2TqW4sh7qxTJ5iu913jbSaAqm1odvd6rLcqRR', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbFpJVGtkSVlWRllLMGhCVURGVVZ6QTROV2hGTVdjOVBTSXNJblpoYkhWbElqb2lReXRWWVVZMWJYWlBRbXBZYTJoeFlpOW9Ua1V3VVVGa1RuSkRSMGxqVGtwaVQyTTJNMkZoYUU4eVVYazFhazl5UzFab1RVWjZiRWxRU1ZwWk5IaHFXSEpzY0N0RlpWQjNUbnB2UkdNd2EzRmFWa3BhWWtkWU1sTkxiV3hvTm1reE5XOVFTbWMxWTFkelJEVktRMDE0Y200M2JUUnBUR3BNZVUxcVQxSXhVMUZTYTNSQlRtMUNSVVJhUVhkWE5XRlBSbEl5Y2tKalNFcHhiM2wyTnpWb1EyeElWa05LUzNnMmJHNXdUM0JDWVM5Uk5qUnpVa3hyV1hCbWRrcEdUbEY0Um1NMGFtMWxSbEo1UkRWWlZ6YzFaWGR2VFZCSk5FcHRNVWw1ZEVWT1VubHhOa1JYZUZwQmNtOWxaM2d6TlhOdFQwbDZZWFZYUTFKSVYybFZZbWxUZUhSNVZubFVaR2RGZUdjMVNEVlplRFJwTWtWVU9FRlJkRzlxZVhvM1NEVmlhR28xWjBVNFRuWXhiVmQ0V25KNVVYUlRZbFZKT1hwYVVtaHVja05rTW1ablJUbENSbmRzTjJWSmMyMTBXamxvU0cxVmNYQkxTV3cwYlVoTlMxQkxNalJ6UjNONGIxaGtUMEpDTVhGdVRGVkxkRnB2VW1SRE5HcDRPVWhsUTA1MFFrZHFLeXRPVWtoMWRHUkdXV0pzYWlzNFYwaHdMMWQ1U2l0RVFsbG1PRm94UW1aR2FYWnBaWFJTYW5rdk1ubGtORk54TkZsbVIzVTVka2hvTUhWS0t5SXNJbTFoWXlJNkltSTVNalF5TTJRM1pqY3pPVEV3TVRNMFkySTFPV0U1TXpjek16UmxPR05tTTJGa09HRXpZVGd4TTJOa1l6UXdZbU14TlRkaVpHUTNORFkwT0RnNU5Ea2lmUT09', 1601981286),
('rJd1Y0MP7xt3kFUq0GLWP63RSeEc3K7XY71gvOHf', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbEJZTkVsQmJ6Um9aMGd6ZUhCRGR6bHJOMjFLZG1jOVBTSXNJblpoYkhWbElqb2liRGRQU3pkRVltNDVLek5vU0hGdU56STNiRVZsUTFSUlIzQjVSREU0Y1ZKU01sQmFkazV0VTJoWlNsZ3ZUVEZLZEVneFExWnlLelpHU1hSU1QxWklORUZGUmtsUWJuaENhMDlJVUdKRVFYaFNTalptZG5oSFppOUpTaXQzWm1oQ1YycFBaVkJ3YWs5UWREaGxha0pzTkU1cU1HOUtOSFZXTmtsWlFXOVJRVGxJZVM5cWMybHdkbWhFVFdkUlozZG1Zek5EZFZacVZUVnFSaXRTVDNGclVXaFJjMVo1YUUwNVpqTnBLemRvZFUxTmJYQnRPRFptYW5sR1pWaEZaRXBMVTNScVFYTTVSSFU0VUM4MlRYZFRhM0JvV1hoWGJrNVVjRXgyY1dGQmVucHFUSFZ3VFhReWVGZGtXRUZNZFhsb1pqTnJXRlJsUkZkWGFqUTVUVXRqZVhoUk5qSkJMekZNU2tWblozWlNLelZ1UkZwdlpsUkRUblJMT0hwamFtMXBWR05zVGt0UlJVNW9TVEZNZFc5QmQzcHRXRGh4YkU5V1VXMUxha1J6Y2pWYU5VZG5XVzF2WnpkR2EwOXRRa3BDZURWVE5WVTFPVlEyVm04elpWVXlRazAzY0dsRVNHVnhVbWxqUFNJc0ltMWhZeUk2SWpVMVl6SXlZMll5TVdVM01UTXhOak01TW1ZellUZG1PVEpqWWpnMFlqUXpNRFJoWW1ZelltWTJPR1ZsWVRCaE1HTmpOMlUwWm1WaFpHUm1aalV4TlRjaWZRPT0=', 1601994899),
('RxkPpcS43BjKddBXwX4tF2ciXcjT6FBO82eT4VEL', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJakFyVkVKT1UyeHlMM2xrTlRKcllXUnJiMVEyVm5jOVBTSXNJblpoYkhWbElqb2lka2xyVGxoRmNEbG5kbkZSVWxwNlV6VkllbmRrUkRWQmVHUXZZMlpFZWpWS1NGUnpMMXBpVmtwQk0xaHVZVUpMTldKaE5FTkpURUlyTkRWd1RYVldiVXBqUkVGUE9VNXdXRzFQZUZSVk9HaGxRbVJVYW1wNE1tYzFOblJVTjBFM1IybGxPVlZqUTNaR2VYbFFkRk53ZERnelRsTnFjVk5SUWpSQk1rUkxMMnh0VFhSWFFtaEhNek4yWlhkMVdsUnhUVzVTU25sNlQyVnBXbWNyZUhwUUwwMWlaSFJDYkVRd1oyOWhkWFZPTUhZeGIzUm1jRnBLUVhVeVpqRm1VbFI0UzNGQ1IycExia2hyVDJ4d1ZWTlJaR01yUldwNWJUbFpiMFZrVFVKdk0wRlNRVU0xY0VVdlIyZzFjVlYzV0VaNlZHMDNkVE4zZVhoRFUxUkpUbVZyVjBoWlFub3pkM1JSTnpSMFR6UXdWR2hEVWxGcllYQmhaVlYyTVhKalYzazRZVmh5WjA1aGFGbHRaakpRWkdKNGRVeDJaM2xxZGpWd1J6QnFiSGN5UzAxVE5rOHZkVWhTT1VOYWJEZEdlR3hqVW1wR1lsbDJXREI0YTFGV2REWlFhRFZITjFWUU1WRlpSamx2UVc5UWNDdHlObU5xYm5KQ1JVTnhTV3RYWm1JNFozUlBNRzFZWm14TlNqSmtjRlpRVnpkc0t6UjFLMlJtVFVGWWFTOWpNVVU0WlhaS1VuRTVZMW8yUTJKdk56YzRTVk16TWtnMFYzUjVXbFJoTTJnNFJDdHBWRlZhWWs1TGNYZ3hNbmhFTlhOUUszQkhOMDh3U1doQ2VsZHhOMmh6YjJsd1Iyb3pkbXRsZURZMWMxUTRVemR0V2tvMWJUazJlV1V5UjBzck4zUldUVFUzZUcxRlRXZFBjeTlGYUVGMVJURlFTamxPYmtkb2VHRkpObE0zU2xZNFVHbHBiRGw2T1RSRWRUWjFZazFxTUhNd1RUVXZhMUpHVFZaeGJFSjFkalUzVkVKblVuYzBRMU5YUmtRelNqRklOMDVQYVVGVVJ6WnNPR1oyWjBRclFUTm1kSHBRVEUxU2VHVldiSGhhYURaM05rUXJOM0o1TWxOaFV6bElSalp2YlZKc2QyTnpOeXRKZVhObmVtdFJWbXd5V2xsTFpEZDFaV0ZJTkV4a2QyWldXVmhDY1ZCVU16aERaRFpMU0VkSU15OXVUbTkxVWpZMFRVdEZSemw2ZW5kbVdWRmhabXRrZVRWdmFURkNVR0YwUm1OVlVFcE5RV2h2ZUU1TFVYRTBlRTFrV25wUk9GbEZQU0lzSW0xaFl5STZJall5WWpneE16bGtaamd6TW1JNE9HSTNNamMwTURCa05UWm1NelEyTkRGa05HTTBObVJpT0RFNE9EUmlZemxpWVRjek0yTXlOakUxWm1Fd016UXlPRE1pZlE9PQ==', 1601982818),
('S4sSt8ICoNVtr5DkoYrfXBFZG5wZijZb6CooMc1O', 2, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbFZEV0d3eFdIWm1Rek56VG1rNWRFVkJVR2hzTkVFOVBTSXNJblpoYkhWbElqb2lWMHBNYzA1UU5uUjZOMDVIYUM4NWQyUllVemRZTVdWSGVUWnJiMmMwWjFKNFdVVXhkVTUyYmk5WlkybGtUbGxMVG1WQlNYaEhaVEZvUW5SMGJsRldRVUZKT1ZGd1YxZGhTVEZRVkdkRlNFaFRURWt3TUVOd2RURjBlazB4UkhCUFNFZDFiREZYU0c5SlpWRnFhVlJGVURSdFJHUTFWVVZ6UlVSRFNtZDZZVTFXZW5OWlRtNUtZakJuVFhOTk5WUjNjMVEwWjFsSllXWXZRVGRpWW5OWE16RjVabGRsU1VWdVYwZzNNWFZpYjJ0SFRUTkRiR2RGUnpWd1R6Rm5XV1ppUTBWbFNsaE5RUzluUTB0MlR6RlVSbmw1WW1aWGNrZHVVR2gyTDJaUlpWRkxUMFF5TkVoamVUSjJkemhqV0doQ2FuQllWMmRoVGtvNGRucEJRbGhuUTI1RU0ybDFOek5pV1dSa1VVVldiMlprWTBOdGNtVnBkWFEzWkcxaWVHMVNSM2N5ZG14dGFIZHBaSHAxZFV0c2FYWjBRbXRsWTNKS1JHRllUR3h4S3pObFQybFlWMFJKTUhaUVR6azJSVGxYUjBGd0sydDRXVUl4WlV0MlRXZHlSVll2UTBSMlVqSkRZblIzV1VoT2FtUkZOVmRCUkhCd1VsWktjRFJVYmtRM2FuTlJOWE4zYW1kTFVGWk1hRkpMT0dzMVZYZEtZVnBvVjBkRFkwd3pOeko0TmpOUEsxWnBPSEJ2VEV0aVpXbFFjVzV5WTNOVWFHMXZNV04wZUVnMGJqRkZUakYzZEZWMVIxRlZlbGRGV25Ka1kwdFJOVVZxTm5RNFRYbzBSbUpwZEdJeFJXZHdaMFJaVDNNNE9HcFRlbWRxZFhoSVdVZDRNV1ExWTBKNk9EbEROVXhYY25SMlUwcE1iRkl3WmxWVGNISkVTRll5Ym1acU1VSXhVMHROVERKaFRXUlBWa0ZJY2xOelBTSXNJbTFoWXlJNklqSmlZVFEzT1dOa05UZzJZMlprTlRSbU1HWTFOemRoT0RneU5qQTBOekZoWlRJeU1qbGtNVGhtWkRsa056ZGxZVGhpTmpRd016ZGhOVE0yTmpKaVltTWlmUT09', 1601995863),
('TaafEovIwuT3yOooD98a6HWFsThWU2rbsWbJ1EF9', 2, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbHBtVDJWbFNYSTJWaXR1WkRKNmNYRjRjM2sxWm5jOVBTSXNJblpoYkhWbElqb2ljMnhQTkRZMVIwZGphVEp2TDNOaVVVeEVhMjlsT1RKNmRVZG1Ra0ZOYUN0M1FUaFdiWEpwTm14YVNYSk5jVEJFVGxsblVXeG5UVU42WW10TFpEQXphV0Y0TkhGbllsaHFka0p2VEVadmMxSmtTRU5GYmt0M09HOUZiVXRzYnpOcVJ6SlhTR05qYUVKRlIweEphMGc1VERWV01tWlZNRTFtZFZSRFlsWTNiRVpoWm5BeVduUmtjalV3WXpKU1pIZGliRkY1Y214bE1qVnBMM0VyVjNacFRERnRSRmxLZVRSeVVYRlpTbkZSYjJKd2RFeEZZbWRDZW5GT2FqSjViMHRPVVU5eVpHbHlNemhrYlZjeVNUZFlhR3RyWjBkSFJYRm1hSGc1TkZKdWEzUTFhR040T0hSMk9YcEhUMDF4VVhwSldVMTFOVUp3Y1VKWFREWkZORmR4UkhOMk1DODVVbWs0UzA1cGVFdE5UMDFyYVRKcFdqRlRPRzE1WkVSNVZVTmpWRmswZGpSamNrbGFhRUpKTVZkdFpuVnJlakV5VTJseFMzVk5jekpNYlZJNVVTczJTR0ZxYlhrd2QzbHNWSGRHZVhwcFVWVnJaVVoyUXpoWGJuQllMMHhrWm5kTmJsUXlPREJuTTNwTVNsaHRVMGxEUTJkRE4wUnlXaXRTVkd0bVRHUkVkV1l6VW1ObGJIcHVXbnBuVWs5YWJEUlhWalEyVURSd1EwOUlLMWxDZHpWNVZVWmxZVFZQYjJGdmNtNXNkM0owTjFKMVkzRm5ka3RGYTFSbWIwZHRaWEpzTm1kSk5UbDBiVkZxZUU0MFpIWlhWVWhYTUZwbldIWTJia28xSzAxMmVsbFlWMlI0Y2xWeFpYbElhMlpvT0ROcVozWkNURzF6YlhOcFExRnRSV3BoWjBwalNucGlRbWhOWjJOU1RtbDJWMVJDTldKTVIxVlZaVVowY0dRMGMzWk5OVWh6YjBaUlBTSXNJbTFoWXlJNklqWm1PR1kxWkdSbVltSmlaVEl5Tm1FNU9UaGxZakF5TTJWak5UVmxORGd5WW1Zd01ESXhObVEzTXpFMFl6azRNVEV5TldFeU5tWTBNRGRpTm1FNU4yTWlmUT09', 1601984162),
('TJNHFF4uw2fry8cV1sHMfmrBPniu4hXzoyqcTnDl', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJaXRoWlRWTU5FTkdkMFpFY1V0ellVODNkMjFKTTBFOVBTSXNJblpoYkhWbElqb2labkprTlZKNE5sbDBRVmxSSzNJMVZsSkpPWFp1YUhCM2MwSk1ZMDFOTWsxdEsyaE9ZbUYwU1dGT2QwbzJNeTlKUTJ3eFJYQmlPVVZ3VDNkeGNtcDNOaXRDYzFwMFZXcFJRbGN2U2tOeVltbHlVMVp3V1d0WlJGQm9jMEprV214a2VtUXJiM2N6ZVdWVVRWWnplVFZzWkRNMlQya3ZlRlUyWVVJcmVGZG5OME5aVTNGRVFtOXNSVk5qTmtsV2EwNHlhbGxZTUdkYWFGSTBVazVESzNSTk1HRndWSHBvTVdWM1lXbGtkVE0zWjNBcmVqbFFjbmxNWW5odVFXOVJZalpNTVZkd1drazNkRGhxWVZaeEwySkJNVXRLYTNWQ1VtTXZhVlpKVFhCSVVuTlZjRzFTWVhGUVJUWk5MemcyV0djeGEwWktRM0Z0YjFjMVJHeHhlazlCUm5Ca2RtWlhSM1p1VFVOcE5uYzNkRlZYWTFrelFqRmxTV056TTJvMFZUTXhUWGhUVkVaaWFWaG5TVmxRY2xodlEzZG9UMkpTU1UxelFrVmtUSGw1TUdWRk5ub3JPR1YxWmpjeWEwRm5hRTF4VURCRmFUZEdjSFJDVTJkbU5IazRlVk54YWxnNWVtaHdjVXhhUkhGbldYbEthM1pPUjJWS2VuZ3ZhMGxIY2psWWFrZDJibGRuV25OWU1GVmtjakZQY3pkaGRqQm5PVEpYVERCdlRIbGhjVzB3WTFBdldFOHZRM1JOWjNVMFZTODBhbGRNWkVkSEsyWlRiR1kxTjA1aGRTSXNJbTFoWXlJNklqRTVaak0yTkdaaU1UUmtNREJtTkRnellqRTFOMlF3WmpJd01tRmtaRFF4WVdNMllXWXlPVGcyWmpReU1ETTVPRFU1WVdFMllUSmlNMlU0TkdJeU9HSWlmUT09', 1601986929),
('uLn57BUSLtRiUGILPVPHX98iYWPzctzPsJQEjKWY', 1, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbEJuTmsxVlZubFZlRlZ1YVZkdlJFcFZWemRVZUdjOVBTSXNJblpoYkhWbElqb2lNeXRrWmpSM2FHcDZiemN5VUZnNGNrWm5TbVpYWVUxNE1qUk1URkV3YTJsV1pubFJkbGhxWjJWSWQwWkNlWHA2Y0VWTFEydGhTa2g1V2pJM1UwOXFlVEE1SzBGaFdtVTFjRFpaTm14eGNsbFplbVJrTkhGTU0zRlFOamwzYkhGM09YZG1NR0p0YVcxQ2JWUmxkMDk0YWpGeksycFBUMUpNVGxST1JIWkxXR05pVlU5Vk5rUjRhMnRaVlc5SFJHczFWMFU0YjJvNVEwbG5NVEZFTkcxWk1qRjNla056U2sxMlkwSjVVSE12VTJodFJWSkJiekp2Umt0bFptMVpNblIyY3psTVFXbGtlSEZpTW1OS09HVjNlVzlSWTA4d1YxWTJZakU1VHl0Q2NpdExZVWcyTDFadk9WWTNUMHh1Y0hWUFVYTnZSMUp6VVdoMkt6Z3pUalJyZW1sbmVuQnZZbVIzYXpFemFEZFBXWFZ0Ymt0aFVsQTRabFZKTUVZMVJYaHRWbXhuU1U5cE5XRlVTRE0zWW5FNU9YQk1TbFZzSzFObWRFOTRVVWxuTkdSQlprSlhabkJzU0V4S1JEbFVVMlkzUjFJNVNIVmljRVpKYlZKamFISXJLMEZPYUhZdmRqSTJXazB3VEVKUGRGTkJhMXA0U2xsamJUQk1ZMjVUUldOd2FYZEVaM1Z1TDNkdUwzcFdVbXhLV1VaNGVWaDRXSEJ4VTNWVE9ETXdTemhJZURnd1ZVcHdkbk0yVW5wV2NqRnBla3BWUmtKalZtVXhNMk5vVDNCTmRYQktUbVpxTDI5M1NraGhjR1pyVXk4d2FIQTNWVFJ0Y3pOdk9UUmtPRTVvYlVsdVZHcHZObGREWmpkbUwyaDVlbVZsT1RaelQzTTVNWEI1TVhwdVIxaDFNM3BWS3k5SmVIZG5NVlZ2Y1VObFEzZG5TekZ6TlhaalVWUk9jR0p6VVVGUGRqWnpMMkp0TVhCaVJIRnpPREE1WWk5TVVuVldWaTlpZWtWVFN6TmFJaXdpYldGaklqb2lNVGd6TUdZMVlUUmlNakkzTkRReU1qVTRPR1ZtWVdSbFpqWXlPVGszWm1NMlpXTmtaR05sTmpWa016YzJNbVpoWmpaaE0yUXhPVFEwTVdSallqQmhZeUo5', 1601998091),
('WS97TbHWPOvCRddz1Gh38UJhGWEudp50cx6q3LK1', NULL, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJalZrUVdGa1ZVSlBUVEp0TDNFM2JrZHpNRXAxVTNjOVBTSXNJblpoYkhWbElqb2lWbkI2YzBreVpHY3ZOVWhXY1ZBNE5ESkVLelEwTWxST09ETjBUMnByT1ZCRGFYQlRielpOUVRFd0sxRjRlRVphWlcxTk5XMW1abmxFVlRGQ2FIZ3lNMnczYWs4NEszbGhiRXRGZW5FNVVuRm1hR2xWUlZobmFFMHpVVXRtWTNGclNGTk1jSHBIZG0xeU9ETk1hMmx4TmtzMWJXTllPRVpuV1VSVFdXOVRNMHhaYkRaUFdrTkNkRFZ4YWpSQ2JFRlhiWFF5WW5Zd04zZDFTSFZhUW1od1RYaDNlRmR5VUVkaFFreE1jVEprUXpkSU5GbHJaekZpT0VaSVFrdENVREoyUjJ4WGExVnVPVmxKUTFGQlRXeDZiMEp5YXpKaVl6ZEtjbWhwV0V0dFQzVjJVMU5oTkd0cU1XbHRWemNyTjFOU2NVVTJiMEpGVW1FelEzRTBkalZCV0RCeksweElOMmw0YjJOdFRISTFMMHg0U1hZemNGUnpWRXBvTWs4M2JuUnRZVWRZVnpsSFdGTkthRUY1S3pKMWJsVTRNRWRQY0hwTVVVaGljVzFFT1dNNFNteEVRV2M0Y2sxU2JHa3JTMlJZUkZRMk4wOXBURXhwVEVkVWNtWnpORVpwV2xOTk1sRkdkbXhxVmpjclRqQTJPWGh5TjFCb1MxQkRZMnM0VG1KblRqQlhkMmhSYjNwWFlTOHhNVFpzUW1OUVZHcDVRV2g1UmtOUlNYTTVRMDlJT1ZaYVZVeEpSMk5OUVhabE1raHBReXN5YzNaRVIwdEViSEZYVVROR1RWVkRjVWhTV0U1WGNGaFlPRVZrWWpsVFZDOVVja3B1ZFdkRlMxZHpRVWhPVDAxUGJrMVpTbVF2WlVwRmFXNHZOM2Q0VlZGUGEyNU5ha2gyUXpOSVNWbERVM0U0YjI5aGR6UnBPWGxTYVhkUWRGSTFWWE1ySzA5UE9IQlFXV3BvYTFaWlkySTFlVzlUWlVob00xRkRPRTk0Y2xwU1dHNXBZVmhNT0dwTFJrWjNOMlpPTjFCM2JuVlhPR0pDZEdSNFRGWmhaa2t6UXpkbVkzUnpNMnBPTkRrd1UwNDJOMDl1T0ZSUE56QTRSVVZUTVRKUkwxQXpURlE0VUdKR2RGRmpkbFl3Tm5ob1ZETldiRTFXZVdoS2VHNHZRMWt5UzFFOVBTSXNJbTFoWXlJNkltVmlZalU1TjJWaVlUUXlZakUwTURJM1pHTmlOak5rTkRkaU5EZGhZMkUyT1RsbVpXRmxaVFZsWmpFMU1qTmpOV1pqTmpNeE1XSm1aRFl4TjJJME1HWWlmUT09', 1601985163),
('ZXAhpud12dpJ1Yh31Zn8epKH1jZCemXGvBH4c3vl', 3, '172.21.0.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJaTgxTDJwdVVrdzRhV1pwS3pCcGRTOVJNbUpzY2xFOVBTSXNJblpoYkhWbElqb2lRU3R0TjJ4SlVtWlpiMHBwWTBWdWJqZGtkbFpZV21WRGNuRnljR0ZJZHpCRmNqbFdNekpFVkZGTFZHSkVUV0ZwU0hwVVZtOHZjVWRsZERCVWJFRklVRFZ6U2tOTFlVRnhUMFZVT0U1U1pXSnJjMVp5WjFOV1lVeEZRMGhHVjJ0MlJEUkllVzVVYWtaUE9YaE1SV2RoWmtZelVqQkVRUzh6VldweUt6bHlTVkpsV0c5bVZIUnhkVXM0VTBGaGVuTnVUeTlYTDFnMlFuZEVhbFJFVVd4UmFqaEpVR1YwWlhaSmJuVmlSemRMVldwVFNrbE5hblJCWlROYWJtdExPRTg0VEhGWGFFUlhNbEpaU0VoME1tNXRXazl4U0Vvd0wybExUamxsUTFKQ1IzSXhlV0ZWUVVkc1ZEZGxOM2R1UjBwS1Ewa3lSVkE1U0hJNVNFUm9WSGc0YjFkdmIzSlpkVEZpUmtkTFRuSlZZMmRDZFU5dFZVVmhUMlJEWnpSTmFWZ3dRVXR3VTFoMksyOTFVbVp6TkVVMllqWkxNMWhITDJaeFJIQXpPRk5DYUdoWmR6WXJWak13U0ZBM2RHRTRaRGN4VW5ZdmJXRk9VMWcyTmxsd2R6bFpka1pVTlM4d1VsVnFMMjVoVjJFeWVXWkJTa1E0YW5wemJrTTVSR1ExWjJneGRFTTNPR3gxZEhNMldVRkVUMGh1VW0xNmEwVkRVMWsyUkhZdlRERTVhbVZETlhWak5YbzJjUzgxTTB4T1EwSTNVMjlRY0dRMVRFOVRhbU5KYTFBNVIxYzBTMUEwT0V3dk1XSlZXR1E1UVZoUGVuVkdRVnAyVGtkc055dFNNRmw0YTBkV2JUaDNiVFpwUjNjOUlpd2liV0ZqSWpvaVpqRXpaVE00Wm1WbE9UTTFZVFl4TnpjeFl6UmpOekpsWVRjM01qVTNORGd4TnpVd1pqVTRZV1l5TWpNMVpEWmtZbUk1TVRoa1pXTTRNbVU1TWpsbE5pSjk=', 1601985310);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'settings::pterodactyl:auth:oauth:enabled', 'true'),
(2, 'settings::pterodactyl:auth:oauth:drivers', '{\"generic\":{\"enabled\":false,\"client_id\":\"\",\"listener\":\"Pterodactyl\\\\Extensions\\\\Socialite\\\\GenericExtendSocialite@handle\",\"client_secret\":null},\"discord\":{\"enabled\":false,\"client_id\":\"\",\"listener\":\"SocialiteProviders\\\\Discord\\\\DiscordExtendSocialite@handle\",\"client_secret\":null},\"keycloak\":{\"enabled\":true,\"client_id\":\"games\",\"listener\":\"SocialiteProviders\\\\Keycloak\\\\KeycloakExtendSocialite@handle\",\"client_secret\":\"cc08716d-eafd-4102-aa04-44a29ba99e9f\"},\"google\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"github\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"twitter\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"gitlab\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"bitbucket\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"linkedin\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null},\"facebook\":{\"enabled\":false,\"client_id\":\"\",\"client_secret\":null}}'),
(3, 'settings::pterodactyl:auth:oauth:required', '1'),
(4, 'settings::pterodactyl:auth:oauth:disable_other_authentication_if_required', 'true'),
(5, 'settings::app:name', 'Netsoc Games'),
(6, 'settings::pterodactyl:auth:2fa_required', '0'),
(7, 'settings::app:locale', 'en'),
(8, 'settings::app:analytics', '');

-- --------------------------------------------------------

--
-- Table structure for table `subusers`
--

CREATE TABLE `subusers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `sequence_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_offset` int(10) UNSIGNED NOT NULL,
  `is_queued` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_log`
--

CREATE TABLE `tasks_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `run_time` timestamp NOT NULL,
  `run_status` int(10) UNSIGNED NOT NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `external_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_first` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_last` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `root_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `use_totp` tinyint(3) UNSIGNED NOT NULL,
  `totp_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `totp_authenticated_at` timestamp NULL DEFAULT NULL,
  `gravatar` tinyint(1) NOT NULL DEFAULT '1',
  `oauth` json NOT NULL DEFAULT (json_object()),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `external_id`, `uuid`, `username`, `email`, `name_first`, `name_last`, `password`, `remember_token`, `language`, `root_admin`, `use_totp`, `totp_secret`, `totp_authenticated_at`, `gravatar`, `oauth`, `created_at`, `updated_at`) VALUES
(1, NULL, '3240c106-44ff-4887-a9f6-072e32921a64', 'user', 'pterodactyl@user.com', 'T', 'T', '$2y$10$6994eqgYfD7kVWyGaCTMNuhItCKDf6z7inaKLoz.s9CPu9EK7wl7i', 'W5J87RHev8cuCAshBeQpF3yXSUufhfe7IZen4vABvtOFUeJeKX5FnHN4toPP', 'en', 1, 0, NULL, NULL, 1, '{}', '2020-09-17 23:39:37', '2020-09-17 23:39:37'),
(2, NULL, '7fd7288d-d6f1-41bb-8443-f3f86793261b', 'eric', 'eric@example.com', 'eric', '-', '$2y$10$AmFU.28ZhEd6Uu4DgeX6I.vi9bZsQPzBotm2lmJCTjat3lTZjVlIa', 'yMpfRe3BW1vamtKk6mR9egNki4PFnDQ5ueYfL9oH979v1BfOzAqF98DxHsRr', 'en', 0, 0, NULL, NULL, 1, '{}', '2020-10-06 11:05:03', '2020-10-06 11:05:03'),
(3, NULL, 'b662ece0-e589-4673-b302-8b46ad576bc7', 'ocanty', 'ocanty@example.com', 'ocanty', '-', '', 'yxqW7aceKDoMhV5uMctp2QHVZ4s1VpXV1l6EKrKTZgXjGIqz6t6nboihA965', 'en', 0, 0, NULL, NULL, 1, '{}', '2020-10-06 11:55:10', '2020-10-06 11:55:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocations`
--
ALTER TABLE `allocations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `allocations_node_id_ip_port_unique` (`node_id`,`ip`,`port`),
  ADD KEY `allocations_server_id_foreign` (`server_id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_keys_identifier_unique` (`identifier`),
  ADD KEY `api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `backups_uuid_unique` (`uuid`),
  ADD KEY `backups_server_id_foreign` (`server_id`);

--
-- Indexes for table `databases`
--
ALTER TABLE `databases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `databases_database_host_id_database_unique` (`database_host_id`,`database`),
  ADD UNIQUE KEY `databases_database_host_id_username_unique` (`database_host_id`,`username`),
  ADD KEY `databases_server_id_foreign` (`server_id`);

--
-- Indexes for table `database_hosts`
--
ALTER TABLE `database_hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `database_hosts_node_id_foreign` (`node_id`);

--
-- Indexes for table `eggs`
--
ALTER TABLE `eggs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_options_uuid_unique` (`uuid`),
  ADD KEY `service_options_nest_id_foreign` (`nest_id`),
  ADD KEY `eggs_config_from_foreign` (`config_from`),
  ADD KEY `eggs_copy_script_from_foreign` (`copy_script_from`);

--
-- Indexes for table `egg_mount`
--
ALTER TABLE `egg_mount`
  ADD UNIQUE KEY `egg_mount_egg_id_mount_id_unique` (`egg_id`,`mount_id`);

--
-- Indexes for table `egg_variables`
--
ALTER TABLE `egg_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_variables_egg_id_foreign` (`egg_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_short_unique` (`short`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mounts`
--
ALTER TABLE `mounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mounts_id_unique` (`id`),
  ADD UNIQUE KEY `mounts_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `mounts_name_unique` (`name`);

--
-- Indexes for table `mount_node`
--
ALTER TABLE `mount_node`
  ADD UNIQUE KEY `mount_node_node_id_mount_id_unique` (`node_id`,`mount_id`);

--
-- Indexes for table `mount_server`
--
ALTER TABLE `mount_server`
  ADD UNIQUE KEY `mount_server_server_id_mount_id_unique` (`server_id`,`mount_id`);

--
-- Indexes for table `nests`
--
ALTER TABLE `nests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_uuid_unique` (`uuid`);

--
-- Indexes for table `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nodes_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `nodes_daemon_token_id_unique` (`daemon_token_id`),
  ADD KEY `nodes_location_id_foreign` (`location_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `recovery_tokens`
--
ALTER TABLE `recovery_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recovery_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_server_id_foreign` (`server_id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `servers_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `servers_uuidshort_unique` (`uuidShort`),
  ADD UNIQUE KEY `servers_allocation_id_unique` (`allocation_id`),
  ADD UNIQUE KEY `servers_external_id_unique` (`external_id`),
  ADD KEY `servers_node_id_foreign` (`node_id`),
  ADD KEY `servers_owner_id_foreign` (`owner_id`),
  ADD KEY `servers_nest_id_foreign` (`nest_id`),
  ADD KEY `servers_egg_id_foreign` (`egg_id`);

--
-- Indexes for table `server_transfers`
--
ALTER TABLE `server_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `server_transfers_server_id_foreign` (`server_id`);

--
-- Indexes for table `server_variables`
--
ALTER TABLE `server_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `server_variables_server_id_foreign` (`server_id`),
  ADD KEY `server_variables_variable_id_foreign` (`variable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `subusers`
--
ALTER TABLE `subusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subusers_user_id_foreign` (`user_id`),
  ADD KEY `subusers_server_id_foreign` (`server_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_schedule_id_sequence_id_index` (`schedule_id`,`sequence_id`);

--
-- Indexes for table `tasks_log`
--
ALTER TABLE `tasks_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_external_id_index` (`external_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocations`
--
ALTER TABLE `allocations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `databases`
--
ALTER TABLE `databases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_hosts`
--
ALTER TABLE `database_hosts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eggs`
--
ALTER TABLE `eggs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `egg_variables`
--
ALTER TABLE `egg_variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `mounts`
--
ALTER TABLE `mounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nests`
--
ALTER TABLE `nests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nodes`
--
ALTER TABLE `nodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recovery_tokens`
--
ALTER TABLE `recovery_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `server_transfers`
--
ALTER TABLE `server_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_variables`
--
ALTER TABLE `server_variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subusers`
--
ALTER TABLE `subusers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_log`
--
ALTER TABLE `tasks_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocations`
--
ALTER TABLE `allocations`
  ADD CONSTRAINT `allocations_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `allocations_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `backups`
--
ALTER TABLE `backups`
  ADD CONSTRAINT `backups_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `databases`
--
ALTER TABLE `databases`
  ADD CONSTRAINT `databases_database_host_id_foreign` FOREIGN KEY (`database_host_id`) REFERENCES `database_hosts` (`id`),
  ADD CONSTRAINT `databases_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`);

--
-- Constraints for table `database_hosts`
--
ALTER TABLE `database_hosts`
  ADD CONSTRAINT `database_hosts_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `eggs`
--
ALTER TABLE `eggs`
  ADD CONSTRAINT `eggs_config_from_foreign` FOREIGN KEY (`config_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `eggs_copy_script_from_foreign` FOREIGN KEY (`copy_script_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `service_options_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `egg_variables`
--
ALTER TABLE `egg_variables`
  ADD CONSTRAINT `service_variables_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nodes`
--
ALTER TABLE `nodes`
  ADD CONSTRAINT `nodes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `recovery_tokens`
--
ALTER TABLE `recovery_tokens`
  ADD CONSTRAINT `recovery_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `servers_allocation_id_foreign` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`id`),
  ADD CONSTRAINT `servers_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`),
  ADD CONSTRAINT `servers_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`),
  ADD CONSTRAINT `servers_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`),
  ADD CONSTRAINT `servers_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `server_transfers`
--
ALTER TABLE `server_transfers`
  ADD CONSTRAINT `server_transfers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `server_variables`
--
ALTER TABLE `server_variables`
  ADD CONSTRAINT `server_variables_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `server_variables_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `egg_variables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subusers`
--
ALTER TABLE `subusers`
  ADD CONSTRAINT `subusers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subusers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
