CREATE TABLE IF NOT EXISTS `apps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_key` varchar(45) NOT NULL,
  `app_secret` varchar(45) NOT NULL,
  `app_secure_key` varchar(45) NOT NULL,
  `app_status` tinyint DEFAULT '0',
  `created_time` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `app_type` tinyint DEFAULT '0',
  `app_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_appkey` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `appexts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_key` varchar(50) DEFAULT NULL,
  `app_item_key` varchar(50) DEFAULT NULL,
  `app_item_value` varchar(2048) DEFAULT NULL,
  `updated_time` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_APPKEY_APPITEMKEY` (`app_key`,`app_item_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `globalconfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(50) DEFAULT NULL,
  `conf_value` varchar(2000) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_key` (`conf_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT IGNORE INTO `globalconfs` (`conf_key`,`conf_value`)VALUES('jchatcommondb_version','20250201');