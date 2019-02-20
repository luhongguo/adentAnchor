-- 字典表
CREATE TABLE Sys_Item (
	Id varchar(50) NOT NULL,
	EnCode varchar(50) NULL ,
	ParentId varchar(50) NULL ,
	Name varchar(50) NULL ,
	Layer int NULL ,
	SortCode int NULL ,
	IsTree CHAR(1) NULL ,
	DeleteMark CHAR(1) NULL ,
	IsEnabled CHAR(1) NULL ,
	Remark varchar(500) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL ,
	PRIMARY KEY (Id)
);

-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'EnCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'Name';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'Layer';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否树形菜单', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'IsTree';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'DeleteMark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'IsEnabled';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'Remark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Item', @level2type = 'COLUMN', @level2name = N'ModifyTime';
-- 新增数据
INSERT INTO Sys_Item (Id, EnCode, ParentId, Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'xueli', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'学历', N'1', N'3', null, N'0', N'1', null, N'admin', N'2017-05-13 19:14:25.013', N'admin', N'2017-05-13 19:14:25.013');
INSERT INTO Sys_Item (Id, EnCode, ParentId, Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'7b247f60-4095-4ffe-96e0-1935a25852de', N'hunyin', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'婚姻', N'1', N'4', null, N'0', N'1', null, N'admin', N'2017-05-13 19:14:25.013', N'admin', N'2017-05-13 19:14:25.013');
INSERT INTO Sys_Item (Id, EnCode, ParentId, Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'all_items', N'0', N'数据字典', N'0', N'0', null, N'0', N'1', null,  N'admin', N'2017-05-13 19:14:25.013', N'admin', N'2017-05-13 19:14:25.013');
INSERT INTO Sys_Item (Id, EnCode, ParentId, Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role_type', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'角色类型', N'1', N'1', null, N'0', N'1', null, N'admin', N'2017-05-13 19:14:25.013', N'admin', N'2017-05-13 19:14:25.013');
INSERT INTO Sys_Item (Id, EnCode, ParentId, Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org_type', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'机构类型', N'1', N'2', null, N'0', N'1', null,  N'admin', N'2017-05-13 19:14:25.013', N'admin', N'2017-05-13 19:14:25.013');

-- 字典明细表
CREATE TABLE Sys_ItemsDetail (
	Id varchar(50) NOT NULL,
	ItemId varchar(50) NULL ,
	EnCode varchar(50) NULL ,
	Name varchar(50) NULL ,
	IsDefault CHAR(1) NULL ,
	SortCode int NULL ,
	DeleteMark CHAR(1) NULL ,
	IsEnabled CHAR(1) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL ,
	PRIMARY KEY (Id)
);

-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'ItemId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'EnCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'选项名称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'Name';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否默认', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'IsDefault';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'DeleteMark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'IsEnabled';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_ItemsDetail', @level2type = 'COLUMN', @level2name = N'ModifyTime';
-- 新增数据
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'14f0c64a-f3d8-439d-bc0a-d9a5a41a2d46', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-team', N'小组', N'0', N'4', N'0', N'1', N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'16c3d367-d63e-4426-9745-ed6824e8454d', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'shuoshi', N'硕士', N'0', N'7', N'0', N'1', N'admin', N'2017-04-29 16:49:54.183', N'admin', N'2017-04-29 16:49:54.183');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'35004B3B-96FB-475D-B3E4-0DD8815D316C', N'7b247f60-4095-4ffe-96e0-1935a25852de', N'weihun', N'未婚', N'0', N'1', N'0', N'1', N'admin', N'2017-09-11 15:32:42.320', N'admin', N'2017-09-11 15:32:42.320');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'466142E6-8494-49B0-8E07-03F168D747FE', N'7b247f60-4095-4ffe-96e0-1935a25852de', N'yihun', N'已婚', N'0', N'2', N'0', N'1', N'admin', N'2017-09-11 15:32:51.403', N'admin', N'2017-09-11 15:32:51.403');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'557427ff-8bb7-4e8b-ba3d-91f31ab02b59', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'xiaoxue', N'小学及以下', N'0', N'1', N'0', N'1', N'admin', N'2017-04-29 16:44:34.410', N'admin', N'2017-04-29 16:50:15.873');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'738aee95-3597-412e-9a0a-e7e3161c86cf', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-business', N'业务角色', N'1', N'2', N'0', N'1',  N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'7c51742f-fed3-48c4-8c5b-7f8b8c64cff0', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'benke', N'本科', N'1', N'5', N'0', N'1', N'admin', N'2017-04-29 16:46:24.133', N'admin', N'2017-04-29 16:50:25.883');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'85d02da8-06f2-4fba-9dcf-7e3b971f9028', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-company', N'公司', N'1', N'1', N'0', N'1', N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'85e46a33-b065-4ba2-99da-c02947bfc5e6', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-department', N'部门', N'0', N'2', N'0', N'1',  N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'ac53424f-adbb-4477-b534-b0bc72ea5f41', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'chuzhong', N'初中', N'0', N'2', N'0', N'1', N'admin', N'2017-04-29 16:44:56.470', N'admin', N'2017-04-29 16:44:56.470');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'C52CBE29-CB92-465F-9697-2AAB7C214FFD', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-child-dept', N'子部门', N'0', N'3', N'0', N'1', N'admin', N'2017-07-12 11:00:40.667', N'admin', N'2017-07-12 11:00:40.667');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'cb579de4-b816-435f-aaa5-f666a6838ca5', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-system', N'系统角色', N'0', N'1', N'0', N'1',  N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'cf5d4197-678f-47b9-8f35-ffc23ba68cee', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-other', N'其他角色', N'0', N'3', N'0', N'1',  N'admin', N'2017-07-12 11:00:47.137', N'admin', N'2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'd327c3ca-a557-4f95-8bbf-659fcf09782d', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'dazhuan', N'大专', N'0', N'4', N'0', N'1', N'admin', N'2017-04-29 16:45:27.437', N'admin', N'2017-04-29 16:45:27.437');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'f500ed63-e91a-40a5-8e80-6b58895007d3', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'yanjiusheng', N'研究生', N'0', N'6', N'0', N'1', N'admin', N'2017-04-29 16:46:45.813', N'admin', N'2017-04-29 16:46:45.813');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'f51b746e-476a-4e39-839f-abed4be676cf', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'gaozhong', N'高中', N'0', N'3', N'0', N'1', N'admin', N'2017-04-29 16:45:06.660', N'admin', N'2017-04-29 16:45:06.660');
INSERT INTO Sys_ItemsDetail (Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'fff309f2-9baa-4283-84a8-74c97fcd83e2', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'boshi', N'博士', N'0', N'8', N'0', N'1', N'admin', N'2017-04-29 16:50:10.027', N'admin', N'2017-09-11 15:32:23.733');

