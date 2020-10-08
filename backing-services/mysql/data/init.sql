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
(1, 1, '127.0.0.1', 'localhost', 1045, NULL, NULL, NULL, '2020-09-18 16:05:11'),
(2, 1, '127.0.0.1', 'games.netsoc.co', 1046, NULL, NULL, NULL, '2020-10-08 09:33:03'),
(3, 1, '127.0.0.1', 'games.netsoc.co', 1047, NULL, NULL, NULL, '2020-10-08 09:33:04'),
(4, 1, '127.0.0.1', 'games.netsoc.co', 1048, NULL, NULL, NULL, '2020-10-08 09:33:04'),
(5, 1, '127.0.0.1', 'games.netsoc.co', 1049, NULL, NULL, NULL, '2020-10-08 09:33:04'),
(6, 1, '127.0.0.1', 'games.netsoc.co', 1050, 6, NULL, NULL, '2020-10-08 09:33:04'),
(7, 1, '127.0.0.1', 'games.netsoc.co', 1051, NULL, NULL, NULL, '2020-10-08 09:33:04'),
(8, 1, '127.0.0.1', 'games.netsoc.co', 1052, 8, NULL, NULL, '2020-10-08 09:33:04'),
(9, 1, '127.0.0.1', 'games.netsoc.co', 1053, NULL, NULL, NULL, NULL),
(10, 1, '127.0.0.1', 'games.netsoc.co', 1054, NULL, NULL, NULL, NULL),
(11, 1, '127.0.0.1', 'games.netsoc.co', 1055, NULL, NULL, NULL, NULL),
(12, 1, '127.0.0.1', 'games.netsoc.co', 1056, NULL, NULL, NULL, NULL),
(13, 1, '127.0.0.1', 'games.netsoc.co', 1057, NULL, NULL, NULL, NULL),
(14, 1, '127.0.0.1', 'games.netsoc.co', 1058, NULL, NULL, NULL, '2020-10-08 09:33:56'),
(15, 1, '127.0.0.1', 'games.netsoc.co', 1059, NULL, NULL, NULL, NULL),
(16, 1, '127.0.0.1', 'games.netsoc.co', 1060, NULL, NULL, NULL, NULL),
(17, 1, '127.0.0.1', 'games.netsoc.co', 1061, NULL, NULL, NULL, NULL),
(18, 1, '127.0.0.1', 'games.netsoc.co', 1062, 10, NULL, NULL, '2020-10-08 09:35:51'),
(19, 1, '127.0.0.1', 'games.netsoc.co', 1063, 11, NULL, NULL, '2020-10-08 09:35:51'),
(20, 1, '127.0.0.1', 'games.netsoc.co', 1064, 12, NULL, NULL, '2020-10-08 09:35:51'),
(21, 1, '127.0.0.1', 'games.netsoc.co', 1065, 13, NULL, NULL, '2020-10-08 09:35:51'),
(22, 1, '127.0.0.1', 'games.netsoc.co', 1066, 14, NULL, NULL, '2020-10-08 09:35:51'),
(23, 1, '127.0.0.1', 'games.netsoc.co', 1067, 15, NULL, NULL, '2020-10-08 09:36:16'),
(24, 1, '127.0.0.1', 'games.netsoc.co', 1068, 16, NULL, NULL, '2020-10-08 09:36:16'),
(25, 1, '127.0.0.1', 'games.netsoc.co', 1069, 17, NULL, NULL, '2020-10-08 09:36:16'),
(26, 1, '127.0.0.1', 'games.netsoc.co', 1070, 18, NULL, NULL, '2020-10-08 09:36:17'),
(27, 1, '127.0.0.1', 'games.netsoc.co', 1071, 19, NULL, NULL, '2020-10-08 09:36:17'),
(28, 1, '127.0.0.1', 'games.netsoc.co', 1072, 20, NULL, NULL, '2020-10-08 09:36:17'),
(29, 1, '127.0.0.1', 'games.netsoc.co', 1073, 21, NULL, NULL, '2020-10-08 09:36:17');

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
(7, 3, 'Minecraft Version', 'The version of minecraft to download. \r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.', 'MINECRAFT_VERSION', 'latest', 1, 0, 'nullable|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(8, 3, 'Server Jar File', 'The name of the server jarfile to run the server with.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(9, 3, 'Download Path', 'A URL to use to download a server.jar rather than the ones in the install script. This is not user viewable.', 'DL_PATH', '', 0, 0, 'nullable|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(10, 3, 'Build Number', 'The build number for the paper release.\r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.', 'BUILD_NUMBER', 'latest', 1, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(13, 5, 'Server Jar File', 'The name of the server jarfile to run the server with.', 'SERVER_JARFILE', 'server.jar', 1, 1, 'required|regex:/^([\\w\\d._-]+)(\\.jar)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(14, 5, 'Server Version', 'The version of Minecraft Vanilla to install. Use \"latest\" to install the latest version.', 'VANILLA_VERSION', 'latest', 1, 1, 'required|string|between:3,15', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(25, 7, 'Map', 'The default map for the server.', 'SRCDS_MAP', 'de_dust2', 1, 1, 'required|string|alpha_dash', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(26, 7, 'Steam Account Token', 'The Steam Account Token required for the server to be displayed publicly.', 'STEAM_ACC', '', 1, 1, 'required|string|alpha_num|size:32', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(27, 7, 'Source AppID', 'Required for game to update on server restart. Do not modify this.', 'SRCDS_APPID', '740', 0, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(31, 9, 'Map', 'The default map for the server.', 'SRCDS_MAP', 'gm_flatgrass', 1, 1, 'required|string|alpha_dash', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(32, 9, 'Steam Account Token', 'The Steam Account Token required for the server to be displayed publicly.', 'STEAM_ACC', '', 1, 1, 'nullable|string|alpha_num|size:32', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(33, 9, 'Source AppID', 'Required for game to update on server restart. Do not modify this.', 'SRCDS_APPID', '4020', 0, 0, 'required|string|max:20', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(34, 9, 'Workshop ID', 'The ID of your workshop collection (the numbers at the end of the URL)', 'WORKSHOP_ID', '', 1, 1, 'nullable|integer', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(35, 9, 'Gamemode', 'The gamemode of your server.', 'GAMEMODE', 'sandbox', 1, 1, 'required|string', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(36, 9, 'Max Players', 'The maximum amount of players allowed on your game server.', 'MAX_PLAYERS', '32', 1, 1, 'required|integer|max:128', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(37, 9, 'Tickrate', 'The tickrate defines how fast the server will update each entities location.', 'TICKRATE', '22', 1, 1, 'required|integer|max:100', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(41, 11, 'Game ID', 'The ID corresponding to the game to download and run using SRCDS.', 'SRCDS_APPID', '232250', 1, 0, 'required|regex:/^(232250)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(42, 11, 'Game Name', 'The name corresponding to the game to download and run using SRCDS.', 'SRCDS_GAME', 'tf', 1, 0, 'required|regex:/^(tf)$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
(43, 11, 'Default Map', 'The default map to use when starting the server.', 'SRCDS_MAP', 'cp_dustbowl', 1, 1, 'required|regex:/^(\\w{1,20})$/', '2020-09-17 23:37:42', '2020-09-17 23:37:42'),
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
(6, NULL, '8bd6c51b-5db7-43bb-929a-892e0864209a', '8bd6c51b', 1, 'Vanilla Minecraft', 'Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 6, 1, 5, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}', 'quay.io/pterodactyl/core:java', 1, 0, 0, 0, '2020-10-08 09:33:04', '2020-10-08 09:33:56'),
(8, NULL, '4eb41e6b-5dd7-4163-8d02-4ef0d4228855', '4eb41e6b', 1, 'Counter-Strike: Global Offensive', 'Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 8, 2, 7, './srcds_run -game csgo -console -port {{SERVER_PORT}} +ip 0.0.0.0 +map {{SRCDS_MAP}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:33:04', '2020-10-08 09:33:04'),
(10, NULL, '73d620e4-7b1c-44b5-be89-188376616bac', '73d620e4', 1, 'Paper', 'High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 18, 1, 3, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}', 'quay.io/pterodactyl/core:java', 1, 0, 0, 0, '2020-10-08 09:35:51', '2020-10-08 09:36:21'),
(11, NULL, 'f8b8a3f0-6373-4e39-9f26-d033e78487da', 'f8b8a3f0', 1, 'Garrys Mod', 'Garrys Mod, is a sandbox physics game created by Garry Newman, and developed by his company, Facepunch Studios.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 19, 2, 9, './srcds_run -game garrysmod -console -port {{SERVER_PORT}} +ip 0.0.0.0 +host_workshop_collection {{WORKSHOP_ID}} +map {{SRCDS_MAP}} +gamemode {{GAMEMODE}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}} +maxplayers {{MAX_PLAYERS}}  -tickrate {{TICKRATE}}', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:35:51', '2020-10-08 09:35:51'),
(12, NULL, 'c2af46e6-1260-4b7b-b9d4-125cdf94929a', 'c2af46e6', 1, 'Team Fortress 2', 'Team Fortress 2 is a team-based first-person shooter multiplayer video game developed and published by Valve Corporation. It is the sequel to the 1996 mod Team Fortress for Quake and its 1999 remake.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 20, 2, 11, './srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:35:51', '2020-10-08 09:35:51'),
(13, NULL, 'd1201224-9ab9-4f76-9a64-44125287dfec', 'd1201224', 1, 'Teamspeak3 Server', 'VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 21, 3, 13, './ts3server default_voice_port={{SERVER_PORT}} query_port={{SERVER_PORT}} filetransfer_ip=0.0.0.0 filetransfer_port={{FILE_TRANSFER}} license_accepted=1', 'quay.io/parkervcp/pterodactyl-images:base_debian', 0, 0, 0, 0, '2020-10-08 09:35:51', '2020-10-08 09:35:51'),
(14, NULL, '08915d91-6cc7-4f3b-9af1-97b8196df419', '08915d91', 1, 'Rust', 'The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.', 0, 0, 1, 2000, 2000, 0, 500, 400, '6', 1, 22, 4, 14, './RustDedicated -batchmode +server.port {{SERVER_PORT}} +server.identity \"rust\" +rcon.port {{RCON_PORT}} +rcon.web true +server.hostname \\\"{{HOSTNAME}}\\\" +server.level \\\"{{LEVEL}}\\\" +server.description \\\"{{DESCRIPTION}}\\\" +server.url \\\"{{SERVER_URL}}\\\" +server.headerimage \\\"{{SERVER_IMG}}\\\" +server.worldsize \\\"{{WORLD_SIZE}}\\\" +server.seed \\\"{{WORLD_SEED}}\\\" +server.maxplayers {{MAX_PLAYERS}} +rcon.password \\\"{{RCON_PASS}}\\\" +server.saveinterval {{SAVEINTERVAL}} {{ADDITIONAL_ARGS}}', 'quay.io/pterodactyl/core:rust', 0, 0, 0, 0, '2020-10-08 09:35:51', '2020-10-08 09:35:51'),
(15, NULL, '39c7d6f7-7cd8-4e4f-9ddf-026249c1687e', '39c7d6f7', 1, 'Paper', 'High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 23, 1, 3, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}', 'quay.io/pterodactyl/core:java', 1, 0, 0, 0, '2020-10-08 09:36:16', '2020-10-08 09:36:52'),
(16, NULL, 'c55a247e-c0b7-4bd6-8693-b5a50f70c666', 'c55a247e', 1, 'Vanilla Minecraft', 'Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 24, 1, 5, 'java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}', 'quay.io/pterodactyl/core:java', 0, 0, 0, 0, '2020-10-08 09:36:16', '2020-10-08 09:36:16'),
(17, NULL, 'e2842f29-34f2-492e-bdac-360f5d5db544', 'e2842f29', 1, 'Counter-Strike: Global Offensive', 'Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 25, 2, 7, './srcds_run -game csgo -console -port {{SERVER_PORT}} +ip 0.0.0.0 +map {{SRCDS_MAP}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:36:16', '2020-10-08 09:36:16'),
(18, NULL, '6f74046f-fc9e-499d-9b41-bd64c1a63fe7', '6f74046f', 1, 'Garrys Mod', 'Garrys Mod, is a sandbox physics game created by Garry Newman, and developed by his company, Facepunch Studios.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 26, 2, 9, './srcds_run -game garrysmod -console -port {{SERVER_PORT}} +ip 0.0.0.0 +host_workshop_collection {{WORKSHOP_ID}} +map {{SRCDS_MAP}} +gamemode {{GAMEMODE}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}} +maxplayers {{MAX_PLAYERS}}  -tickrate {{TICKRATE}}', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:36:17', '2020-10-08 09:36:17'),
(19, NULL, '25e4d0cc-c67c-4370-bd17-530d44ce58bf', '25e4d0cc', 1, 'Team Fortress 2', 'Team Fortress 2 is a team-based first-person shooter multiplayer video game developed and published by Valve Corporation. It is the sequel to the 1996 mod Team Fortress for Quake and its 1999 remake.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 27, 2, 11, './srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart', 'quay.io/pterodactyl/core:source', 0, 0, 0, 0, '2020-10-08 09:36:17', '2020-10-08 09:36:17'),
(20, NULL, '9e262a75-5440-43ae-9760-cf85fb182172', '9e262a75', 1, 'Teamspeak3 Server', 'VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 28, 3, 13, './ts3server default_voice_port={{SERVER_PORT}} query_port={{SERVER_PORT}} filetransfer_ip=0.0.0.0 filetransfer_port={{FILE_TRANSFER}} license_accepted=1', 'quay.io/parkervcp/pterodactyl-images:base_debian', 0, 0, 0, 0, '2020-10-08 09:36:17', '2020-10-08 09:36:17'),
(21, NULL, '787e7f7f-ef46-4214-b39e-cf1cec6e2192', '787e7f7f', 1, 'Rust', 'The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.', 0, 0, 2, 2000, 2000, 0, 500, 400, '6', 1, 29, 4, 14, './RustDedicated -batchmode +server.port {{SERVER_PORT}} +server.identity \"rust\" +rcon.port {{RCON_PORT}} +rcon.web true +server.hostname \\\"{{HOSTNAME}}\\\" +server.level \\\"{{LEVEL}}\\\" +server.description \\\"{{DESCRIPTION}}\\\" +server.url \\\"{{SERVER_URL}}\\\" +server.headerimage \\\"{{SERVER_IMG}}\\\" +server.worldsize \\\"{{WORLD_SIZE}}\\\" +server.seed \\\"{{WORLD_SEED}}\\\" +server.maxplayers {{MAX_PLAYERS}} +rcon.password \\\"{{RCON_PASS}}\\\" +server.saveinterval {{SAVEINTERVAL}} {{ADDITIONAL_ARGS}}', 'quay.io/pterodactyl/core:rust', 0, 0, 0, 0, '2020-10-08 09:36:17', '2020-10-08 09:36:17');

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
(15, 6, 13, 'server.jar', NULL, NULL),
(16, 6, 14, 'latest', NULL, NULL),
(27, 8, 25, 'de_dust2', NULL, NULL),
(28, 8, 26, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(29, 8, 27, '740', NULL, NULL),
(40, 10, 7, 'latest', NULL, NULL),
(41, 10, 8, 'server.jar', NULL, NULL),
(42, 10, 9, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(43, 10, 10, 'latest', NULL, NULL),
(44, 11, 31, 'gm_flatgrass', NULL, NULL),
(45, 11, 32, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(46, 11, 33, '4020', NULL, NULL),
(47, 11, 34, '123', NULL, NULL),
(48, 11, 35, 'sandbox', NULL, NULL),
(49, 11, 36, '32', NULL, NULL),
(50, 11, 37, '22', NULL, NULL),
(51, 12, 41, '232250', NULL, NULL),
(52, 12, 42, 'tf', NULL, NULL),
(53, 12, 43, 'cp_dustbowl', NULL, NULL),
(54, 13, 46, 'latest', NULL, NULL),
(55, 13, 47, '30033', NULL, NULL),
(56, 14, 48, 'A Rust Server', NULL, NULL),
(57, 14, 49, '0', NULL, NULL),
(58, 14, 50, 'Procedural Map', NULL, NULL),
(59, 14, 51, 'Powered by Pterodactyl', NULL, NULL),
(60, 14, 52, 'http://pterodactyl.io', NULL, NULL),
(61, 14, 53, '3000', NULL, NULL),
(62, 14, 54, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(63, 14, 55, '40', NULL, NULL),
(64, 14, 56, 'https://i.imgur.com/6wKPwk1.png', NULL, NULL),
(65, 14, 57, '28016', NULL, NULL),
(66, 14, 58, 'CHANGEME', NULL, NULL),
(67, 14, 59, '60', NULL, NULL),
(68, 14, 60, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(69, 15, 7, 'latest', NULL, NULL),
(70, 15, 8, 'server.jar', NULL, NULL),
(71, 15, 9, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(72, 15, 10, 'latest', NULL, NULL),
(73, 16, 13, 'server.jar', NULL, NULL),
(74, 16, 14, 'latest', NULL, NULL),
(75, 17, 25, 'de_dust2', NULL, NULL),
(76, 17, 26, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(77, 17, 27, '740', NULL, NULL),
(78, 18, 31, 'gm_flatgrass', NULL, NULL),
(79, 18, 32, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(80, 18, 33, '4020', NULL, NULL),
(81, 18, 34, '123', NULL, NULL),
(82, 18, 35, 'sandbox', NULL, NULL),
(83, 18, 36, '32', NULL, NULL),
(84, 18, 37, '22', NULL, NULL),
(85, 19, 41, '232250', NULL, NULL),
(86, 19, 42, 'tf', NULL, NULL),
(87, 19, 43, 'cp_dustbowl', NULL, NULL),
(88, 20, 46, 'latest', NULL, NULL),
(89, 20, 47, '30033', NULL, NULL),
(90, 21, 48, 'A Rust Server', NULL, NULL),
(91, 21, 49, '0', NULL, NULL),
(92, 21, 50, 'Procedural Map', NULL, NULL),
(93, 21, 51, 'Powered by Pterodactyl', NULL, NULL),
(94, 21, 52, 'http://pterodactyl.io', NULL, NULL),
(95, 21, 53, '3000', NULL, NULL),
(96, 21, 54, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL),
(97, 21, 55, '40', NULL, NULL),
(98, 21, 56, 'https://i.imgur.com/6wKPwk1.png', NULL, NULL),
(99, 21, 57, '28016', NULL, NULL),
(100, 21, 58, 'CHANGEME', NULL, NULL),
(101, 21, 59, '60', NULL, NULL),
(102, 21, 60, 'INSERTHEREINSERTHEREINSERTHEREIN', NULL, NULL);

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
('Ktg2upYbCcT7rmM0vJOXpak9QDSoJh18IcDZLcjm', 1, '172.23.0.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbU51VFU5REsybzNlRVJUU0ZWVlVuQlZTa1pMU25jOVBTSXNJblpoYkhWbElqb2lRbFZOTDFab1puVkxPR3BQZHpjdlpHRlRZbnBzVm5WUVQzY3ZaalpLTUV4cFFVTjFiMWQ2VkZSelNYVnpNRzlEVWxrM04yTkdZakVyUzNRd1VIRXdibTU2V25oQkwwSmpOemxCUW05bFFXeHJXVWxZVVVzelFqZEhNelp6TTFGWFpHSnZOalV6ZVRJM2F5dHRiaTkyVGpsVFJFaElTbEZwVTJ3eVdrRmFWbWhzZUhjcmRuUldkVWRHWXpOd1Mwb3JabkJCYzFRemRFSnBSbEo2YlZaT1ZHNWpiM1Z2UmtoTmMzbDZUbGh1ZWxOMFQwWlJZVWhEZFRKdFNXaERlSFZhVUc5aldtOXZTMklyZFRKeVpuZ3JheTgxWldWc2JFeERXbWxRTTFsR01raEZjbmRLVVdKS01EZHdXRmxTY0ZCa01GaFZhMU53YXpOVWIyNW9ZMEprUW1aNE1HTlNWR3BuUVdoQ2RtZHlORFppZUZodmFXeE5kR3RhT0hWWE5XWkRRMU13UTJScWVEWkdaVmRCVlhSR1p6bHJjekJuZFVkTFNFWmpSVVZsWVZOTFNuQjZTVk4wWVhkNmVHSmtSbkpaTDBoRmNrOWlNVlphWkRoT1JtSXlUM0k0WW5GcGIyMUhWaTlPZW1GRlFXVlNjV1paZGxCVlMxcGhjM05ETTBVdmVFNTZkR1pKUVRKRU5WaFJZWEI2Y2xkMVdUSnJWRGxHTVhkVFR6RjNWU3R1VURoT1NHZEZWbEF2YjJaWVFtczVkbE5wUVd4Vk0xTm9MMWhJV0VaaVZsVmxiekpLVjNSM2MxbEdiRnAxYlhjeFlVdzBLMlExVm5SQmVFTnNkVlEzVDBkVmR5OTFZVWxCY3pROUlpd2liV0ZqSWpvaU9ETTJNakJtTm1VMFlUbGlOV0V5WlRoak1URmhaamczWXprek5EUXdaV0kxTldFME9EQXlZekZsWmpsaU5tUTNNamRoTURRMlpUZG1NRE5rWkRkbVlpSjk=', 1602149824),
('qdHXwYX27lJUuV6CxraMafDQa5jiHgtbx5tFrU5Z', 2, '172.23.0.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'ZXlKcGRpSTZJbUp4ZDFGMlYwaFdZazRyZUVwcldHNUxZMWQxYkhjOVBTSXNJblpoYkhWbElqb2lSMnczVFRaRWJHOXFiRFJQVVU4MFYwNW1SVTFNV0dScFoxcDFORU5xV1hwRlRITnlVMDVHT0RBNWVFdGFWMHB0UVVaQldWRldUM0E0WjBoamRubGpSa3hhVlhkRFRGaDJaalV2THpOM1NEUTFlbXBqTUV4S2JVZzBXRXBRTW5kTmJHUXpVMVFyTWxkTVdIcENhMUZPVnpORWJtMDBiVWxNUkdGMGVUVmFTVGhuTVdsSWVrTnBhVVUxYWxSd2MxTnBiRUprZW5OVFFtVk1hbGhKVUdsUU0yNHhOVXBxZVZsVGFVWkhXV2RsY25SYWQwTlBSMHQwVEZkNmVYQnZaV1pVTUUxUWVHeEVNRmhqWTB3ek1rZFFTVEpFYUdKTk1tMDVZV2M0WlcxMVUwSlBORUlyU25Cd05UaE9TMDF1Y1RsRlRGZHRXVmxGYm5vdmEwOVNkV2h0WldSWmVEa3phRUkxU21nMlkyVkNhR2x1TjIxcU5HRk9RbFJRVURoMlpYVmplVzFEZUdFMk1GSnNabkJZYm1KSGVURjBRMmx4ZDNOWWMzQlpUMUIzVUN0a0syaFdNalJ0U21SU2QycHRNR3R2SzNKcWNHMWhlR2hWY0d3M2JVMXdPQ3RYVkRnMWJYUkpVRlYyVHpGSmRHaGtka2c0ZWxKeVUwOUVVWFF2TDJ4dVdVSnNhR0o0T1hSRVRVNVBhMHBsWmxGVlNUQlBibms1WVc4eFkzZ3JkRmQwVG1oT1UySklUMEkxZFZWaGMwWTFUM2hTTm1sSmRUUmhiRnA0TDBoSksweHJjWFphYTBJME5VRlJUVE5VVXpZMVRXOWtNV2RSUldvNGFYZDVaRmxqVDNsWlNYWkdRM05vWjBaQ1pFZ3pTaTk2YkZsSFZIaHlSRkYxUlRCaFRtTk1hRkJJU1RoRmJFRTBZMFZLVm5SVVJqZGpVblE0Um1kc2JVZGliU3QxV0ZVNVEyNHJaRUZDYm1GQ2NHSXZlblZJYW5ocGRUUTJjbFkwVVdKdGVFcGhiVlpyY1hRNWMzWXJWM2xsUTJ0VGN6RklUREpEWjNOUFpFZG1TbEV2TmtNdmR5dERVMHcxTDNsMGFFdENabGhqTnpjNGRIazROUzh2Y201WWEyNUtNRTFQVXpjNFZqSkpjbFlyVG5rNFozUkRRbXBwSzFGS1NVSmhLMkpMTUdwc1NUZFdXRnAwUldsdWVHdDZZMVptUkRkNVpqTkNWRzlJZERSaFZHMHdVV05ITjNJMlJrRXpNMmxYTldOb2NFRXdlQ3N4THpScGVHSTBPV3R5ZDBadGJHdHhWWEpNVUc1V2RGUTVkRlJZY0RoNE5YUXhMMmd5YlhKTWN6WnJhWE12YnpaTldFbFVjV3BJTjFoQ05YQjBWMkkyVlU0eWFFa3hZVmtyYlVNd2RWZDBkWE54VGl0dFdHWlJORDBpTENKdFlXTWlPaUl6WXpCaE16RTNPRE0xTkdWbE9UTm1OakF4WTJGbU16WTFOamxtWVRJNVpHWTFZekF4WVRkalkyVTRZVFF5WkRjMFpEZGpZamRsWmpJNFpHUmhOVGhrSW4wPQ==', 1602149779);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `server_transfers`
--
ALTER TABLE `server_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `server_variables`
--
ALTER TABLE `server_variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

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
