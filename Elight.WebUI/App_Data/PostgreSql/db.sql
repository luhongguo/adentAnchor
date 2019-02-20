CREATE TABLE Sys_Item(
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
	CreateTime TIMESTAMP NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);


-- 初始数据
INSERT INTO Sys_Item(Id, EnCode, ParentId,Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'xueli', '8238c495-8376-4004-9a34-56d0dcbd11ea', '学历', '1', '3', null, '0', '1', null, null, null, 'admin', '2017-05-13 19:14:25.013');
INSERT INTO Sys_Item(Id, EnCode, ParentId,Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('7b247f60-4095-4ffe-96e0-1935a25852de', 'hunyin', '8238c495-8376-4004-9a34-56d0dcbd11ea', '婚姻', '1', '4', null, '0', '1', null, null, null, null, null);
INSERT INTO Sys_Item(Id, EnCode, ParentId,Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('8238c495-8376-4004-9a34-56d0dcbd11ea', 'all_items', '0', '数据字典', '0', '0', null, '0', '1', null, null, null, null, null);
INSERT INTO Sys_Item(Id, EnCode, ParentId,Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('9c51a17c-7afd-4986-bfc9-94f9dd818ecf', 'role_type','8238c495-8376-4004-9a34-56d0dcbd11ea', '角色类型', '1', '1', null, '0', '1', null, null, null, null, null);
INSERT INTO Sys_Item(Id, EnCode, ParentId,Name, Layer, SortCode, IsTree, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('d2f966ba-d541-4ac9-8837-b5303d5c3502', 'org_type', '8238c495-8376-4004-9a34-56d0dcbd11ea', '机构类型', '1', '2', null, '0', '1', null, null, null, null, null);



CREATE TABLE Sys_ItemsDetail (
	Id varchar(50) NOT NULL ,
	ItemId varchar(50) NULL ,
	EnCode varchar(50) NULL ,
	Name varchar(50) NULL ,
	IsDefault CHAR(1) NULL ,
	SortCode int NULL ,
	DeleteMark CHAR(1) NULL ,
	IsEnabled CHAR(1) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime TIMESTAMP NULL ,
	ModifyUser VARCHAR(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);


INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('14f0c64a-f3d8-439d-bc0a-d9a5a41a2d46', 'd2f966ba-d541-4ac9-8837-b5303d5c3502', 'org-team', '小组', '0', '4', '0', '1', null, null, 'admin', '2017-07-12 11:00:47.137');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('16c3d367-d63e-4426-9745-ed6824e8454d', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'shuoshi', '硕士', '0', '7', '0', '1', 'admin', '2017-04-29 16:49:54.183', 'admin', '2017-04-29 16:49:54.183');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('35004B3B-96FB-475D-B3E4-0DD8815D316C', '7b247f60-4095-4ffe-96e0-1935a25852de', 'weihun', '未婚', '0', '1', '0', '1', 'admin', '2017-09-11 15:32:42.320', 'admin', '2017-09-11 15:32:42.320');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('466142E6-8494-49B0-8E07-03F168D747FE', '7b247f60-4095-4ffe-96e0-1935a25852de', 'yihun', '已婚', '0', '2', '0', '1', 'admin', '2017-09-11 15:32:51.403', 'admin', '2017-09-11 15:32:51.403');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('557427ff-8bb7-4e8b-ba3d-91f31ab02b59', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'xiaoxue', '小学及以下', '0', '1', '0', '1', 'admin', '2017-04-29 16:44:34.410', 'admin', '2017-04-29 16:50:15.873');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('738aee95-3597-412e-9a0a-e7e3161c86cf', '9c51a17c-7afd-4986-bfc9-94f9dd818ecf', 'role-business', '业务角色', '1', '2', '0', '1', null, null, 'admin', '2017-06-03 17:38:50.330');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('7c51742f-fed3-48c4-8c5b-7f8b8c64cff0', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'benke', '本科', '1', '5', '0', '1', 'admin', '2017-04-29 16:46:24.133', 'admin', '2017-04-29 16:50:25.883');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('85d02da8-06f2-4fba-9dcf-7e3b971f9028', 'd2f966ba-d541-4ac9-8837-b5303d5c3502', 'org-company', '公司', '1', '1', '0', '1', null, null, 'admin', '2017-06-03 17:40:04.350');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('85e46a33-b065-4ba2-99da-c02947bfc5e6', 'd2f966ba-d541-4ac9-8837-b5303d5c3502', 'org-department', '部门', '0', '2', '0', '1', null, null, null, null);
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('ac53424f-adbb-4477-b534-b0bc72ea5f41', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'chuzhong', '初中', '0', '2', '0', '1', 'admin', '2017-04-29 16:44:56.470', 'admin', '2017-04-29 16:44:56.470');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('C52CBE29-CB92-465F-9697-2AAB7C214FFD', 'd2f966ba-d541-4ac9-8837-b5303d5c3502', 'org-child-dept', '子部门', '0', '3', '0', '1', 'admin', '2017-07-12 11:00:40.667', 'admin', '2017-07-12 11:00:40.667');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('cb579de4-b816-435f-aaa5-f666a6838ca5', '9c51a17c-7afd-4986-bfc9-94f9dd818ecf', 'role-system', '系统角色', '0', '1', '0', '1', null, null, null, null);
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('cf5d4197-678f-47b9-8f35-ffc23ba68cee', '9c51a17c-7afd-4986-bfc9-94f9dd818ecf', 'role-other', '其他角色', '0', '3', '0', '1', null, null, null, null);
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('d327c3ca-a557-4f95-8bbf-659fcf09782d', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'dazhuan', '大专', '0', '4', '0', '1', 'admin', '2017-04-29 16:45:27.437', 'admin', '2017-04-29 16:45:27.437');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('f500ed63-e91a-40a5-8e80-6b58895007d3', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'yanjiusheng', '研究生', '0', '6', '0', '1', 'admin', '2017-04-29 16:46:45.813', 'admin', '2017-04-29 16:46:45.813');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('f51b746e-476a-4e39-839f-abed4be676cf', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'gaozhong', '高中', '0', '3', '0', '1', 'admin', '2017-04-29 16:45:06.660', 'admin', '2017-04-29 16:45:06.660');
INSERT INTO Sys_ItemsDetail(Id, ItemId, EnCode, Name, IsDefault, SortCode, DeleteMark, IsEnabled, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('fff309f2-9baa-4283-84a8-74c97fcd83e2', '0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', 'boshi', '博士', '0', '8', '0', '1', 'admin', '2017-04-29 16:50:10.027', 'admin', '2017-09-11 15:32:23.733');



CREATE TABLE Sys_Log (
	Id varchar(50) NOT NULL ,
	CreateTime TIMESTAMP NULL ,
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



CREATE TABLE Sys_Organize (
	Id varchar(50) NOT NULL,
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
	CreateTime TIMESTAMP NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);


INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('25fa48f8-00d3-4b5d-bee9-b49324410906', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'market', '市场部', '1', null, null, null, null, null, null, '20', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:34.283');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('2a871804-5c78-481f-a167-7874b56a54d7', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'afterSale', '售后部', '1', null, null, null, null, null, null, '70', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:39.983');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('339a409a-a5a6-49b4-9071-86d7699a9ddd', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'administration', '行政人事部', '1', null, null, null, null, null, null, '40', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:43.333');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('5fc64d6e-d790-4f53-ab51-99c369860965', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'financial', '财务部', '1', null, null, null, null, null, null, '50', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:46.800');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('67ccf447-0f20-4cf8-9159-a5552cf7dc10', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'project', '项目部', '1', null, null, null, null, null, null, '80', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:50.257');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('771b628b-e43c-4592-b1ef-70ea23b0e3f2', '0', null, 'company', 'xx', '0', 'aa', null, null, null, 'aa@qq.com', null, '10', '0', '1', null, null, null, 'admin', '2018-04-04 11:42:33.857');
INSERT INTO Sys_Organize(Id, ParentId, Layer, EnCode, FullName, Type, ManagerId, TelePhone, WeChat, Fax, Email, Address, SortCode, DeleteMark, IsEnabled, Remark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('a93c66e2-b8dc-4d00-84ed-e6071b5f5318', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', null, 'product', '产品事业部', '1', null, null, null, null, null, null, '30', '0', '1', null, null, null, 'admin', '2018-04-04 11:44:11.957');


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
	IsPublic CHAR(1) NULL DEFAULT '0' ,
	IsEnable CHAR(1) NULL DEFAULT '1' ,
	IsEdit CHAR(1) NULL DEFAULT '1' ,
	DeleteMark CHAR(1) NULL DEFAULT '0' ,
	CreateUser varchar(50) NULL ,
	CreateTime TIMESTAMP NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);




INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('026550fd-2578-42ae-a041-625cda12325f', '855f3590-b233-4224-aaff-47fb95c8353d', '2', 'role-add', '新增角色', 'btn_add()', 'fa fa-plus-square-o', '/System/Role/Form', null, '1', '10301', '0', '1', '1', '0', 'admin', '2017-03-28 16:30:21.277', 'admin', '2017-03-28 16:30:21.277');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('069f00f6-2a82-4bbe-90d6-418f37d5ef1f', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2', 'item-detail', '查看选项', 'btn_detail()', 'fa fa-eye', '/System/ItemsDetail/Detail', null, '1', '10505', '0', '1', '1', '0', 'admin', '2017-04-04 20:16:02.347', 'admin', '2017-04-04 20:18:13.513');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('086ee328-5a15-40b0-8e15-291093e2e8b1', '09157352-1252-4964-8fee-479759a95db8', '2', 'org-edit', '修改机构', 'btn_edit()', 'fa fa-pencil-square-o', '/System/Organize/Form', null, '1', '10402', '0', '1', '1', '0', 'admin', '2017-04-02 09:38:32.333', 'admin', '2017-04-02 09:38:32.333');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('09157352-1252-4964-8fee-479759a95db8', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'sys-organize', '组织机构', null, 'fa fa-building', '/System/Organize/Index', null, '0', '10400', '0', '1', '1', '0', 'admin', '2017-04-02 09:31:00.937', 'admin', '2017-09-14 13:56:08.310');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', 'e5346fa2-76ec-498f-8f54-3b443959335a', '2', 'per-delete', '删除权限', 'btn_delete()', 'fa fa-trash-o', '/System/Permission/Delete', null, '1', '10203', '0', '1', '1', '0', 'admin', '2017-02-20 09:51:18.693', 'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('216d09a8-575f-43d1-85f6-acc025fa94b3', '6d90439c-eb6b-4521-ab4d-5e481406a861', '2', 'user-detail', '查看用户', 'btn_detail()', 'fa fa-eye', '/System/User/Detail', null, '1', '10104', '0', '1', '1', '0', 'admin', '2017-03-28 16:20:17.830', 'admin', '2017-03-28 16:20:17.830');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('233e50fd-4860-42f9-aa7a-93853ac0434b', '277c8647-ea81-42cf-8f7b-db353da95bbe', '1', 'data-backup', '数据备份', null, 'fa fa-list', '/System/Data/Index', null, '0', '20100', '0', '1', '1', '0', 'admin', null, 'admin', '2017-07-12 10:50:53.657');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('277c8647-ea81-42cf-8f7b-db353da95bbe', '0', '0', null, '系统安全', null, 'fa fa-desktop', null, null, '0', '20000', '0', '1', '1', '0', 'admin', null, 'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('28a045a6-61f4-4784-8578-837ad307e4e3', 'e5346fa2-76ec-498f-8f54-3b443959335a', '2', 'per-add', '新增权限', 'btn_add()', 'fa fa-plus-square-o', '/System/Permission/Form', null, '1', '10201', '0', '1', '1', '0', 'admin', '2017-02-13 14:28:21.813', 'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', 'e5346fa2-76ec-498f-8f54-3b443959335a', '2', 'per-detail', '查看权限', 'btn_detail()', 'fa fa-eye', '/System/Permission/Detail', null, '1', '10204', '0', '1', '1', '0', 'admin', '2017-03-28 16:22:05.590', 'admin', '2017-03-28 16:22:05.590');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('2d0b02db-09f7-4404-bbdd-c8a516f48288', '0', '0', null, '系统管理', null, 'fa fa-cubes', null, null, '0', '10000', '0', '1', '1', '0', 'admin', null, 'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('328b5383-79be-4b34-b57a-49fa3ebc7803', '855f3590-b233-4224-aaff-47fb95c8353d', '2', 'role-delete', '删除角色', 'btn_delete()', 'fa fa-trash-o', '/System/Role/Delete', null, '1', '10303', '0', '1', '1', '0', 'admin', '2017-03-28 16:32:43.533', 'admin', '2017-03-28 16:32:43.533');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'lay-item', '数据字典', null, 'fa fa-sitemap', '/System/ItemsDetail/Index', null, '0', '10500', '0', '1', '1', '0', 'admin', '2017-04-03 15:33:02.587', 'admin', '2017-04-03 15:33:02.587');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('3de13971-a51f-40f7-be40-eb035b7f0fae', '6d90439c-eb6b-4521-ab4d-5e481406a861', '2', 'user-edit', '修改用户', 'btn_edit()', 'fa fa-edit', '/System/User/Edit', null, '1', '10102', '0', '1', '1', '0', 'admin', '2017-04-14 17:21:43.573', 'admin', '2017-06-05 10:48:07.950');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('5fe0cee6-0452-493d-9b55-ff23a5da5e2d', 'e5346fa2-76ec-498f-8f54-3b443959335a', '2', 'per-edit', '修改权限', 'btn_edit()', 'fa fa-pencil-square-o', '/System/Permission/Form', null, '1', '10202', '0', '1', '1', '0', 'admin', '2017-02-20 09:47:19.040', 'admin', null);
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('625cf550-4aad-4158-aff4-2a63d4f25819', '855f3590-b233-4224-aaff-47fb95c8353d', '2', 'role-detail', '查看角色', 'btn_detail()', 'fa fa-eye', '/System/Role/Detail', null, '1', '10304', '0', '1', '1', '0', 'admin', '2017-03-28 16:34:05.080', 'admin', '2017-03-28 16:34:05.080');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('6d90439c-eb6b-4521-ab4d-5e481406a861', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'sys-user', '系统用户', null, 'fa fa-user-circle', '/System/User/Index', null, '0', '10100', '0', '1', '1', '0', 'admin', null, 'admin', '2017-09-14 13:51:29.077');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('752c9d3f-a744-42ba-87a2-79849fc3fc66', '6d90439c-eb6b-4521-ab4d-5e481406a861', '2', 'user-delete', '删除用户', 'btn_delete()', 'fa fa-trash-o', '/System/User/Delete', null, '1', '10103', '0', '1', '1', '0', 'admin', '2017-03-28 16:18:25.347', 'admin', '2017-03-28 16:18:25.347');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('7ae2e6aa-0433-4eaa-9357-1adec2507345', 'aeeb56d1-5f27-42df-9d34-97ac18078390', '2', 'log-delete', '删除日志', 'btn_delete()', 'fa fa-trash-o', '/System/Log/Delete', null, '1', '10601', '0', '1', '0', '0', 'admin', '2017-04-19 13:21:33.503', 'admin', '2017-04-19 13:22:35.420');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('81d1cbf0-3cff-4cde-8128-7d0d844450de', '855f3590-b233-4224-aaff-47fb95c8353d', '2', 'role-authorize', '角色授权', 'btn_authorize()', 'fa fa-hand-pointer-o', '/System/RoleAuthorize/Index', null, '1', '10305', '0', '1', '1', '0', 'admin', '2017-03-28 16:36:42.613', 'admin', '2017-03-28 16:36:42.613');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('82b06e80-103e-4a38-b171-740d2b0e194b', '09157352-1252-4964-8fee-479759a95db8', '2', 'org-add', '新增机构', 'btn_add()', 'fa fa-plus-square-o', '/System/Organize/Form', null, '1', '10401', '0', '1', '1', '0', 'admin', '2017-04-02 09:37:47.900', 'admin', '2017-04-02 09:37:47.900');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('85438f3b-0634-4b17-b778-aee3a5819669', '855f3590-b233-4224-aaff-47fb95c8353d', '2', 'role-edit', '修改角色', 'btn_edit()', 'fa fa-pencil-square-o', '/System/Role/Form', null, '1', '10302', '0', '1', '1', '0', 'admin', '2017-03-28 16:31:10.750', 'admin', '2017-03-28 16:31:10.750');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('855f3590-b233-4224-aaff-47fb95c8353d', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'sys-role', '角色管理', null, 'fa fa-users', '/System/Role/Index', null, '0', '10300', '0', '1', '1', '0', 'admin', '2017-03-28 16:27:50.183', 'admin', '2017-09-14 13:52:18.270');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('87f0aa68-fa57-43cb-84d0-e979fc4af24c', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2', 'item-delete', '删除选项', 'btn_delete()', 'fa fa-trash-o', '/System/ItemsDetail/Delete', null, '1', '10504', '0', '1', '1', '0', 'admin', '2017-04-04 20:06:34.753', 'admin', '2017-04-04 20:17:29.043');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('aeeb56d1-5f27-42df-9d34-97ac18078390', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'sys-log', '操作日志', null, 'fa fa-folder-open', '/System/Log/Index', null, '0', '10600', '0', '1', '0', '0', 'admin', '2017-04-18 13:25:49.407', 'admin', '2017-04-19 13:22:14.603');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('c04bfd8f-7e2e-4312-9148-a2e14007fa46', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2', 'item-edit', '修改选项', 'btn_edit()', 'fa fa-pencil-square-o', '/System/ItemsDetail/Form', null, '0', '10503', '0', '1', '1', '0', 'admin', '2017-04-04 20:05:36.310', 'admin', '2017-04-04 20:05:36.310');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', '09157352-1252-4964-8fee-479759a95db8', '2', 'org-detail', '查看机构', 'btn_detail()', 'fa fa-eye', '/System/Organize/Detail', null, '1', '10404', '0', '1', '1', '0', 'admin', '2017-04-02 09:47:18.190', 'admin', '2017-04-02 09:47:18.190');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('d9cfc79d-55f6-4890-b604-49f1d2a0d971', '6d90439c-eb6b-4521-ab4d-5e481406a861', '2', 'user-add', '新增用户', 'btn_add()', 'fa fa-plus-square-o', '/System/User/Form', null, '1', '10101', '0', '1', '1', '0', 'admin', '2017-03-28 16:14:58.087', 'admin', '2017-03-28 16:14:58.087');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('e32b7507-aaf0-42dc-8008-139250c352ee', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2', 'item-manage', '字典管理', 'btn_manage()', 'fa fa-folder-open-o', '/System/Item/Index', null, '1', '10501', '0', '1', '1', '0', 'admin', '2017-04-03 21:30:55.433', 'admin', '2017-04-04 10:48:52.763');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('e5346fa2-76ec-498f-8f54-3b443959335a', '2d0b02db-09f7-4404-bbdd-c8a516f48288', '1', 'sys-permission', '权限管理', null, 'fa fa-suitcase', '/System/Permission/Index', null, '0', '10200', '0', '1', '1', '0', 'admin', null, 'admin', '2017-03-28 16:58:50.730');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('e9478f45-0c00-435f-9a7a-35c7af1f86f7', '09157352-1252-4964-8fee-479759a95db8', '2', 'org-delete', '删除机构', 'btn_delete()', 'fa fa-trash-o', '/System/Organize/Delete', null, '1', '10403', '0', '1', '1', '0', 'admin', '2017-04-02 09:45:55.757', 'admin', '2017-04-02 09:45:55.757');
INSERT INTO Sys_Permission (Id, ParentId, Layer, EnCode, Name, JsEvent, Icon, Url, Remark, Type, SortCode, IsPublic, IsEnable, IsEdit, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('fbee5749-8694-495f-b140-b5b3399df7ee', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', '2', 'item-add', '新增选项', 'btn_add()', 'fa fa-plus-square-o', '/System/ItemsDetail/Form', null, '1', '10502', '0', '1', '1', '0', 'admin', '2017-04-04 19:46:18.233', 'admin', '2017-04-04 19:46:50.650');



CREATE TABLE Sys_Role(
	Id varchar(50) NOT NULL ,
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
	CreateTime TIMESTAMP NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);




INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('55440eec-5622-491b-9ade-879dae179c23', '67ccf447-0f20-4cf8-9159-a5552cf7dc10', 'implement', '1', '实施人员', '1', '0', '0', null, '5', 'admin', null, 'admin', '2017-06-05 17:33:13.370');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', 'developer', '0', '系统开发人员', '0', '0', '1', null, '3', 'admin', null, null, null);
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('97223b06-6b7a-47fb-b74c-173f52c519c4', '339a409a-a5a6-49b4-9071-86d7699a9ddd', 'fileattache', '1', '档案专员', '1', '0', '1', null, '7', 'admin', '2017-03-13 16:08:55.867', 'admin', '2017-03-13 16:08:55.867');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', 'administrators', '0', '超级管理员', '1', '0', '1', null, '1', 'admin', null, 'admin', '2018-04-04 11:44:58.327');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '2a871804-5c78-481f-a167-7874b56a54d7', 'test', '0', '测试', '0', '0', '1', 'asd', '8', 'admin', '2017-09-14 11:40:59.257', 'admin', '2017-09-14 11:42:34.013');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('db60dc76-9632-44b3-ae4b-7177428bad35', '771b628b-e43c-4592-b1ef-70ea23b0e3f2', 'configuration', '0', '系统配置员', '0', '0', '1', null, '2', 'admin', null, 'admin', '2018-04-04 11:45:31.897');
INSERT INTO Sys_Role (Id, OrganizeId, EnCode, Type, Name, AllowEdit, DeleteMark, IsEnabled, Remark, SortCode, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('ed66f99c-d1bd-4fe3-948a-6520a5d6b7d9', '339a409a-a5a6-49b4-9071-86d7699a9ddd', 'person', '1', '人事专员', '0', '0', '1', null, '6', 'admin', null, null, null);

CREATE TABLE Sys_RoleAuthorize (
	Id varchar(50) NOT NULL,
	RoleId varchar(50) NULL ,
	ModuleId varchar(50) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);



INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('018c7b35-d79b-4b48-9fa5-dd44375875c4', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '87f0aa68-fa57-43cb-84d0-e979fc4af24c', 'admin', '2017-04-04 21:10:58.337');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('04a8f35b-e43b-4f06-aa08-2bfc272fe2a1', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '85438f3b-0634-4b17-b778-aee3a5819669', 'admin', '2017-03-28 16:47:59.850');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('083f6bd4-c086-486c-b25a-1f2e8a3a9563', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '216d09a8-575f-43d1-85f6-acc025fa94b3', 'admin', '2017-03-28 16:47:59.803');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('09ac4a11-2d50-48e6-b1ae-d9c18384fa5c', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '6d90439c-eb6b-4521-ab4d-5e481406a861', 'admin', '2017-03-28 16:47:59.727');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('09d88a4f-ef46-4ca0-a95a-a1ce15aa91c0', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '82b06e80-103e-4a38-b171-740d2b0e194b', 'admin', '2017-04-02 09:48:32.997');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('164ad154-21e5-48ab-8e27-1c0ea38d066d', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'e9478f45-0c00-435f-9a7a-35c7af1f86f7', 'admin', '2017-04-02 09:48:33.027');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('165a4b08-4c60-4faf-92ea-3e143aa1e7c4', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 'admin', '2017-09-14 11:43:13.307');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('1adef545-559b-4cc3-b3c0-1debdce21f73', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'c04bfd8f-7e2e-4312-9148-a2e14007fa46', 'admin', '2017-04-04 21:10:58.320');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('1f5af2cf-3d4a-4af6-b4e2-4c3dd76627ea', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '09157352-1252-4964-8fee-479759a95db8', 'admin', '2017-04-02 09:48:32.977');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('23bbb1ff-9d3a-408a-a9fa-c203ef26c66a', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'fbee5749-8694-495f-b140-b5b3399df7ee', 'admin', '2017-04-04 21:10:58.293');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('263bc5c4-5d5c-4592-a115-0f2034553e90', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'e9478f45-0c00-435f-9a7a-35c7af1f86f7', 'admin', '2017-09-14 11:43:13.253');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('2ba622d6-60e9-4918-a3cf-f634b969bc98', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '7ae2e6aa-0433-4eaa-9357-1adec2507345', 'admin', '2017-04-19 13:22:54.643');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('3b2baa1c-2fda-4620-a3c7-58fd45d87b0a', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '2d0b02db-09f7-4404-bbdd-c8a516f48288', 'admin', '2017-09-14 11:43:12.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('3b4052c3-e846-4cc1-bced-e818342d3e0b', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'e32b7507-aaf0-42dc-8008-139250c352ee', 'admin', '2017-09-14 11:43:13.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('3bd543bc-3e10-4bf8-96b3-c888987c636e', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 'admin', '2017-04-03 15:34:35.697');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('3f5cf11a-4b6a-4e2f-94e5-dcc390374f75', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '086ee328-5a15-40b0-8e15-291093e2e8b1', 'admin', '2017-04-02 09:48:33.013');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('41b4ffda-cd44-4bad-90d0-0ebec361c35e', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '233e50fd-4860-42f9-aa7a-93853ac0434b', 'admin', '2017-03-15 13:40:27.933');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('45e1cd76-8c78-4158-a689-87c8d24ba024', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '752c9d3f-a744-42ba-87a2-79849fc3fc66', 'admin', '2017-03-28 16:47:59.787');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('4d24fcca-e1ae-4816-879f-34aa96b93dc2', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '5fe0cee6-0452-493d-9b55-ff23a5da5e2d', 'admin', '2017-09-14 11:43:12.897');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('4f5bd239-c484-4518-85c3-2c8f65aebe52', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', 'admin', '2017-04-02 09:48:33.043');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('608619a2-fc79-4179-992d-11aef520f8de', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '87f0aa68-fa57-43cb-84d0-e979fc4af24c', 'admin', '2017-09-14 11:43:13.440');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('648c6f72-2e50-41b7-88ea-6a57efc29102', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '28a045a6-61f4-4784-8578-837ad307e4e3', 'admin', '2017-09-14 11:43:12.870');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('68e36f44-9a77-4377-bb71-9af61adc7b11', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', 'admin', '2017-03-28 16:47:59.817');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('6a8d7415-d228-4316-abdc-6465dd8baf60', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '3de13971-a51f-40f7-be40-eb035b7f0fae', 'admin', '2017-04-14 17:28:14.800');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('6bd7028f-00d1-4fd9-89d9-6ddc7ce822ce', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '2d0b02db-09f7-4404-bbdd-c8a516f48288', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('7224563a-50af-42df-a66b-30e8d41e08fe', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', 'admin', '2017-09-14 11:43:13.277');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('7375dea3-ee3d-40cb-8390-9c1cb9baf6a0', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'd9cfc79d-55f6-4890-b604-49f1d2a0d971', 'admin', '2017-09-14 11:43:12.730');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('74604022-d5f2-4855-b07a-f7e1235e2ef6', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'e32b7507-aaf0-42dc-8008-139250c352ee', 'admin', '2017-04-03 21:31:55.373');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('765de5b7-be99-494e-a173-1dd2238ad1f1', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '086ee328-5a15-40b0-8e15-291093e2e8b1', 'admin', '2017-09-14 11:43:13.223');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('76e9aef6-8030-4588-9a63-551a4a0b376e', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('78919e4f-e65d-461a-9af6-f8b5e13232e0', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '28a045a6-61f4-4784-8578-837ad307e4e3', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('7b3577cf-11d2-46a0-a859-9b17a07328c7', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '328b5383-79be-4b34-b57a-49fa3ebc7803', 'admin', '2017-03-28 16:47:59.863');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('7fdd045d-9de9-466d-a332-7c65028d9b4b', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'fbee5749-8694-495f-b140-b5b3399df7ee', 'admin', '2017-09-14 11:43:13.380');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('80b5d2c9-74b3-42d2-897d-70fffa050fa8', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '277c8647-ea81-42cf-8f7b-db353da95bbe', 'admin', '2017-03-15 13:40:27.910');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('810dddfa-870b-482f-a419-6326eea29c84', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '625cf550-4aad-4158-aff4-2a63d4f25819', 'admin', '2017-03-28 16:47:59.880');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('83c14f08-2046-4ea4-b01c-a7420a264b2b', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'e5346fa2-76ec-498f-8f54-3b443959335a', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('8cb47a49-27fe-47c9-818f-0aad37cff810', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '752c9d3f-a744-42ba-87a2-79849fc3fc66', 'admin', '2017-09-14 11:43:12.790');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('98615c60-0066-4f13-9253-70e56b3ec34c', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'e5346fa2-76ec-498f-8f54-3b443959335a', 'admin', '2017-09-14 11:43:12.847');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('98885c60-d3bc-49df-8eaa-f8ccb7eafaa3', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '5fe0cee6-0452-493d-9b55-ff23a5da5e2d', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('99980d3a-ad3b-4c20-9cdd-9f809225badd', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', 'admin', '2017-09-14 11:43:12.923');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('9b64ef96-d367-4732-a434-cf76640cab05', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '625cf550-4aad-4158-aff4-2a63d4f25819', 'admin', '2017-09-14 11:43:13.107');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('a0b99832-8425-45ba-b483-248a3cb76a55', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '81d1cbf0-3cff-4cde-8128-7d0d844450de', 'admin', '2017-09-14 11:43:13.133');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('aab11f11-4f6e-4d16-9fae-f1b70e87bf7d', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '82b06e80-103e-4a38-b171-740d2b0e194b', 'admin', '2017-09-14 11:43:13.193');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('ac3c95a4-567e-4e52-90f6-40fa1046f930', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', 'c04bfd8f-7e2e-4312-9148-a2e14007fa46', 'admin', '2017-09-14 11:43:13.410');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('ad17561c-4aea-4eb3-8933-23670a0ee8bd', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '026550fd-2578-42ae-a041-625cda12325f', 'admin', '2017-03-28 16:47:59.833');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('b0fe6d22-f29b-4123-95d3-24a613e2e979', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '069f00f6-2a82-4bbe-90d6-418f37d5ef1f', 'admin', '2017-04-04 21:10:58.350');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('b7428619-8582-4489-b5e7-a065c9b4bd85', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '328b5383-79be-4b34-b57a-49fa3ebc7803', 'admin', '2017-09-14 11:43:13.077');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('bdfac344-f808-4a40-bf4a-d65ee8ddb901', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '85438f3b-0634-4b17-b778-aee3a5819669', 'admin', '2017-09-14 11:43:13.047');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('c7206703-c03f-43f4-bb1d-b610191659d0', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '09157352-1252-4964-8fee-479759a95db8', 'admin', '2017-09-14 11:43:13.163');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('c7409bf9-7a38-4a7d-8c29-d0b9c5583888', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '3de13971-a51f-40f7-be40-eb035b7f0fae', 'admin', '2017-09-14 11:43:12.760');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('d072a5b7-1c51-44d7-a538-ddf5acf6025e', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '026550fd-2578-42ae-a041-625cda12325f', 'admin', '2017-09-14 11:43:13.020');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('d870e70b-56ff-421e-8f47-90e26572f997', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '069f00f6-2a82-4bbe-90d6-418f37d5ef1f', 'admin', '2017-09-14 11:43:13.473');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('dc6d7e33-daaa-4df5-9561-cc912f3a26f6', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'aeeb56d1-5f27-42df-9d34-97ac18078390', 'admin', '2017-04-18 13:25:58.247');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('e5d6408b-c397-4895-bd00-ac5caffe3c4a', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'd9cfc79d-55f6-4890-b604-49f1d2a0d971', 'admin', '2017-03-28 16:47:59.757');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('e7156c99-c2d5-423c-a397-8fa0480bb830', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '855f3590-b233-4224-aaff-47fb95c8353d', 'admin', '2017-09-14 11:43:12.987');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('eb643daa-c630-4b64-ae18-3f989b19b1e5', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '216d09a8-575f-43d1-85f6-acc025fa94b3', 'admin', '2017-09-14 11:43:12.820');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('f44cc7d8-4495-42bb-91a0-f56b539b6fc4', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '81d1cbf0-3cff-4cde-8128-7d0d844450de', null, null)						   ;
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('f61cf5c1-4926-4d22-8c93-20f99330f210', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '6d90439c-eb6b-4521-ab4d-5e481406a861', 'admin', '2017-09-14 11:43:12.693');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('fe8110d3-1578-41cd-8ec5-40777d8c399b', 'a43d2b95-8ec0-44a2-b5ec-16c2e3390310', '2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', 'admin', '2017-09-14 11:43:12.957');
INSERT INTO Sys_RoleAuthorize (Id, RoleId, ModuleId, CreateUser, CreateTime) VALUES ('NULL3e7e6244-080b-49a6-9fb5-654af2e0fd33', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', '855f3590-b233-4224-aaff-47fb95c8353d', null, null)					   ;


CREATE TABLE Sys_User(
	Id varchar(50) NOT NULL,
	Account varchar(50) NULL ,
	RealName varchar(50) NULL ,
	NickName varchar(50) NULL ,
	Avatar varchar(200) NULL ,
	Gender CHAR(1) NULL ,
	Birthday TIMESTAMP NULL ,
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
	CreateTime TIMESTAMP NULL ,
	ModifyUser varchar(50) NULL ,
	ModifyTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);



INSERT INTO Sys_User (Id, Account, RealName, NickName, Avatar, Gender, Birthday, MobilePhone, Email, Signature, Address, CompanyId, DepartmentId, IsEnabled, SortCode, DeleteMark, CreateUser, CreateTime, ModifyUser, ModifyTime) VALUES ('d1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', 'admin', '周某人', '周某人', '/Content/framework/images/avatar.png', '1', '1991-07-22 00:00:00.000', '18862253202', '656098987@qq.com', '啦啦啦啦啦啦啦啦啦咯1', '江苏苏州', null, 'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', '1', '1', '0', 'admin', '2017-03-22 10:58:43.107', 'admin', '2017-09-13 11:59:35.807');


CREATE TABLE Sys_UserLogOn (
	Id varchar(50) NOT NULL ,
	UserId varchar(50) NULL ,
	Password varchar(50) NULL ,
	SecretKey varchar(50) NULL ,
	PrevVisitTime TIMESTAMP NULL ,
	LastVisitTime TIMESTAMP NULL ,
	ChangePwdTime TIMESTAMP NULL ,
	LoginCount int NOT NULL DEFAULT 0 ,
	AllowMultiUserOnline CHAR(1) NULL ,
	IsOnLine CHAR(1) NULL ,
	Question varchar(100) NULL ,
	AnswerQuestion varchar(200) NULL ,
	CheckIPAddress CHAR(1) NULL ,
	Language varchar(50) NULL ,
	Theme varchar(50) NULL ,
	PRIMARY KEY (Id)
);


INSERT INTO Sys_UserLogOn (Id, UserId, Password, SecretKey, PrevVisitTime, LastVisitTime, ChangePwdTime, LoginCount, AllowMultiUserOnline, IsOnLine, Question, AnswerQuestion, CheckIPAddress, Language, Theme) VALUES ('6bde15b3-88a9-4522-817e-3d5877130a05', 'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', '620fbd6bcbd32cb90dcab73d37706c15', 'juhgtdjc', '2018-04-04 11:26:20.237', '2018-04-04 11:26:20.237', '2017-09-14 13:34:09.783', '1137', '1', '1', 'lovecoding?', 'no', '1', null, null);




CREATE TABLE Sys_UserRoleRelation (
	Id varchar(50) NOT NULL ,
	UserId varchar(50) NULL ,
	RoleId varchar(50) NULL ,
	CreateUser varchar(50) NULL ,
	CreateTime TIMESTAMP NULL ,
	PRIMARY KEY (Id)
);


INSERT INTO Sys_UserRoleRelation (Id, UserId, RoleId, CreateUser, CreateTime) VALUES ('45e0a953-fd82-42f4-afe5-cbbbd2a263b0', 'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', 'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', 'admin', '2017-01-20 09:37:08.343');