-- 日志表
CREATE TABLE Sys_Log (
	Id varchar(50) NOT NULL ,
	CreateTime datetime NULL ,
	LogLevel varchar(50) NULL ,
	Operation varchar(50) NULL ,
	Message varchar(500) NULL ,
	Account varchar(50) NULL ,
	RealName varchar(50) NULL ,
	IP varchar(50) NULL ,
	IPAddress varchar(50) NULL ,
	Browser varchar(50) NULL ,
	StackTrace varchar(500) NULL ,
	PRIMARY KEY (Id)
);

-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发生时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志等级', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'LogLevel';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作模块', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'Operation';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志消息', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'Message';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作账户', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'Account';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'真实姓名', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'RealName';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作人IP', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'IP';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作人IP归属地', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'IPAddress';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'堆栈信息', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Log', @level2type = 'COLUMN', @level2name = N'StackTrace';

-- 组织部门表
CREATE TABLE Sys_Organize (
	Id varchar(50) NOT NULL ,
	ParentId varchar(50) NULL ,
	Layer int NULL ,
	EnCode varchar(50) NULL ,
	FullName varchar(50) NULL ,
	Type int NULL ,
	ManagerId varchar(50) NULL ,
	TelePhone varchar(50) NULL ,
	WeChat varchar(50) NULL ,
	Fax varchar(50) NULL ,
	Email varchar(50) NULL ,
	Address varchar(50) NULL ,
	SortCode int NULL ,
	DeleteMark CHAR(1) NULL ,
	IsEnabled CHAR(1) NULL ,
	Remark varchar(500) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL,
	PRIMARY KEY (Id)
);


-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'ParentId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Layer';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'EnCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'全称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'FullName';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Type';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'负责人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'ManagerId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'固话', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'TelePhone';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'微信', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'WeChat';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'传真', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Fax';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮箱', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Email';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Address';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'DeleteMark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'IsEnabled';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'Remark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Organize', @level2type = 'COLUMN', @level2name = N'ModifyTime';

-- 新增数据
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'25fa48f8-00d3-4b5d-bee9-b49324410906', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'market', N'市场部', N'1', null, null, null, null, null, null, N'20', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:34.283');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'2a871804-5c78-481f-a167-7874b56a54d7', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'afterSale', N'售后部', N'1', null, null, null, null, null, null, N'70', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:39.983');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'339a409a-a5a6-49b4-9071-86d7699a9ddd', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'administration', N'行政人事部', N'1', null, null, null, null, null, null, N'40', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:43.333');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'5fc64d6e-d790-4f53-ab51-99c369860965', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'financial', N'财务部', N'1', null, null, null, null, null, null, N'50', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:46.800');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'67ccf447-0f20-4cf8-9159-a5552cf7dc10', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'project', N'项目部', N'1', null, null, null, null, null, null, N'80', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:50.257');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'0', null, N'company', N'xx', N'0', N'aa', null, null, null, N'aa@qq.com', null, N'10', N'0', N'1', null,  N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:42:33.857');
INSERT INTO Sys_Organize (Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, N'product', N'产品事业部', N'1', null, null, null, null, null, null, N'30', N'0', N'1', null, N'admin', N'2018-04-04 11:44:34.283', N'admin', N'2018-04-04 11:44:11.957');


