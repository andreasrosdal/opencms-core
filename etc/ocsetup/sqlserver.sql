SET ANSI_PADDING OFF;

CREATE TABLE CMS_SYSTEMPROPERTIES
(SYSTEMPROPERTY_ID INT NOT NULL,
 SYSTEMPROPERTY_NAME VARCHAR(40) NOT NULL,
 SYSTEMPROPERTY_VALUE IMAGE,
 PRIMARY KEY (SYSTEMPROPERTY_ID),
 UNIQUE (SYSTEMPROPERTY_NAME));

CREATE TABLE CMS_USERS
(USER_ID INT NOT NULL,
 USER_NAME VARCHAR(32) NOT NULL,
 USER_PASSWORD VARCHAR(32) NOT NULL,
 USER_RECOVERY_PASSWORD VARCHAR(32) NOT NULL,
 USER_DESCRIPTION VARCHAR(255) NOT NULL,
 USER_FIRSTNAME VARCHAR(50) NOT NULL,
 USER_LASTNAME VARCHAR(50) NOT NULL,
 USER_EMAIL VARCHAR(50) NOT NULL,
 USER_LASTLOGIN DATETIME NOT NULL,
 USER_LASTUSED DATETIME NOT NULL,
 USER_FLAGS INT NOT NULL,
 USER_INFO IMAGE,
 USER_DEFAULT_GROUP_ID INT NOT NULL,
 USER_ADDRESS VARCHAR(50) NOT NULL,
 USER_SECTION VARCHAR(50) NOT NULL,
 USER_TYPE INT NOT NULL,
 PRIMARY KEY(USER_ID),
 UNIQUE(USER_NAME));

CREATE TABLE CMS_PROJECTS
(PROJECT_ID INT NOT NULL,
 USER_ID INT NOT NULL,
 GROUP_ID INT NOT NULL,
 MANAGERGROUP_ID INT NOT NULL,
 TASK_ID INT NOT NULL,
 PROJECT_NAME VARCHAR(16) NOT NULL,
 PROJECT_DESCRIPTION VARCHAR(255) NOT NULL,
 PROJECT_FLAGS INT NOT NULL,
 PROJECT_CREATEDATE DATETIME NOT NULL,
 PROJECT_TYPE INT NOT NULL,
 PRIMARY KEY (PROJECT_ID),
 UNIQUE(PROJECT_NAME,PROJECT_CREATEDATE));

CREATE TABLE CMS_BACKUP_PROJECTS
(VERSION_ID INT NOT NULL,
 PROJECT_ID INT NOT NULL,
 PROJECT_NAME VARCHAR(16) NOT NULL,
 PROJECT_PUBLISHDATE DATETIME,
 PROJECT_PUBLISHED_BY INT NOT NULL,
 PROJECT_PUBLISHED_BY_NAME VARCHAR(135),
 USER_ID INT NOT NULL,
 USER_NAME VARCHAR(135),
 GROUP_ID INT NOT NULL,
 GROUP_NAME VARCHAR(16),
 MANAGERGROUP_ID INT NOT NULL,
 MANAGERGROUP_NAME VARCHAR(16),
 PROJECT_DESCRIPTION VARCHAR(255) NOT NULL,
 PROJECT_CREATEDATE DATETIME NOT NULL,
 PROJECT_TYPE INT NOT NULL,
 TASK_ID INT NOT NULL,
 PRIMARY KEY (VERSION_ID));

