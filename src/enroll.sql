CREATE TABLE `cms_register_student` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `academy` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `research` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
	`tel` varchar(50) DEFAULT NULL,  
	`teacher` varchar(50) DEFAULT NULL, 
	`idcard` varchar(50) DEFAULT NULL,  
  `isAccept` varchar(10) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注册学生';