-- 权限表
CREATE TABLE Sys_Permission (
	Id varchar(50) NOT NULL ,
	ParentId varchar(50) NULL ,
	Layer int NULL ,
	EnCode varchar(50) NULL ,
	Name varchar(50) NULL ,
	JsEvent varchar(50) NULL ,
	Icon varchar(50) NULL ,
	Url varchar(300) NULL ,
	Remark varchar(500) NULL ,
	Type int NULL ,
	SortCode int NULL ,
	IsPublic CHAR(1) NULL DEFAULT ((0)) ,
	IsEnable CHAR(1) NULL DEFAULT ((1)) ,
	IsEdit CHAR(1) NULL DEFAULT ((1)) ,
	DeleteMark CHAR(1) NULL DEFAULT ((0)) ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL ,
	PRIMARY KEY (Id)
);

-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'ParentId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'层次', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Layer';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Name';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事件', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'JsEvent';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图标', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Icon';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'链接', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Url';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Remark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块类型：1-菜单 2-按钮', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'Type';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否公开', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'IsPublic';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否可用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'IsEnable';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许编辑', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'IsEdit';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Permission', @level2type = 'COLUMN', @level2name = N'ModifyTime';
-- 新增数据
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'026550fd-2578-42ae-a041-625cda12325f', N'855f3590-b233-4224-aaff-47fb95c8353d', N'2', N'role-add', N'新增角色', N'btn_add()', N'fa fa-plus-square-o', N'/System/Role/Form', null, N'1', N'10301', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:30:21.277', N'admin', N'2017-03-28 16:30:21.277');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'069f00f6-2a82-4bbe-90d6-418f37d5ef1f', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2', N'item-detail', N'查看选项', N'btn_detail()', N'fa fa-eye', N'/System/ItemsDetail/Detail', null, N'1', N'10505', N'0', N'1', N'1', N'0', N'admin', N'2017-04-04 20:16:02.347', N'admin', N'2017-04-04 20:18:13.513');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'086ee328-5a15-40b0-8e15-291093e2e8b1', N'09157352-1252-4964-8fee-479759a95db8', N'2', N'org-edit', N'修改机构', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Organize/Form', null, N'1', N'10402', N'0', N'1', N'1', N'0', N'admin', N'2017-04-02 09:38:32.333', N'admin', N'2017-04-02 09:38:32.333');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'09157352-1252-4964-8fee-479759a95db8', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'sys-organize', N'组织机构', null, N'fa fa-building', N'/System/Organize/Index', null, N'0', N'10400', N'0', N'1', N'1', N'0', N'admin', N'2017-04-02 09:31:00.937', N'admin', N'2017-09-14 13:56:08.310');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2', N'per-delete', N'删除权限', N'btn_delete()', N'fa fa-trash-o', N'/System/Permission/Delete', null, N'1', N'10203', N'0', N'1', N'1', N'0', N'admin', N'2017-02-20 09:51:18.693', N'admin', N'2017-03-28 16:30:21.277');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2', N'user-detail', N'查看用户', N'btn_detail()', N'fa fa-eye', N'/System/User/Detail', null, N'1', N'10104', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:20:17.830', N'admin', N'2017-03-28 16:20:17.830');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'233e50fd-4860-42f9-aa7a-93853ac0434b', N'277c8647-ea81-42cf-8f7b-db353da95bbe', N'1', N'data-backup', N'数据备份', null, N'fa fa-list', N'/System/Data/Index', null, N'0', N'20100', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:30:21.277', N'admin', N'2017-07-12 10:50:53.657');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'277c8647-ea81-42cf-8f7b-db353da95bbe', N'0', N'0', null, N'系统安全', null, N'fa fa-desktop', null, null, N'0', N'20000', N'0', N'1', N'1', N'0', N'admin', null, N'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'28a045a6-61f4-4784-8578-837ad307e4e3', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2', N'per-add', N'新增权限', N'btn_add()', N'fa fa-plus-square-o', N'/System/Permission/Form', null, N'1', N'10201', N'0', N'1', N'1', N'0', N'admin', N'2017-02-13 14:28:21.813', N'admin', N'2017-03-28 16:30:21.277');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2', N'per-detail', N'查看权限', N'btn_detail()', N'fa fa-eye', N'/System/Permission/Detail', null, N'1', N'10204', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:22:05.590', N'admin', N'2017-03-28 16:22:05.590');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'0', N'0', null, N'系统管理', null, N'fa fa-cubes', null, null, N'0', N'10000', N'0', N'1', N'1', N'0', N'admin', null, N'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'855f3590-b233-4224-aaff-47fb95c8353d', N'2', N'role-delete', N'删除角色', N'btn_delete()', N'fa fa-trash-o', N'/System/Role/Delete', null, N'1', N'10303', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:32:43.533', N'admin', N'2017-03-28 16:32:43.533');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'lay-item', N'数据字典', null, N'fa fa-sitemap', N'/System/ItemsDetail/Index', null, N'0', N'10500', N'0', N'1', N'1', N'0', N'admin', N'2017-04-03 15:33:02.587', N'admin', N'2017-04-03 15:33:02.587');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2', N'user-edit', N'修改用户', N'btn_edit()', N'fa fa-edit', N'/System/User/Edit', null, N'1', N'10102', N'0', N'1', N'1', N'0', N'admin', N'2017-04-14 17:21:43.573', N'admin', N'2017-06-05 10:48:07.950');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2', N'per-edit', N'修改权限', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Permission/Form', null, N'1', N'10202', N'0', N'1', N'1', N'0', N'admin', N'2017-02-20 09:47:19.040',N'admin', N'2017-03-28 16:30:21.277');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'625cf550-4aad-4158-aff4-2a63d4f25819', N'855f3590-b233-4224-aaff-47fb95c8353d', N'2', N'role-detail', N'查看角色', N'btn_detail()', N'fa fa-eye', N'/System/Role/Detail', null, N'1', N'10304', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:34:05.080', N'admin', N'2017-03-28 16:34:05.080');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'sys-user', N'系统用户', null, N'fa fa-user-circle', N'/System/User/Index', null, N'0', N'10100', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:30:21.277', N'admin', N'2017-09-14 13:51:29.077');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2', N'user-delete', N'删除用户', N'btn_delete()', N'fa fa-trash-o', N'/System/User/Delete', null, N'1', N'10103', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:18:25.347', N'admin', N'2017-03-28 16:18:25.347');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'7ae2e6aa-0433-4eaa-9357-1adec2507345', N'aeeb56d1-5f27-42df-9d34-97ac18078390', N'2', N'log-delete', N'删除日志', N'btn_delete()', N'fa fa-trash-o', N'/System/Log/Delete', null, N'1', N'10601', N'0', N'1', N'0', N'0', N'admin', N'2017-04-19 13:21:33.503', N'admin', N'2017-04-19 13:22:35.420');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'81d1cbf0-3cff-4cde-8128-7d0d844450de', N'855f3590-b233-4224-aaff-47fb95c8353d', N'2', N'role-authorize', N'角色授权', N'btn_authorize()', N'fa fa-hand-pointer-o', N'/System/RoleAuthorize/Index', null, N'1', N'10305', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:36:42.613', N'admin', N'2017-03-28 16:36:42.613');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'82b06e80-103e-4a38-b171-740d2b0e194b', N'09157352-1252-4964-8fee-479759a95db8', N'2', N'org-add', N'新增机构', N'btn_add()', N'fa fa-plus-square-o', N'/System/Organize/Form', null, N'1', N'10401', N'0', N'1', N'1', N'0', N'admin', N'2017-04-02 09:37:47.900', N'admin', N'2017-04-02 09:37:47.900');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'85438f3b-0634-4b17-b778-aee3a5819669', N'855f3590-b233-4224-aaff-47fb95c8353d', N'2', N'role-edit', N'修改角色', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Role/Form', null, N'1', N'10302', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:31:10.750', N'admin', N'2017-03-28 16:31:10.750');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'855f3590-b233-4224-aaff-47fb95c8353d', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'sys-role', N'角色管理', null, N'fa fa-users', N'/System/Role/Index', null, N'0', N'10300', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:27:50.183', N'admin', N'2017-09-14 13:52:18.270');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'87f0aa68-fa57-43cb-84d0-e979fc4af24c', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2', N'item-delete', N'删除选项', N'btn_delete()', N'fa fa-trash-o', N'/System/ItemsDetail/Delete', null, N'1', N'10504', N'0', N'1', N'1', N'0', N'admin', N'2017-04-04 20:06:34.753', N'admin', N'2017-04-04 20:17:29.043');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'aeeb56d1-5f27-42df-9d34-97ac18078390', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'sys-log', N'操作日志', null, N'fa fa-folder-open', N'/System/Log/Index', null, N'0', N'10600', N'0', N'1', N'0', N'0', N'admin', N'2017-04-18 13:25:49.407', N'admin', N'2017-04-19 13:22:14.603');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'c04bfd8f-7e2e-4312-9148-a2e14007fa46', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2', N'item-edit', N'修改选项', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/ItemsDetail/Form', null, N'0', N'10503', N'0', N'1', N'1', N'0', N'admin', N'2017-04-04 20:05:36.310', N'admin', N'2017-04-04 20:05:36.310');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', N'09157352-1252-4964-8fee-479759a95db8', N'2', N'org-detail', N'查看机构', N'btn_detail()', N'fa fa-eye', N'/System/Organize/Detail', null, N'1', N'10404', N'0', N'1', N'1', N'0', N'admin', N'2017-04-02 09:47:18.190', N'admin', N'2017-04-02 09:47:18.190');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2', N'user-add', N'新增用户', N'btn_add()', N'fa fa-plus-square-o', N'/System/User/Form', null, N'1', N'10101', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:14:58.087', N'admin', N'2017-03-28 16:14:58.087');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'e32b7507-aaf0-42dc-8008-139250c352ee', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2', N'item-manage', N'字典管理', N'btn_manage()', N'fa fa-folder-open-o', N'/System/Item/Index', null, N'1', N'10501', N'0', N'1', N'1', N'0', N'admin', N'2017-04-03 21:30:55.433', N'admin', N'2017-04-04 10:48:52.763');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'1', N'sys-permission', N'权限管理', null, N'fa fa-suitcase', N'/System/Permission/Index', null, N'0', N'10200', N'0', N'1', N'1', N'0', N'admin', N'2017-03-28 16:30:21.277', N'admin', N'2017-03-28 16:58:50.730');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'e9478f45-0c00-435f-9a7a-35c7af1f86f7', N'09157352-1252-4964-8fee-479759a95db8', N'2', N'org-delete', N'删除机构', N'btn_delete()', N'fa fa-trash-o', N'/System/Organize/Delete', null, N'1', N'10403', N'0', N'1', N'1', N'0', N'admin', N'2017-04-02 09:45:55.757', N'admin', N'2017-04-02 09:45:55.757');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'fbee5749-8694-495f-b140-b5b3399df7ee', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2', N'item-add', N'新增选项', N'btn_add()', N'fa fa-plus-square-o', N'/System/ItemsDetail/Form', null, N'1', N'10502', N'0', N'1', N'1', N'0', N'admin', N'2017-04-04 19:46:18.233', N'admin', N'2017-04-04 19:46:50.650');