CREATE TABLE CMS_PROJECTRESOURCES
(PROJECT_ID INT NOT NULL,
RESOURCE_NAME VARCHAR(248) NOT NULL,
PRIMARY KEY (PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_PROJECTRESOURCES
(VERSION_ID INT NOT NULL,
 PROJECT_ID INT NOT NULL,
 RESOURCE_NAME VARCHAR(248) NOT NULL,
 PRIMARY KEY (VERSION_ID, PROJECT_ID, RESOURCE_NAME));

CREATE TABLE CMS_PROPERTYDEF
(PROPERTYDEF_ID INT NOT NULL,
 PROPERTYDEF_NAME VARCHAR(64) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 PRIMARY KEY(PROPERTYDEF_ID),
 UNIQUE(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_ONLINE_PROPERTYDEF
(PROPERTYDEF_ID INT NOT NULL,
 PROPERTYDEF_NAME VARCHAR(64) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 PRIMARY KEY(PROPERTYDEF_ID),
 UNIQUE(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_BACKUP_PROPERTYDEF
(PROPERTYDEF_ID INT NOT NULL,
 PROPERTYDEF_NAME VARCHAR(64) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 PRIMARY KEY(PROPERTYDEF_ID),
 UNIQUE(PROPERTYDEF_NAME, RESOURCE_TYPE));

CREATE TABLE CMS_PROPERTIES
(PROPERTY_ID INT NOT NULL,
 PROPERTYDEF_ID INT NOT NULL,
 RESOURCE_ID INT NOT NULL,
 PROPERTY_VALUE VARCHAR(255) NOT NULL,
 PRIMARY KEY(PROPERTY_ID),
 UNIQUE(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_ONLINE_PROPERTIES
(PROPERTY_ID INT NOT NULL,
 PROPERTYDEF_ID INT NOT NULL,
 RESOURCE_ID INT NOT NULL,
 PROPERTY_VALUE VARCHAR(255) NOT NULL,
 PRIMARY KEY(PROPERTY_ID),
 UNIQUE(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_BACKUP_PROPERTIES
(PROPERTY_ID INT NOT NULL,
 PROPERTYDEF_ID INT NOT NULL,
 RESOURCE_ID INT NOT NULL,
 PROPERTY_VALUE VARCHAR(255) NOT NULL,
 PRIMARY KEY(PROPERTY_ID),
 UNIQUE(PROPERTYDEF_ID,
 RESOURCE_ID));

CREATE TABLE CMS_RESOURCES
(RESOURCE_ID INT NOT NULL,
 PARENT_ID INT NOT NULL,
 RESOURCE_NAME VARCHAR(248) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 RESOURCE_FLAGS INT NOT NULL,
 USER_ID INT NOT NULL,
 GROUP_ID INT NOT NULL,
 PROJECT_ID INT NOT NULL,
 FILE_ID INT NOT NULL,
 ACCESS_FLAGS INT NOT NULL,
 STATE INT NOT NULL,
 LOCKED_BY INT NOT NULL,
 LAUNCHER_TYPE INT NOT NULL,
 LAUNCHER_CLASSNAME VARCHAR(255) NOT NULL,
 DATE_CREATED DATETIME NOT NULL,
 DATE_LASTMODIFIED DATETIME NOT NULL,
 RESOURCE_SIZE INT NOT NULL,
 RESOURCE_LASTMODIFIED_BY INT NOT NULL,
 PRIMARY KEY(RESOURCE_ID),
 UNIQUE(RESOURCE_NAME));

CREATE TABLE CMS_ONLINE_RESOURCES
(RESOURCE_ID INT NOT NULL,
 PARENT_ID INT NOT NULL,
 RESOURCE_NAME VARCHAR(248) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 RESOURCE_FLAGS INT NOT NULL,
 USER_ID INT NOT NULL,
 GROUP_ID INT NOT NULL,
 PROJECT_ID INT NOT NULL,
 FILE_ID INT NOT NULL,
 ACCESS_FLAGS INT NOT NULL,
 STATE INT NOT NULL,
 LOCKED_BY INT NOT NULL,
 LAUNCHER_TYPE INT NOT NULL,
 LAUNCHER_CLASSNAME VARCHAR(255) NOT NULL,
 DATE_CREATED DATETIME NOT NULL,
 DATE_LASTMODIFIED DATETIME NOT NULL,
 RESOURCE_SIZE INT NOT NULL,
 RESOURCE_LASTMODIFIED_BY INT NOT NULL,
 PRIMARY KEY(RESOURCE_ID),
 UNIQUE(RESOURCE_NAME));

CREATE TABLE CMS_BACKUP_RESOURCES
(RESOURCE_ID INT NOT NULL,
 PARENT_ID INT NOT NULL,
 RESOURCE_NAME VARCHAR(248) NOT NULL,
 RESOURCE_TYPE INT NOT NULL,
 RESOURCE_FLAGS INT NOT NULL,
 USER_ID INT NOT NULL,
 USER_NAME VARCHAR(135),
 GROUP_ID INT NOT NULL,
 GROUP_NAME VARCHAR(16),
 PROJECT_ID INT NOT NULL,
 FILE_ID INT NOT NULL,
 ACCESS_FLAGS INT NOT NULL,
 STATE INT NOT NULL,
 LAUNCHER_TYPE INT NOT NULL,
 LAUNCHER_CLASSNAME VARCHAR(255) NOT NULL,
 DATE_CREATED DATETIME NOT NULL,
 DATE_LASTMODIFIED DATETIME NOT NULL,
 RESOURCE_SIZE INT NOT NULL,
 RESOURCE_LASTMODIFIED_BY INT NOT NULL,
 RESOURCE_LASTMODIFIED_BY_NAME VARCHAR(135),
 VERSION_ID INT NOT NULL,
 PRIMARY KEY(RESOURCE_ID),
 UNIQUE(VERSION_ID,RESOURCE_NAME));

CREATE TABLE CMS_FILES
(FILE_ID INT NOT NULL,
 FILE_CONTENT IMAGE NOT NULL,
 PRIMARY KEY (FILE_ID));

CREATE TABLE CMS_ONLINE_FILES
(FILE_ID INT NOT NULL,
 FILE_CONTENT IMAGE NOT NULL,
 PRIMARY KEY (FILE_ID));

CREATE TABLE CMS_BACKUP_FILES
(FILE_ID INT NOT NULL,
 FILE_CONTENT IMAGE NOT NULL,
 PRIMARY KEY (FILE_ID));

CREATE TABLE CMS_GROUPS
(GROUP_ID INT NOT NULL,
 PARENT_GROUP_ID INT NOT NULL,
 GROUP_NAME VARCHAR(16) NOT NULL,
 GROUP_DESCRIPTION VARCHAR(255) NOT NULL,
 GROUP_FLAGS INT NOT NULL,
 PRIMARY KEY(GROUP_ID),
 UNIQUE(GROUP_NAME));

CREATE TABLE CMS_SYSTEMID
(TABLE_KEY VARCHAR(255) NOT NULL,
 ID INT NOT NULL,
 PRIMARY KEY (TABLE_KEY));

CREATE TABLE CMS_GROUPUSERS
(GROUP_ID INT NOT NULL,
 USER_ID INT NOT NULL,
 GROUPUSER_FLAGS INT NOT NULL);

CREATE TABLE CMS_TASK
(AUTOFINISH INT,
 ENDTIME DATETIME,
 ESCALATIONTYPEREF INT,
 ID INT NOT NULL,
 INITIATORUSERREF INT,
 MILESTONEREF INT,
 NAME VARCHAR(254),
 ORIGINALUSERREF INT,
 AGENTUSERREF INT,
 PARENT INT,
 PERCENTAGE VARCHAR(50),
 PERMISSION VARCHAR(50),
 PRIORITYREF INT DEFAULT '2',
 ROLEREF INT,
 ROOT INT,
 STARTTIME DATETIME,
 STATE INT,
 TASKTYPEREF INT,
 TIMEOUT DATETIME,
 WAKEUPTIME DATETIME,
 HTMLLINK VARCHAR(254),
 ESTIMATETIME INT DEFAULT '86400',
 PRIMARY KEY (ID));

CREATE TABLE CMS_TASKTYPE
(AUTOFINISH INT,
 ESCALATIONTYPEREF INT,
 HTMLLINK VARCHAR(254),
 ID INT NOT NULL,
 NAME VARCHAR(50),
 PERMISSION VARCHAR(50),
 PRIORITYREF INT,
 ROLEREF INT,
 PRIMARY KEY (ID));

CREATE TABLE CMS_TASKLOG
(COMENT TEXT,
 EXTERNALUSERNAME VARCHAR(254),
 ID INT NOT NULL,
 STARTTIME DATETIME,
 TASKREF INT,
 USERREF INT,
 TYPE INT DEFAULT '0',
 PRIMARY KEY (ID));

CREATE TABLE CMS_TASKPAR
(ID INT NOT NULL,
 PARNAME VARCHAR(50),
 PARVALUE VARCHAR(50),
 REF INT,
 PRIMARY KEY (ID));

CREATE TABLE CMS_SESSIONS
(SESSION_ID VARCHAR(255) NOT NULL,
SESSION_LASTUSED DATETIME NOT NULL,
SESSION_DATA IMAGE NOT NULL,
PRIMARY KEY(SESSION_ID));

CREATE TABLE CMS_MODULE_ONLINE_MASTER   
(MASTER_ID INT NOT NULL,
SUB_ID INT NOT NULL,
USER_ID INT NOT NULL,
GROUP_ID INT NOT NULL,
PROJECT_ID INT NOT NULL,
ACCESS_FLAGS INT NOT NULL,
STATE INT NOT NULL,
LOCKED_BY INT NOT NULL,
LASTMODIFIED_BY INT NOT NULL,
DATE_CREATED DATETIME NOT NULL,
DATE_LASTMODIFIED DATETIME NOT NULL,
PUBLICATION_DATE DATETIME,
PURGE_DATE DATETIME,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 TEXT,
DATA_BIG_1 TEXT,
DATA_BIG_2 TEXT,
DATA_BIG_3 TEXT,
DATA_BIG_4 TEXT,
DATA_BIG_5 TEXT,
DATA_BIG_6 TEXT,
DATA_BIG_7 TEXT,
DATA_BIG_8 TEXT,
DATA_BIG_9 TEXT,
DATA_MEDIUM_0 TEXT,
DATA_MEDIUM_1 TEXT,
DATA_MEDIUM_2 TEXT,
DATA_MEDIUM_3 TEXT,
DATA_MEDIUM_4 TEXT,
DATA_MEDIUM_5 TEXT,
DATA_MEDIUM_6 TEXT,
DATA_MEDIUM_7 TEXT,
DATA_MEDIUM_8 TEXT,
DATA_MEDIUM_9 TEXT,
DATA_SMALL_0 TEXT,
DATA_SMALL_1 TEXT,
DATA_SMALL_2 TEXT,
DATA_SMALL_3 TEXT,
DATA_SMALL_4 TEXT,
DATA_SMALL_5 TEXT,
DATA_SMALL_6 TEXT,
DATA_SMALL_7 TEXT,
DATA_SMALL_8 TEXT,
DATA_SMALL_9 TEXT,
DATA_SMALL_10 TEXT,
DATA_SMALL_11 TEXT,
DATA_SMALL_12 TEXT,
DATA_SMALL_13 TEXT,
DATA_SMALL_14 TEXT,
DATA_SMALL_15 TEXT,
DATA_SMALL_16 TEXT,
DATA_SMALL_17 TEXT,
DATA_SMALL_18 TEXT,
DATA_SMALL_19 TEXT,
DATA_SMALL_20 TEXT,
DATA_SMALL_21 TEXT,
DATA_SMALL_22 TEXT,
DATA_SMALL_23 TEXT,
DATA_SMALL_24 TEXT,
DATA_SMALL_25 TEXT,
DATA_SMALL_26 TEXT,
DATA_SMALL_27 TEXT,
DATA_SMALL_28 TEXT,
DATA_SMALL_29 TEXT,
DATA_SMALL_30 TEXT,
DATA_SMALL_31 TEXT,
DATA_SMALL_32 TEXT,
DATA_SMALL_33 TEXT,
DATA_SMALL_34 TEXT,
DATA_SMALL_35 TEXT,
DATA_SMALL_36 TEXT,
DATA_SMALL_37 TEXT,
DATA_SMALL_38 TEXT,
DATA_SMALL_39 TEXT,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATETIME,
DATA_DATE_1 DATETIME,
DATA_DATE_2 DATETIME,
DATA_DATE_3 DATETIME,
DATA_DATE_4 DATETIME,
PRIMARY KEY(MASTER_ID));

CREATE TABLE CMS_MODULE_ONLINE_CHANNEL_REL
(MASTER_ID INT NOT NULL,
CHANNEL_ID INT NOT NULL,
PRIMARY KEY(CHANNEL_ID, MASTER_ID));

CREATE TABLE CMS_MODULE_ONLINE_MEDIA    
(MEDIA_ID INT NOT NULL,
MASTER_ID INT NOT NULL,
MEDIA_POSITION INT NOT NULL,
MEDIA_WIDTH INT NOT NULL,
MEDIA_HEIGHT INT NOT NULL,
MEDIA_SIZE INT NOT NULL,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT NOT NULL,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) NOT NULL,
MEDIA IMAGE NOT NULL,
PRIMARY KEY(MEDIA_ID));

CREATE TABLE CMS_MODULE_MASTER 
(MASTER_ID INT NOT NULL,
SUB_ID INT NOT NULL,
USER_ID INT NOT NULL,
GROUP_ID INT NOT NULL,
PROJECT_ID INT NOT NULL,
ACCESS_FLAGS INT NOT NULL,
STATE INT NOT NULL,
LOCKED_BY INT NOT NULL,
LASTMODIFIED_BY INT NOT NULL,
DATE_CREATED DATETIME NOT NULL,
DATE_LASTMODIFIED DATETIME NOT NULL,
PUBLICATION_DATE DATETIME,
PURGE_DATE DATETIME,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 TEXT,
DATA_BIG_1 TEXT,
DATA_BIG_2 TEXT,
DATA_BIG_3 TEXT,
DATA_BIG_4 TEXT,
DATA_BIG_5 TEXT,
DATA_BIG_6 TEXT,
DATA_BIG_7 TEXT,
DATA_BIG_8 TEXT,
DATA_BIG_9 TEXT,
DATA_MEDIUM_0 TEXT,
DATA_MEDIUM_1 TEXT,
DATA_MEDIUM_2 TEXT,
DATA_MEDIUM_3 TEXT,
DATA_MEDIUM_4 TEXT,
DATA_MEDIUM_5 TEXT,
DATA_MEDIUM_6 TEXT,
DATA_MEDIUM_7 TEXT,
DATA_MEDIUM_8 TEXT,
DATA_MEDIUM_9 TEXT,
DATA_SMALL_0 TEXT,
DATA_SMALL_1 TEXT,
DATA_SMALL_2 TEXT,
DATA_SMALL_3 TEXT,
DATA_SMALL_4 TEXT,
DATA_SMALL_5 TEXT,
DATA_SMALL_6 TEXT,
DATA_SMALL_7 TEXT,
DATA_SMALL_8 TEXT,
DATA_SMALL_9 TEXT,
DATA_SMALL_10 TEXT,
DATA_SMALL_11 TEXT,
DATA_SMALL_12 TEXT,
DATA_SMALL_13 TEXT,
DATA_SMALL_14 TEXT,
DATA_SMALL_15 TEXT,
DATA_SMALL_16 TEXT,
DATA_SMALL_17 TEXT,
DATA_SMALL_18 TEXT,
DATA_SMALL_19 TEXT,
DATA_SMALL_20 TEXT,
DATA_SMALL_21 TEXT,
DATA_SMALL_22 TEXT,
DATA_SMALL_23 TEXT,
DATA_SMALL_24 TEXT,
DATA_SMALL_25 TEXT,
DATA_SMALL_26 TEXT,
DATA_SMALL_27 TEXT,
DATA_SMALL_28 TEXT,
DATA_SMALL_29 TEXT,
DATA_SMALL_30 TEXT,
DATA_SMALL_31 TEXT,
DATA_SMALL_32 TEXT,
DATA_SMALL_33 TEXT,
DATA_SMALL_34 TEXT,
DATA_SMALL_35 TEXT,
DATA_SMALL_36 TEXT,
DATA_SMALL_37 TEXT,
DATA_SMALL_38 TEXT,
DATA_SMALL_39 TEXT,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATETIME,
DATA_DATE_1 DATETIME,
DATA_DATE_2 DATETIME,
DATA_DATE_3 DATETIME,
DATA_DATE_4 DATETIME,
PRIMARY KEY(MASTER_ID));

CREATE TABLE CMS_MODULE_CHANNEL_REL
(MASTER_ID INT NOT NULL,
CHANNEL_ID INT NOT NULL,
PRIMARY KEY(CHANNEL_ID, MASTER_ID));

CREATE TABLE CMS_MODULE_MEDIA
(MEDIA_ID INT NOT NULL,
MASTER_ID INT NOT NULL,
MEDIA_POSITION INT NOT NULL,
MEDIA_WIDTH INT NOT NULL,
MEDIA_HEIGHT INT NOT NULL,
MEDIA_SIZE INT NOT NULL,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT NOT NULL,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) NOT NULL,
MEDIA IMAGE NOT NULL,
PRIMARY KEY(MEDIA_ID));

CREATE TABLE CMS_MODULE_BACKUP_MASTER
(MASTER_ID INT NOT NULL,
SUB_ID INT NOT NULL,
USER_ID INT NOT NULL,
GROUP_ID INT NOT NULL,
PROJECT_ID INT NOT NULL,
ACCESS_FLAGS INT NOT NULL,
STATE INT NOT NULL,
LOCKED_BY INT NOT NULL,
LASTMODIFIED_BY INT NOT NULL,
DATE_CREATED DATETIME NOT NULL,
DATE_LASTMODIFIED DATETIME NOT NULL,
PUBLICATION_DATE DATETIME,
PURGE_DATE DATETIME,
FLAGS INT,
FEED_ID INT,
FEED_REFERENCE INT,
FEED_FILENAME VARCHAR(255),
TITLE VARCHAR(255),
DATA_BIG_0 TEXT,
DATA_BIG_1 TEXT,
DATA_BIG_2 TEXT,
DATA_BIG_3 TEXT,
DATA_BIG_4 TEXT,
DATA_BIG_5 TEXT,
DATA_BIG_6 TEXT,
DATA_BIG_7 TEXT,
DATA_BIG_8 TEXT,
DATA_BIG_9 TEXT,
DATA_MEDIUM_0 TEXT,
DATA_MEDIUM_1 TEXT,
DATA_MEDIUM_2 TEXT,
DATA_MEDIUM_3 TEXT,
DATA_MEDIUM_4 TEXT,
DATA_MEDIUM_5 TEXT,
DATA_MEDIUM_6 TEXT,
DATA_MEDIUM_7 TEXT,
DATA_MEDIUM_8 TEXT,
DATA_MEDIUM_9 TEXT,
DATA_SMALL_0 TEXT,
DATA_SMALL_1 TEXT,
DATA_SMALL_2 TEXT,
DATA_SMALL_3 TEXT,
DATA_SMALL_4 TEXT,
DATA_SMALL_5 TEXT,
DATA_SMALL_6 TEXT,
DATA_SMALL_7 TEXT,
DATA_SMALL_8 TEXT,
DATA_SMALL_9 TEXT,
DATA_SMALL_10 TEXT,
DATA_SMALL_11 TEXT,
DATA_SMALL_12 TEXT,
DATA_SMALL_13 TEXT,
DATA_SMALL_14 TEXT,
DATA_SMALL_15 TEXT,
DATA_SMALL_16 TEXT,
DATA_SMALL_17 TEXT,
DATA_SMALL_18 TEXT,
DATA_SMALL_19 TEXT,
DATA_SMALL_20 TEXT,
DATA_SMALL_21 TEXT,
DATA_SMALL_22 TEXT,
DATA_SMALL_23 TEXT,
DATA_SMALL_24 TEXT,
DATA_SMALL_25 TEXT,
DATA_SMALL_26 TEXT,
DATA_SMALL_27 TEXT,
DATA_SMALL_28 TEXT,
DATA_SMALL_29 TEXT,
DATA_SMALL_30 TEXT,
DATA_SMALL_31 TEXT,
DATA_SMALL_32 TEXT,
DATA_SMALL_33 TEXT,
DATA_SMALL_34 TEXT,
DATA_SMALL_35 TEXT,
DATA_SMALL_36 TEXT,
DATA_SMALL_37 TEXT,
DATA_SMALL_38 TEXT,
DATA_SMALL_39 TEXT,
DATA_INT_0 INT,
DATA_INT_1 INT,
DATA_INT_2 INT,
DATA_INT_3 INT,
DATA_INT_4 INT,
DATA_INT_5 INT,
DATA_INT_6 INT,
DATA_INT_7 INT,
DATA_INT_8 INT,
DATA_INT_9 INT,
DATA_REFERENCE_0 INT,
DATA_REFERENCE_1 INT,
DATA_REFERENCE_2 INT,
DATA_REFERENCE_3 INT,
DATA_REFERENCE_4 INT,
DATA_REFERENCE_5 INT,
DATA_REFERENCE_6 INT,
DATA_REFERENCE_7 INT,
DATA_REFERENCE_8 INT,
DATA_REFERENCE_9 INT,
DATA_DATE_0 DATETIME,
DATA_DATE_1 DATETIME,
DATA_DATE_2 DATETIME,
DATA_DATE_3 DATETIME,
DATA_DATE_4 DATETIME,
VERSION_ID INT NOT NULL,
USER_NAME VARCHAR(135),
GROUP_NAME VARCHAR(16),
LASTMODIFIED_BY_NAME VARCHAR(135),
PRIMARY KEY(MASTER_ID, VERSION_ID));

CREATE TABLE CMS_MODULE_BACKUP_MEDIA    
(MEDIA_ID INT NOT NULL,
MASTER_ID INT NOT NULL,
MEDIA_POSITION INT NOT NULL,
MEDIA_WIDTH INT NOT NULL,
MEDIA_HEIGHT INT NOT NULL,
MEDIA_SIZE INT NOT NULL,
MEDIA_MIMETYPE VARCHAR(255),
MEDIA_TYPE INT NOT NULL,
MEDIA_TITLE VARCHAR(255),
MEDIA_NAME VARCHAR(255),
MEDIA_DESCRIPTION VARCHAR(500) NOT NULL,
MEDIA IMAGE NOT NULL,
VERSION_ID INT NOT NULL,
PRIMARY KEY(MEDIA_ID, VERSION_ID));

CREATE INDEX SESSIONS_LASTUSED ON
	CMS_SESSIONS(SESSION_LASTUSED);

CREATE INDEX GROUP_PARENTID ON
  CMS_GROUPS(PARENT_GROUP_ID);

CREATE INDEX GROUPUSER_GROUPID ON
  CMS_GROUPUSERS(GROUP_ID);

CREATE INDEX GROUPUSER_USERID ON
  CMS_GROUPUSERS(USER_ID);

CREATE INDEX PROJECTS_GROUPID ON
  CMS_PROJECTS(GROUP_ID);

CREATE INDEX PROJECTS_MANAGERID ON
  CMS_PROJECTS(MANAGERGROUP_ID);

CREATE INDEX PROJECTS_USERID ON
  CMS_PROJECTS(USER_ID);

CREATE INDEX PROJECT_NAME ON
  CMS_PROJECTS(PROJECT_NAME);

CREATE INDEX PROJECT_TASKID ON
  CMS_PROJECTS(TASK_ID);

CREATE INDEX PROJECTS_FLAGS ON
CMS_PROJECTS (PROJECT_FLAGS);

CREATE INDEX RESOURCES_TYPE ON
CMS_RESOURCES (RESOURCE_TYPE);

CREATE INDEX RESOURCES_STATE ON
CMS_RESOURCES (STATE);

CREATE INDEX RESOURCES_PROJECT_TYPE ON
CMS_RESOURCES (PROJECT_ID, RESOURCE_TYPE);

CREATE INDEX RESOURCES_RESOURCEID_PROJECT ON
CMS_RESOURCES (RESOURCE_ID, PROJECT_ID);

CREATE INDEX RESOURCE_FILEID ON
  CMS_RESOURCES(FILE_ID);

CREATE INDEX RESOURCE_GROUP ON
  CMS_RESOURCES(GROUP_ID);

CREATE INDEX RESOURCE_LOCKED_BY ON
  CMS_RESOURCES(LOCKED_BY);

CREATE INDEX RESOURCE_PARENTID ON
  CMS_RESOURCES(PARENT_ID);

CREATE INDEX RESOURCE_PROJECTID ON
  CMS_RESOURCES(PROJECT_ID);

CREATE INDEX RESOURCE_USERID ON
  CMS_RESOURCES(USER_ID);

CREATE INDEX PARENT_RESOURCE_TYPE ON
  CMS_RESOURCES(PARENT_ID, RESOURCE_TYPE);

CREATE INDEX SYSTEMID ON
  CMS_SYSTEMID(TABLE_KEY, ID);

CREATE INDEX TASK_PARENT ON
  CMS_TASK(PARENT);

CREATE INDEX TASK_TYPETASKREF ON
  CMS_TASK(TASKTYPEREF);

CREATE INDEX TASKLOG_REF ON
  CMS_TASKLOG(TASKREF);

CREATE INDEX TASKLOG_USERREF ON
  CMS_TASKLOG(USERREF);

CREATE INDEX TASKPAR_REF ON
  CMS_TASKPAR(REF);

CREATE INDEX PROJECTRESOURCE_RESOURCE_NAME ON
  CMS_PROJECTRESOURCES(RESOURCE_NAME);

CREATE INDEX MASTER_SUBID ON
  CMS_MODULE_MASTER(SUB_ID);
  
CREATE INDEX ONLINEMASTER_SUBID ON
  CMS_MODULE_ONLINE_MASTER(SUB_ID);