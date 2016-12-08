CREATE TABLE user (
  `FromHost` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `UserName` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `Authentication_String` text COLLATE utf8_bin,
  PRIMARY KEY (`UserName`),
  ENGINE=InnoDB
);

CREATE TABLE host (
  `Name` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Address` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Comments` text COLLATE utf8_bin,
  PRIMARY KEY (`Name`),
  ENGINE=InnoDB
);

CREATE TABLE user_group (
  `Name` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Description` text COLLATE utf8_bin,
  PRIMARY KEY (`Name`),
  ENGINE=InnoDB
);

CREATE TABLE host_group (
  `Name` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Description` text COLLATE utf8_bin,
  PRIMARY KEY (`Name`),
  ENGINE=InnoDB
);

CREATE TABLE host_group_membership (
  `HostName` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GroupName` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HostName`,`GroupName`),
  FOREIGN KEY (`HostName`) REFERENCES Host(Name),
  FOREIGN KEY (`GroupName`) REFERENCES HostGroup(Name),
  ENGINE=InnoDB
);

CREATE TABLE user_group_membership (
  `UserName` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GroupName` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`UserName`,`GroupName`),
  FOREIGN KEY (`UserName`) REFERENCES User(UserName),
  FOREIGN KEY (`GroupName`) REFERENCES UserGroup(Name),
  ENGINE=InnoDB
);

CREATE TABLE  permission_type (
  `Name` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Name`),
  ENGINE=InnoDB
);

CREATE TABLE access(
  `Name` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `UserGroup` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `HostGroup` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `PermissionType` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Schema` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`Name`),
  index `relation_idx` (`UserGroup`,`HostGroup`,`PermissionType`),
  FOREIGN KEY (`UserGroup`) REFERENCES UserGroup(Name),
  FOREIGN KEY (`HostGroup`) REFERENCES HostGroup(Name),
  FOREIGN KEY (`PermissionType`) REFERENCES PermissionType(Name),
  ENGINE=InnoDB
);