-- 角色表
CREATE TABLE Sys_Role (
	Id varchar(50) NOT NULL,
	OrganizeId varchar(50) NULL ,
	EnCode varchar(50) NULL ,
	Type int NULL ,
	Name varchar(50) NULL ,
	AllowEdit CHAR(1) NULL ,
	DeleteMark CHAR(1) NULL ,
	IsEnabled CHAR(1) NULL ,
	Remark varchar(500) NULL ,
	SortCode int NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL ,
	PRIMARY KEY (Id)
);
-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织ID', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'OrganizeId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'EnCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类：1-角色2-岗位', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'Type';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'Name';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否可编辑', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'AllowEdit';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'DeleteMark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'IsEnabled';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'Remark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_Role', @level2type = 'COLUMN', @level2name = N'ModifyTime';
-- 新增数据
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'55440eec-5622-491b-9ade-879dae179c23', N'67ccf447-0f20-4cf8-9159-a5552cf7dc10', N'implement', N'1', N'实施人员', N'1', N'0', N'0', null, N'5', N'admin', N'2017-06-05 17:33:13.370', N'admin', N'2017-06-05 17:33:13.370');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'developer', N'0', N'系统开发人员', N'0', N'0', N'1', null, N'3',N'admin', N'2017-06-05 17:33:13.370', N'admin', N'2017-06-05 17:33:13.370');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'97223b06-6b7a-47fb-b74c-173f52c519c4', N'339a409a-a5a6-49b4-9071-86d7699a9ddd', N'fileattache', N'1', N'档案专员', N'1', N'0', N'1', null, N'7', N'admin', N'2017-03-13 16:08:55.867', N'admin', N'2017-03-13 16:08:55.867');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'administrators', N'0', N'超级管理员', N'1', N'0', N'1', null, N'1', N'admin', N'2017-06-05 17:33:13.370', N'admin', N'2018-04-04 11:44:58.327');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'2a871804-5c78-481f-a167-7874b56a54d7', N'test', N'0', N'测试', N'0', N'0', N'1', N'asd', N'8', N'admin', N'2017-09-14 11:40:59.257', N'admin', N'2017-09-14 11:42:34.013');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'db60dc76-9632-44b3-ae4b-7177428bad35', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'configuration', N'0', N'系统配置员', N'0', N'0', N'1', null, N'2', N'admin', N'2017-06-05 17:33:13.370', N'admin', N'2018-04-04 11:45:31.897');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'ed66f99c-d1bd-4fe3-948a-6520a5d6b7d9', N'339a409a-a5a6-49b4-9071-86d7699a9ddd', N'person', N'1', N'人事专员', N'0', N'0', N'1', null, N'6',N'admin', N'2017-06-05 17:33:13.370', N'admin', N'2017-06-05 17:33:13.370');

