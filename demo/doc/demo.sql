/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/20 16:36:50                           */
/*==============================================================*/


DROP TABLE IF EXISTS SYS_USER;

/*==============================================================*/
/* Table: SYS_USER                                              */
/*==============================================================*/
CREATE TABLE SYS_USER
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   LOGIN_NAME           VARCHAR(100) NOT NULL,
   PASSWORD             VARCHAR(100) NOT NULL,
   SALT                 VARCHAR(100) NOT NULL,
   PRIMARY KEY (ID),
   UNIQUE KEY AK_LOGIN_NAME (LOGIN_NAME)
);

