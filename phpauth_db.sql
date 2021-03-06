--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(150) NOT NULL,
  `user_password_hash` varchar(60) NOT NULL,
  `user_is_activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` varchar(45) NOT NULL,
  `log_comment` varchar(100) DEFAULT NULL,
  `log_ip_address` varchar(45) NOT NULL,
  `log_date` int(11) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_user_id` (`log_user_id`),
  CONSTRAINT `log_user_id` FOREIGN KEY (`log_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
  `session_uuid` varchar(36) NOT NULL,
  `session_user_id` int(11) NOT NULL,
  `session_user_agent` varchar(1024) NOT NULL,
  `session_ip_address` varchar(45) NOT NULL COMMENT '45 characters to support IPv6 addresses and IPv4-mapped IPv6 addresses',
  `session_creation_date` int(11) NOT NULL,
  `session_expiry_date` int(11) NOT NULL,
  `session_last_active_date` int(11) DEFAULT NULL,
  `session_is_persistent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_uuid`),
  UNIQUE KEY `uuid` (`session_uuid`),
  KEY `session_user_id` (`session_user_id`),
  CONSTRAINT `session_user_id` FOREIGN KEY (`session_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;