-- 角色权限表
CREATE TABLE Sys_RoleAuthorize (
	Id varchar(50) NOT NULL ,
	RoleId varchar(50) NULL ,
	ModuleId varchar(50) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	PRIMARY KEY (Id)
);

-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_RoleAuthorize', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色ID', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_RoleAuthorize', @level2type = 'COLUMN', @level2name = N'RoleId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块ID', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_RoleAuthorize', @level2type = 'COLUMN', @level2name = N'ModuleId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_RoleAuthorize', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_RoleAuthorize', @level2type = 'COLUMN', @level2name = N'CreateTime';

-- 新增数据
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'018c7b35-d79b-4b48-9fa5-dd44375875c4', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'87f0aa68-fa57-43cb-84d0-e979fc4af24c', N'admin', N'2017-04-04 21:10:58.337');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'04a8f35b-e43b-4f06-aa08-2bfc272fe2a1', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'85438f3b-0634-4b17-b778-aee3a5819669', N'admin', N'2017-03-28 16:47:59.850');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'083f6bd4-c086-486c-b25a-1f2e8a3a9563', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'admin', N'2017-03-28 16:47:59.803');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'09ac4a11-2d50-48e6-b1ae-d9c18384fa5c', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'admin', N'2017-03-28 16:47:59.727');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'09d88a4f-ef46-4ca0-a95a-a1ce15aa91c0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'82b06e80-103e-4a38-b171-740d2b0e194b', N'admin', N'2017-04-02 09:48:32.997');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'164ad154-21e5-48ab-8e27-1c0ea38d066d', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e9478f45-0c00-435f-9a7a-35c7af1f86f7', N'admin', N'2017-04-02 09:48:33.027');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'165a4b08-4c60-4faf-92ea-3e143aa1e7c4', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'admin', N'2017-09-14 11:43:13.307');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'1adef545-559b-4cc3-b3c0-1debdce21f73', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'c04bfd8f-7e2e-4312-9148-a2e14007fa46', N'admin', N'2017-04-04 21:10:58.320');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'1f5af2cf-3d4a-4af6-b4e2-4c3dd76627ea', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'09157352-1252-4964-8fee-479759a95db8', N'admin', N'2017-04-02 09:48:32.977');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'23bbb1ff-9d3a-408a-a9fa-c203ef26c66a', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'fbee5749-8694-495f-b140-b5b3399df7ee', N'admin', N'2017-04-04 21:10:58.293');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'263bc5c4-5d5c-4592-a115-0f2034553e90', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'e9478f45-0c00-435f-9a7a-35c7af1f86f7', N'admin', N'2017-09-14 11:43:13.253');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'2ba622d6-60e9-4918-a3cf-f634b969bc98', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'7ae2e6aa-0433-4eaa-9357-1adec2507345', N'admin', N'2017-04-19 13:22:54.643');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'3b2baa1c-2fda-4620-a3c7-58fd45d87b0a', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'admin', N'2017-09-14 11:43:12.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'3b4052c3-e846-4cc1-bced-e818342d3e0b', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'e32b7507-aaf0-42dc-8008-139250c352ee', N'admin', N'2017-09-14 11:43:13.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'3bd543bc-3e10-4bf8-96b3-c888987c636e', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'admin', N'2017-04-03 15:34:35.697');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'3f5cf11a-4b6a-4e2f-94e5-dcc390374f75', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'086ee328-5a15-40b0-8e15-291093e2e8b1', N'admin', N'2017-04-02 09:48:33.013');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'41b4ffda-cd44-4bad-90d0-0ebec361c35e', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'233e50fd-4860-42f9-aa7a-93853ac0434b', N'admin', N'2017-03-15 13:40:27.933');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'45e1cd76-8c78-4158-a689-87c8d24ba024', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'admin', N'2017-03-28 16:47:59.787');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'4d24fcca-e1ae-4816-879f-34aa96b93dc2', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', N'admin', N'2017-09-14 11:43:12.897');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'4f5bd239-c484-4518-85c3-2c8f65aebe52', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', N'admin', N'2017-04-02 09:48:33.043');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'608619a2-fc79-4179-992d-11aef520f8de', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'87f0aa68-fa57-43cb-84d0-e979fc4af24c', N'admin', N'2017-09-14 11:43:13.440');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'648c6f72-2e50-41b7-88ea-6a57efc29102', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'28a045a6-61f4-4784-8578-837ad307e4e3', N'admin', N'2017-09-14 11:43:12.870');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'68e36f44-9a77-4377-bb71-9af61adc7b11', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'admin', N'2017-03-28 16:47:59.817');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'6a8d7415-d228-4316-abdc-6465dd8baf60', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'6bd7028f-00d1-4fd9-89d9-6ddc7ce822ce', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'7224563a-50af-42df-a66b-30e8d41e08fe', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', N'admin', N'2017-09-14 11:43:13.277');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'7375dea3-ee3d-40cb-8390-9c1cb9baf6a0', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'admin', N'2017-09-14 11:43:12.730');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'74604022-d5f2-4855-b07a-f7e1235e2ef6', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e32b7507-aaf0-42dc-8008-139250c352ee', N'admin', N'2017-04-03 21:31:55.373');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'765de5b7-be99-494e-a173-1dd2238ad1f1', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'086ee328-5a15-40b0-8e15-291093e2e8b1', N'admin', N'2017-09-14 11:43:13.223');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'76e9aef6-8030-4588-9a63-551a4a0b376e', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'78919e4f-e65d-461a-9af6-f8b5e13232e0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'28a045a6-61f4-4784-8578-837ad307e4e3', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'7b3577cf-11d2-46a0-a859-9b17a07328c7', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'admin', N'2017-03-28 16:47:59.863');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'7fdd045d-9de9-466d-a332-7c65028d9b4b', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'fbee5749-8694-495f-b140-b5b3399df7ee', N'admin', N'2017-09-14 11:43:13.380');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'80b5d2c9-74b3-42d2-897d-70fffa050fa8', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'277c8647-ea81-42cf-8f7b-db353da95bbe', N'admin', N'2017-03-15 13:40:27.910');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'810dddfa-870b-482f-a419-6326eea29c84', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'625cf550-4aad-4158-aff4-2a63d4f25819', N'admin', N'2017-03-28 16:47:59.880');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'83c14f08-2046-4ea4-b01c-a7420a264b2b', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'8cb47a49-27fe-47c9-818f-0aad37cff810', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'admin', N'2017-09-14 11:43:12.790');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'98615c60-0066-4f13-9253-70e56b3ec34c', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'admin', N'2017-09-14 11:43:12.847');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'98885c60-d3bc-49df-8eaa-f8ccb7eafaa3', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'99980d3a-ad3b-4c20-9cdd-9f809225badd', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', N'admin', N'2017-09-14 11:43:12.923');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'9b64ef96-d367-4732-a434-cf76640cab05', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'625cf550-4aad-4158-aff4-2a63d4f25819', N'admin', N'2017-09-14 11:43:13.107');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'a0b99832-8425-45ba-b483-248a3cb76a55', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'81d1cbf0-3cff-4cde-8128-7d0d844450de', N'admin', N'2017-09-14 11:43:13.133');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'aab11f11-4f6e-4d16-9fae-f1b70e87bf7d', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'82b06e80-103e-4a38-b171-740d2b0e194b', N'admin', N'2017-09-14 11:43:13.193');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'ac3c95a4-567e-4e52-90f6-40fa1046f930', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'c04bfd8f-7e2e-4312-9148-a2e14007fa46', N'admin', N'2017-09-14 11:43:13.410');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'ad17561c-4aea-4eb3-8933-23670a0ee8bd', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'026550fd-2578-42ae-a041-625cda12325f', N'admin', N'2017-03-28 16:47:59.833');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'b0fe6d22-f29b-4123-95d3-24a613e2e979', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'069f00f6-2a82-4bbe-90d6-418f37d5ef1f', N'admin', N'2017-04-04 21:10:58.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'b7428619-8582-4489-b5e7-a065c9b4bd85', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'admin', N'2017-09-14 11:43:13.077');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'bdfac344-f808-4a40-bf4a-d65ee8ddb901', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'85438f3b-0634-4b17-b778-aee3a5819669', N'admin', N'2017-09-14 11:43:13.047');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'c7206703-c03f-43f4-bb1d-b610191659d0', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'09157352-1252-4964-8fee-479759a95db8', N'admin', N'2017-09-14 11:43:13.163');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'c7409bf9-7a38-4a7d-8c29-d0b9c5583888', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'admin', N'2017-09-14 11:43:12.760');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'd072a5b7-1c51-44d7-a538-ddf5acf6025e', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'026550fd-2578-42ae-a041-625cda12325f', N'admin', N'2017-09-14 11:43:13.020');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'd870e70b-56ff-421e-8f47-90e26572f997', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'069f00f6-2a82-4bbe-90d6-418f37d5ef1f', N'admin', N'2017-09-14 11:43:13.473');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'dc6d7e33-daaa-4df5-9561-cc912f3a26f6', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'aeeb56d1-5f27-42df-9d34-97ac18078390', N'admin', N'2017-04-18 13:25:58.247');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'e5d6408b-c397-4895-bd00-ac5caffe3c4a', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'admin', N'2017-03-28 16:47:59.757');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'e7156c99-c2d5-423c-a397-8fa0480bb830', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'855f3590-b233-4224-aaff-47fb95c8353d', N'admin', N'2017-09-14 11:43:12.987');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'eb643daa-c630-4b64-ae18-3f989b19b1e5', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'admin', N'2017-09-14 11:43:12.820');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'f44cc7d8-4495-42bb-91a0-f56b539b6fc4', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'81d1cbf0-3cff-4cde-8128-7d0d844450de', N'admin', N'2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'f61cf5c1-4926-4d22-8c93-20f99330f210', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'admin', N'2017-09-14 11:43:12.693');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'fe8110d3-1578-41cd-8ec5-40777d8c399b', N'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'admin', N'2017-09-14 11:43:12.957');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES (N'3e7e6244-080b-49a6-9fb5-654af2e0fd33', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'855f3590-b233-4224-aaff-47fb95c8353d', N'admin', N'2017-04-14 17:28:14.800');


