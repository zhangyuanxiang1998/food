/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/5/11 16:22:05                           */
/*==============================================================*/


DROP TABLE IF EXISTS FILE_ATTACH;

DROP TABLE IF EXISTS FOOD;

DROP TABLE IF EXISTS FOOD_STEPS;

/*==============================================================*/
/* Table: FILE_ATTACH                                           */
/*==============================================================*/
CREATE TABLE FILE_ATTACH
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   FILENAME             VARCHAR(200) NOT NULL COMMENT '文件名',
   FILEPATH             VARCHAR(200) NOT NULL COMMENT '文件路径',
   EXT                  VARCHAR(100) COMMENT '扩展名',
   FILETYPE             VARCHAR(100) NOT NULL COMMENT '附件类型\r\n            如：邮件附件',
   NOTE                 VARCHAR(1024) DEFAULT NULL COMMENT '说明',
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FOOD                                                  */
/*==============================================================*/
CREATE TABLE FOOD
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   USER_ID              INT,
   FILE_ID              INT,
   FOOD_NAME            VARCHAR(100),
   DEPLOY_DATE          DATE,
   FOOD_MATERIAL        VARCHAR(1024),
   FOOD_LIKES           INT,
   FOOD_STEPS           INT,
   PRIMARY KEY (ID),
   CONSTRAINT FK_RELATIONSHIP_1 FOREIGN KEY (USER_ID)
      REFERENCES SYS_USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_RELATIONSHIP_2 FOREIGN KEY (FILE_ID)
      REFERENCES FILE_ATTACH (ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
/*==============================================================*/
/* Table: FOOD_STEPS                                            */
/*==============================================================*/
CREATE TABLE FOOD_STEPS
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   FILE_ID              INT,
   FOOD_ID              INT,
   STEP_NO              INT,
   STEP_DESC            VARCHAR(1024),
   PRIMARY KEY (ID),
   CONSTRAINT FK_RELATIONSHIP_5 FOREIGN KEY (FOOD_ID)
      REFERENCES FOOD (ID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_RELATIONSHIP_4 FOREIGN KEY (FILE_ID)
      REFERENCES FILE_ATTACH (ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
-- ----------------------------
-- Table structure for food_collect
-- ----------------------------
DROP TABLE IF EXISTS `food_collect`;
CREATE TABLE `food_collect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FOOD_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_6` (`FOOD_ID`),
  KEY `FK_RELATIONSHIP_7` (`USER_ID`),
  CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`FOOD_ID`) REFERENCES `food` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(200) DEFAULT NULL,
  `ACTIVITY_AREA` varchar(100) DEFAULT NULL,
  `ACTIVITY_ADDRESS` varchar(100) DEFAULT NULL,
  `ACTIVITY_TIME_START` datetime DEFAULT NULL,
  `ACTIVITY_TIME_END` datetime DEFAULT NULL,
  `ACTIVITY_CONTENT` text,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_12` (`USER_ID`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_file
-- ----------------------------
DROP TABLE IF EXISTS `activity_file`;
CREATE TABLE `activity_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) DEFAULT NULL,
  `ACTIVITY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_10` (`FILE_ID`),
  KEY `FK_RELATIONSHIP_11` (`ACTIVITY_ID`),
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`FILE_ID`) REFERENCES `file_attach` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `activity` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_order
-- ----------------------------
DROP TABLE IF EXISTS `activity_order`;
CREATE TABLE `activity_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_8` (`ACTIVITY_ID`),
  KEY `FK_RELATIONSHIP_9` (`USER_ID`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `activity` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
