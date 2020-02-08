CREATE TABLE IF NOT EXISTS `users` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT NOW(),
    `updated_at` timestamp NOT NULL DEFAULT NOW(),
    `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_uid_unique` (`uid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

CREATE USER IF NOT EXISTS 'john'@'%' IDENTIFIED BY 'johns-password';
CREATE USER IF NOT EXISTS 'sofia'@'%' IDENTIFIED BY 'sofias-password';

INSERT IGNORE INTO users (`uid`, `name`, `email`) VALUES ('john', 'John Jordan', '112233445@umail.ucc.ie');
INSERT IGNORE INTO users (`uid`, `name`, `email`) VALUES ('sofia', 'Sofia Bosak', '544332211@umail.ucc.ie');

GRANT
    SELECT, INSERT, UPDATE, DELETE,
    CREATE, DROP, REFERENCES, INDEX,
    ALTER, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON
    *.* TO 'john'@'%';

GRANT
    SELECT, INSERT, UPDATE, DELETE,
    CREATE, DROP, REFERENCES, INDEX,
    ALTER, EXECUTE, CREATE ROUTINE, ALTER ROUTINE
ON
    `sofia\_%`.* TO 'sofia'@'%';