-- 用户基础表
CREATE TABLE Sys_User (
	Id varchar(50) NOT NULL,
	Account varchar(50) NULL ,
	RealName varchar(50) NULL ,
	NickName varchar(50) NULL ,
	Avatar varchar(200) NULL ,
	Gender CHAR(1) NULL ,
	Birthday datetime NULL ,
	MobilePhone varchar(20) NULL ,
	Email varchar(50) NULL ,
	Signature varchar(500) NULL ,
	Address varchar(500) NULL ,
	CompanyId varchar(50) NULL ,
	DepartmentId varchar(50) NULL ,
	IsEnabled CHAR(1) NULL ,
	SortCode int NULL ,
	DeleteMark CHAR(1) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime datetime NULL ,
	PRIMARY KEY (Id)
);



-- 添加注释
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'账户', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Account';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'真实姓名', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'RealName';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'昵称', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'NickName';EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'头像', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Avatar';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'性别', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Gender';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生日', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Birthday';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'MobilePhone';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮箱', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Email';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'签名', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Signature';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'Address';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'领导ID', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'CompanyId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织ID', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'DepartmentId';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否启用', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'IsEnabled';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'SortCode';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'DeleteMark';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'CreateUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'CreateTime';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改人', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'ModifyUser';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间', @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE', @level1name = N'Sys_User', @level2type = 'COLUMN', @level2name = N'ModifyTime';

