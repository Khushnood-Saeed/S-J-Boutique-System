go 
Use master
go
DROP DATABASE IF EXISTS BoutiqueSystem
go
create Database BoutiqueSystem
go
use BoutiqueSystem
go


-- DBCC CHECKIDENT('Table Name', RESEED, starting value)  -- command to reseed Auto increment key in

create table [User]
(Id int Identity(1,1) primary key,
[Name] nvarchar(30) NOT NULL,
[Address] nvarchar(100) NOT NULL,
Age int NOT NULL check (Age>0 and Age <100),
Email nvarchar(50) NOT NULL,
CreatedAt datetime NOT NULL,
Contact nvarchar(30) NOT NULL,
[Password] Binary(64) NOT NULL
)

go
create table [Role]
(Id int Identity(1,1) primary key,
[Name] nvarchar(30)  NOT NULL,
[Description] nvarchar(100)  NOT NULL
)

go
create table Permission
(Id int Identity(1,1) primary key,
[Name] nvarchar(30)  NOT NULL,
[Description] nvarchar(100)  NOT NULL
)

go
create table Role_Permission
(Id int Identity(1,1) primary key,
Role_Id int FOREIGN KEY REFERENCES [Role](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Permission_Id int FOREIGN KEY REFERENCES Permission(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)

go
create table WorkShift
(Id int Identity(1,1) primary key,
[Name] nvarchar(30) NOT NULL,
Time_in time  NOT NULL,
Time_out time  NOT NULL
)


go
create table Card_Category
(Id int Identity(1,1) primary key,
[Name] nvarchar(30)CHECK ([name]='Gold' OR [name]='Silver' OR[name]='Platinum') NOT NULL,
[Value] float NOT Null CHECK ([value]>0 and [value] <=10)
)


go
create table User_Role
(Id int Identity(1,1) primary key,
U_ID int FOREIGN KEY REFERENCES [User](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Role_Id int FOREIGN KEY REFERENCES [Role](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Workshift_Id int FOREIGN KEY REFERENCES WorkShift(ID) ON DELETE CASCADE ON UPDATE CASCADE,
Loyalty_pts int DEFAULT 0,
Card_cateogry_Id int  FOREIGN KEY REFERENCES Card_Category (Id) ON DELETE CASCADE ON UPDATE CASCADE
)


go
create table Attendance
(Id int Identity(1,1) primary key,
SalesAgent_Id int FOREIGN KEY REFERENCES [User](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
[Date] date  default GetDate() NOT NULL,
Time_in nvarchar(30) NOT NULL,
Time_out nvarchar(30) NOT NULL
)

go
create table Product
(Id int Identity(1,1) primary key,
[Name] nvarchar(30) NOT NULL,
Price float NOT NULL,
Quantity int NOT NULL CHECK(quantity >0 and quantity < 1000),
[Description] nvarchar(100)
)

go
create table [Order]
(Id int Identity(1,1) primary key,
Customer_Id int FOREIGN KEY REFERENCES User_Role(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
SalesAgent_Id int FOREIGN KEY REFERENCES User_Role(Id) NOT NULL,
[Date] date default GetDate() NOT NULL, -- for Sales Agent Report Generation
Payment_Type nvarchar(20) NOT NULL CHECK (Payment_Type='Credit Card' OR Payment_Type='Cash'),
Status_ nvarchar(30) NOT NULL CHECK (Status_='Pending' OR Status_='Cleared'),
Card_no varchar(10)
)

go
create table Order_Detail
(Id int Identity(1,1) primary key,
Order_Id int FOREIGN KEY REFERENCES [Order](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Product_Id int FOREIGN KEY REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
)

go
create table Outlet
(Id int Identity(1,1) primary key,
[Name] nvarchar(30) NOT NULL,
[Location] nvarchar(100),
Outlet_Type nvarchar(20) NOT NULL CHECK (Outlet_Type='POS' OR Outlet_Type='Online'),
[Status] nvarchar(30) NOT NULL CHECK ([status]='Blocked' OR [status]='Active')
)

go
create table Outlet_Inventory
(Id int Identity(1,1) primary key,
Order_Id int FOREIGN KEY REFERENCES [order](Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Product_Id int FOREIGN KEY REFERENCES product(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Inventory_Count int not null default 0
)

go
create table PurchaseLines
(Id int Identity(1,1) primary key,
Supplier_Id int FOREIGN KEY REFERENCES [User](ID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
[Date] date default GetDate() NOT NULL
)

go
create table Purchase_Detail
(Id int Identity(1,1) primary key,
Purchase_Id int FOREIGN KEY REFERENCES PurchaseLines(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Product_Id int FOREIGN KEY REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
Price float NOT NULL,
Quantity int NOT NULL
)

go
create table [Policy]
(Id int Identity(1,1) primary key,
Policy_Type nvarchar(30) NOT NULL CHECK (Policy_Type='Inventory' OR Policy_Type='Discount'),
[Description] nvarchar(100) NOT NULL
)
/*select * from [User]
select * from [Role]
select * from Permission
select * from Role_Permission
select * from WorkShift
select * from User_Role
select * from Attendance
select * from Product
select * from [Order]
select * from Order_Detail
select * from Outlet
select * from Outlet_Inventory
select * from PurchaseLines
select * from Purchase_Detail
select * from [Policy]
select * from Card_Category */


--Delete Data from All Tables

/*delete  from [User]
delete  from [Role]
delete  from Permission
delete  from Role_Permission
delete  from WorkShift
delete  from User_Role
delete  from Attendance
delete  from Product
delete  from [Order]
delete  from Order_Detail
delete  from Outlet
delete  from Outlet_Inventory
delete  from PurchaseLines
delete  from Purchase_Detail
delete  from [Policy]
delete  from Card_Category*/

-- Reseeding All Auto increment keys

/*DBCC CHECKIDENT('User', RESEED, 0)
DBCC CHECKIDENT('Role', RESEED, 0)
DBCC CHECKIDENT('Permission', RESEED, 0)
DBCC CHECKIDENT('Role_Permission', RESEED, 0)
DBCC CHECKIDENT('WorkShift', RESEED, 0)
DBCC CHECKIDENT('User_Role', RESEED, 0)
DBCC CHECKIDENT('Attendance', RESEED, 0)
DBCC CHECKIDENT('Product', RESEED, 0)
DBCC CHECKIDENT('Order', RESEED, 0)
DBCC CHECKIDENT('Order_Detail', RESEED, 0)
DBCC CHECKIDENT('Outlet', RESEED, 0)
DBCC CHECKIDENT('Outlet_Inventory', RESEED, 0)
DBCC CHECKIDENT('PurchaseLines', RESEED, 0)
DBCC CHECKIDENT('Purchase_Detail', RESEED, 0)
DBCC CHECKIDENT('Policy', RESEED, 0)
DBCC CHECKIDENT('Outlet_Inventory', RESEED, 0)
DBCC CHECKIDENT('Card_Category', RESEED, 0)*/

-- Sample Data Inserted
INSERT INTO Card_Category values ('Silver', 2.5)
INSERT INTO Card_Category values ('Gold', 5)
INSERT INTO Card_Category values ('Platinum', 10)

INSERT INTO [Role] values ('Customer', 'A person visiting online or POS store')
INSERT INTO [Role] values ('Sales Agent', 'A company employee working at an outlet')
INSERT INTO [Role] values ('Floor Manager', 'A company employee in charge of an outlet floor')
INSERT INTO [Role] values ('Inventory Manager', 'A company employee managing inventory and policies')
INSERT INTO [Role] values ('Store Manager', 'A company employee monitoring duties of an outlet')
INSERT INTO [Role] values ('Admin', 'A company head in charge of all outlets, employees and customers')
INSERT INTO [Role] values ('Supplier', 'Person in charge of supplying products to the inventory')

INSERT INTO Permission values ('Order', 'Place/cancel order and buy/return products')
INSERT INTO Permission values ('Mark Attendance', 'Mark attendance at a particular date')
INSERT INTO Permission values ('Track Attendance', 'Track attendance of sales agents for an outlet')
INSERT INTO Permission values ('Manage WorkShift', 'Define or change workshifts of sales agents for an outlet')
INSERT INTO Permission values ('Manage SalesAgents', 'Manage and view sales agents for an outlet')
INSERT INTO Permission values ('Manage Inventory', 'Manage global inventory and allocate inventory for outlets')
INSERT INTO Permission values ('Inventory Policy', 'Define or change inventory policy')
INSERT INTO Permission values ('Discount Policy', 'Define or change discount policy')
INSERT INTO Permission values ('View Reports', 'Run monthly and annual reports of products')
INSERT INTO Permission values ('Manage User', 'Add/remove user and assign roles')
INSERT INTO Permission values ('Manage Outlets', 'Block or delete outlets')
INSERT INTO Permission values ('Track Performance', 'Track Performance Reports of Staff Members')
--select * from Permission

INSERT INTO Role_Permission values (1, 1)
INSERT INTO Role_Permission values (2, 2)
INSERT INTO Role_Permission values (3, 2)
INSERT INTO Role_Permission values (3, 3)
INSERT INTO Role_Permission values (3, 4)
INSERT INTO Role_Permission values (3, 5)
INSERT INTO Role_Permission values (4, 6)
INSERT INTO Role_Permission values (4, 7)
INSERT INTO Role_Permission values (5, 8)
INSERT INTO Role_Permission values (5, 9)
INSERT INTO Role_Permission values (6, 10)
INSERT INTO Role_Permission values (6, 11)
--select * from Role_Permission

Insert into Product values ('Shirt',449,50, 'A plain polo T-Shirt available in all sizes for men')
Insert into Product values ('Bags',899,10, 'Snake skin bag made from top quality imported material')
Insert into Product values ('Jackets',1199,25, 'Blue denim jacket part of S&M unisex clothing line')
Insert into Product values ('Hoodies',799,25, 'Loose fitting hooded sweater part of S&M unisex clothing line')
Insert into Product values ('Pants',599,50, 'Courdroy pants perfect for casual and semi-formal dressing')
Insert into Product values ('Shoes',1899,40, 'Perfectly all rounded hiking boots made for the roughest of terrains')
Insert into Product values ('Suits',8999,10, 'Eye catching 3-piece and 2-piece suits custom fitted to your needs')
Insert into Product values ('Sandals',499,50, 'Comfortable and casual wear sandals ideal for daily use')
Insert into Product values ('CottonShirt',1099,30, 'Semi-formal shirt made from soft and breathable cotton')

delete from WorkShift
insert into WorkShift values ('Evening', DATEADD(hour, 0, GetDate()),DATEADD(hour, 2, GetDate()))
insert into WorkShift values ('Evening', DATEADD(hour, 3, GetDate()),DATEADD(hour, 5, GetDate()))
insert into WorkShift values ('Evening', DATEADD(hour, 5, GetDate()),DATEADD(hour, 7, GetDate()))
insert into WorkShift values ('Evening', DATEADD(hour, 7, GetDate()),DATEADD(hour, 9, GetDate()))
select * from WorkShift

-- select * from Product
--DBCC CHECKIDENT('User', RESEED, 0)

--delete from [User]
select * from [User_Role]
go
insert into [User] values ('M.Abdullah','Block123',21,'admin@gmail.com',GetDate(),'03214561111',Hashbytes('SHA2_512',N'pass123')) -- Admin
insert into [User] values ('Kashan Aqeel','Block123',21,'im@gmail.com',GetDate(),'03214561111',Hashbytes('SHA2_512',N'pass123')); -- Inventory Manager
insert into [User] values ('Muneeb Arshad','Block123',21,'fm@gmail.com',GetDate(),'03214561111',Hashbytes('SHA2_512',N'pass123')); -- Floor Manager
insert into [User] values ('Khushnood Saeed','Block123',21,'cust@gmail.com',GetDate(),'03214561111',Hashbytes('SHA2_512',N'pass123')); --Customer
go

select * from [User]
select * from [Role]
--select * from User_Role
go
insert into User_Role values (1,6,NULL,0,NULL)
insert into User_Role values (2,4,NULL,0,NULL)
insert into User_Role values (3,3,NULL,0,NULL)
insert into User_Role values (4,1,NULL,0,NULL)
go

------ LOGIN PROCEDURE ------
--drop procedure [log_in]
create Procedure log_in
@email nvarchar(50),
@pass nvarchar(64),
@userid int output,
@roleName nvarchar(30) output,
@Name nvarchar(30) output
As Begin
	Declare @roleId int =-1;
	set @userid = -1
	set @roleid = -1
	Set @roleName='unknown';
	Set @Name='unknown';

	if EXISTS(Select * from [User] u where u.Email=@email and u.Password = Hashbytes('SHA2_512', @pass))
	Begin
		Select @userid = u.Id, @roleid = ur.Role_Id, @Name=u.Name from [User] u 
		JOIN User_Role ur on u.Id = ur.U_ID
		where u.Email = @email
		Select  @roleName=R.Name from [Role] R  where R.Id= @roleId;
	End
End

--declare @userId1 int 
--declare @rolename1 nvarchar(30)
--exec [dbo].log_in @email='ali@gmail.com' , @pass= 'pass123', @userid=@userId1 output , @roleName=@roleName1 output
--select @userId1 as Val

select * from [User]
select * from Product
select * from [User_Role]
select * from [Role]
------ SIGNUP PROCEDURE ------

--drop procedure sign_up

Create procedure sign_up
@name nvarchar(30),
@address nvarchar(100),
@age int,
@email nvarchar(50),
@contact nvarchar(30),
@pass nvarchar(64),
@userId int output

As Begin

	if EXISTS(Select * from [User] u where u.Email = @email or u.Name = @name)
		set @userId = -1
	else if @age <= 0 or @age >= 100
		set @userId = 0
	else begin
		
		INSERT INTO [User] values(@name, @address, @age, @email,GETDATE(), @contact, Hashbytes('SHA2_512',@pass))

		declare @uid int
		Select @uid = u.Id from [User] u where u.Email = @email

		INSERT INTO User_Role values(@uid, 1, NULL, 0, 1)
		set @userId = @uid;
	end
end
