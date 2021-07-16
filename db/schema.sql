CREATE TABLE IF NOT EXISTS `users` (
  `login_name` varchar(128) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `public_fg` tinyint(1) NOT NULL,
  `closed_fg` tinyint(1) NOT NULL,
  `price` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL,
  `sheet_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `reserved_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_id_and_sheet_id_idx` (`event_id`,`sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cancelled_reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL,
  `sheet_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `reserved_at` datetime(6) NOT NULL,
  `canceled_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_id_and_sheet_id_idx` (`event_id`,`sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `administrators` (
  `login_name` varchar(128) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`login_name`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