-- 新增数据
INSERT INTO Sys_User (Id, Account, RealName, NickName, Avatar, Gender, Birthday, MobilePhone, Email, Signature, Address, CompanyId, DepartmentId, IsEnabled, SortCode, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES (N'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', N'admin', N'周某人', N'周某人', N'/Content/framework/images/avatar.png', N'1', N'1991-07-22 00:00:00.000', N'18862253202', N'656098987@qq.com', N'啦啦啦啦啦啦啦啦啦咯1', N'江苏苏州', null, N'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', N'1', N'1', N'0', N'admin', N'2017-03-22 10:58:43.107', N'admin', N'2017-09-13 11:59:35.807');

-- 用户登录账号表
CREATE TABLE Sys_UserLogOn (
	Id varchar(50) NOT NULL,
	UserId varchar(50) NULL ,
	Password varchar(50) NULL ,
	SecretKey varchar(50) NULL ,
	PrevVisitTime datetime NULL ,
	LastVisitTime datetime NULL ,
	ChangePwdTime datetime NULL ,
	LoginCount int NOT NULL DEFAULT ((0)) ,
	AllowMultiUserOnline CHAR(1) NULL ,
	IsOnLine CHAR(1) NULL ,
	Question varchar(100) NULL ,
	AnswerQuestion varchar(200) NULL ,
	CheckIPAddress CHAR(1) NULL ,
	Language varchar(50) NULL ,
	Theme varchar(50) NULL ,
	PRIMARY KEY (Id)
);

-- 新增数据
INSERT INTO Sys_UserLogOn (Id, UserId, Password, SecretKey, PrevVisitTime, LastVisitTime, ChangePwdTime, LoginCount, AllowMultiUserOnline, IsOnLine, Question, AnswerQuestion, CheckIPAddress, Language, Theme) VALUES (N'6bde15b3-88a9-4522-817e-3d5877130a05', N'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', N'620fbd6bcbd32cb90dcab73d37706c15', N'juhgtdjc', N'2018-04-04 11:26:20.237', N'2018-04-04 11:26:20.237', N'2017-09-14 13:34:09.783', N'1137', N'1', N'1', N'lovecoding?', N'no', N'1', null, null);

-- 用户角色关系表
CREATE TABLE Sys_UserRoleRelation (
	Id varchar(50) NOT NULL ,
	UserId varchar(50) NULL ,
	RoleId varchar(50) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime datetime NULL ,
	PRIMARY KEY (Id)
);

-- 新增数据
INSERT INTO Sys_UserRoleRelation (Id, UserId, RoleId, CreateUser, CreateTime) VALUES (N'45e0a953-fd82-42f4-afe5-cbbbd2a263b0', N'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'admin', N'2017-01-20 09:37:08.343');