create database PlantShop
GO
use PlantShop
GO
create table Accounts(
    accID int identity(1,1)primary key,
    email varchar(30)  unique,
    password varchar(30),
    fullname varchar(30),
    phone varchar(12),
    status int check(status =1 or status=0),-- 1:active; 0:inactive
    role int check(role=1 or role=0),    --:admin, 0:user
	token varchar(50)
)
GO
create table Categories(
      CateID int identity(1,1) primary key,
      CateName varchar(30)
)
GO
create table Plants(
      PID int identity(1,1) primary key,
      PName varchar(30),
      price int check(price>=0),
      imgPath varchar(50),
      description text,
      status int,    --1:active, 0:inactive
      CateID int foreign key references Categories(CateID)
)
GO
create table Orders(
    OrderID int identity(1,1) primary key,
    OrdDate date,
    shipdate date,
    status int check(status =1 or status=2 or status=3),--1:processing, 2: completed, 3: cancel
    AccID int foreign key references Accounts(AccID)
)
GO
create table OrderDetails(
    DetailId int identity(1,1) primary key,
    OrderID int foreign key references Orders(OrderID),
    FID int foreign key references Plants(PID),
    quantity int check(quantity>=1)
)
GO

insert into Categories values('tam li')
insert into Categories values('tre em')
insert into Categories values('nguoi lon')
insert into Categories values('SGK')

insert into Plants values('so tay nha thoi mien', 100,'img/product/1.jpeg','sach siuuuu hay',1,1)
insert into Plants values('so tay nha thoi mien1', 100,'img/product/1.jpeg','sach siuuuu hay',1,2)
insert into Plants values('so tay nha thoi mien2', 100,'img/product/1.jpeg','sach siuuuu hay',1,3)
insert into Plants values('so tay nha thoi mien3', 100,'img/product/1.jpeg','sach siuuuu hay',1,4)
insert into Plants values('so tay nha thoi mien4', 100,'img/product/1.jpeg','sach siuuuu hay',1,1)
insert into Plants values('so tay nha thoi mien5', 100,'img/product/1.jpeg','sach siuuuu hay',1,2)
insert into Plants values('so tay nha thoi mien6', 100,'img/product/1.jpeg','sach siuuuu hay',1,3)
insert into Plants values('so tay nha thoi mien7', 100,'img/product/1.jpeg','sach siuuuu hay',1,4)
insert into Plants values('so tay nha thoi mien8', 100,'img/product/1.jpeg','sach siuuuu hay',1,3)
insert into Plants values('so tay nha thoi mien9', 100,'img/product/1.jpeg','sach siuuuu hay',1,4)
insert into Plants values('so tay nha thoi mien10', 100,'img/product/1.jpeg','sach siuuuu hay',1,4)
