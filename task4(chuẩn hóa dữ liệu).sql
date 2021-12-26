-- Bài1
-- Tạo DATABASES
Create database assignment1
go
-- Sử dụng DATABASES
Use assignment1
go
-- Bài 2
-- Tạo bảng Customer
Create table Customer (
	CustomerID int primary key,
	Name nvarchar(50),
	Address varchar(100),
	Tel varchar(100)
)
go

go
-- Tạo bảng Product
Create table Product(
	ProductID int primary key ,
	Name nvarchar(100),
	Description nvarchar(500),
	Unit nvarchar(50),
	price money,
	Quantily int ,
	Status nvarchar(100)
)
go
-- Tạo bảng Orders
Create table Orders(
	OrderID int primary key,
	CustomerID int foreign key references Customer(CustomerID),
	Date datetime,
	Status nvarchar(100)
)
go

-- Tạo bảng OrderDetail
Create table OrderDetail(
	OrderID int foreign key references Orders(OrderID),
	ProductID int foreign key references Product(ProductID),
	Price money ,
	Quantily int
)
go 
-- Bài 3 
-- Thêm dữ liệu vào các bảng 
insert into Customer values(1, N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','987654321'),
						   (2, N'Lee Tuấn Minh', N'128 Viên An , Ứng Hòa , Hà Nội','0123456789')

insert into Product values(1,N'Máy Tính T450',N'Máy nhập mới',N'Chiếc',1000,1,N'Còn Hàng'),
						  (2,N'Điện Thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,2,N'Còn Hàng' )

insert into Orders values(1, 1,2000-11-11, N'Đã Nhận'),
						 (2, 2,2000-11-11, N'Đã Hủy')

insert into OrderDetail values(1, 1, 1000,1),
							  (2, 2, 200,1)
go
-- Bài 4
-- Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng
Select * from Customer
go
--  Liệt kê danh sách sản phẩm của của hàng
Select * from Product
go
-- Liệt kê danh sách các đơn đặt hàng của cửa hàng
Select * from Orders
go
-- Bài 5
-- Liệt kê danh sách khách hàng theo thứ thự alphabet
Select * From Customer
Order by Name 
go
-- Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần
Select * From Product
Order by Price DESC
go
-- Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua
Select * From Product 
Where ProductID = 1
go

-- Bài 6
-- Số khách hàng đã mua ở cửa hàng
Select COUNT (CustomerID)
From Customer
Group by CustomerID  
go
--Số mặt hàng mà cửa hàng bán.
Select COUNT(Name) 
From Product
Group by Name  
go
-- Tổng tiền của từng đơn hàng.
Select Price From  OrderDetail

-- Bài 7
