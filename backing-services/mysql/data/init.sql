CREATE TABLE `users` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `gid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `home_directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `uid_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `student_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `graduation_year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT NOW(),
    `updated_at` timestamp NOT NULL DEFAULT NOW(),
    `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_uid_unique` (`uid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

CREATE USER 'john'@'%' IDENTIFIED BY 'johns-password';
CREATE USER 'sofia'@'%' IDENTIFIED BY 'sofias-password';

GRANT
    SELECT, INSERT, UPDATE, DELETE,
    CREATE, DROP, REFERENCES, INDEX,
    ALTER, EXECUTE, CREATE ROUTINE, ALTER ROUTINE 
ON
    `%`.* TO 'john'@'%';

GRANT
    SELECT, INSERT, UPDATE, DELETE,
    CREATE, DROP, REFERENCES, INDEX,
    ALTER, EXECUTE, CREATE ROUTINE, ALTER ROUTINE 
ON
    `sofia\_%`.* TO 'sofia'@'%';      