CREATE DATABASE PRJ301
USE PRJ301

CREATE TABLE tblUsers(
userID nvarchar(10) PRIMARY KEY,
password nvarchar,
roleID nvarchar(2),
name nvarchar(50),
email nvarchar(50),
phone nvarchar(10),
address nvarchar(50)
)

CREATE TABLE tblProducts(
productID nvarchar(10) PRIMARY KEY,
productName nvarchar(50),
productImg nvarchar(500),
productPrice int
)

CREATE TABLE tblOrders(
orderID int IDENTITY(1,1) PRIMARY KEY,
userID nvarchar(10) FOREIGN KEY REFERENCES tblUsers(userID),
date nvarchar(100),
total nvarchar(20)
)

CREATE TABLE tblOrderDetails(
detailID int IDENTITY(1,1) PRIMARY KEY,
orderID int FOREIGN KEY REFERENCES tblOrders(orderID),
productID nvarchar(10) FOREIGN KEY REFERENCES tblProducts(productID),
productName nvarchar(50),
productImg nvarchar(500),
quantity nvarchar(10),
productPrice nvarchar(20)
)

INSERT tblUsers VALUES (N'admin', N'1', N'AD', N'Tuan Dung', N'dungdeptraipro19@gmail.com', N'0914567891', N'Ho Chi Minh')
INSERT tblUsers VALUES (N'user1', N'1', N'US', N'Quang Hai', N'quanhai@gmail.com', N'0911234567', N'Ha Noi')
INSERT tblUsers VALUES (N'user2', N'1', N'US', N'Tien Bip', N'tienbip@gmail.com', N'0917654321', N'Hai Phong')
INSERT tblUsers VALUES (N'user3', N'1', N'US', N'Kha Banh', N'khabanh@gmail.com', N'0912345678', N'Thai Binh')
INSERT tblUsers VALUES (N'user4', N'1', N'US', N'Khanh Sky', N'khanhsky@gmail.com', N'0913456789', N'Thanh Hoa')
INSERT tblUsers VALUES (N'user5', N'1', N'US', N'Huan Hoa Hong', N'huanhoahong@gmail.com', N'0914567890', N'Hai Phong')
INSERT tblUsers VALUES (N'user6', N'1', N'US', N'Low G', N'lowg@gmail.com', N'0919876543', N'Ha Noi')
INSERT tblUsers VALUES (N'user7', N'1', N'US', N'Ocean MOB', N'oceanmob@gmail.com', N'0918765432', N'Ha Noi')
INSERT tblUsers VALUES (N'user8', N'1', N'US', N'Bunny Colby', N'bunnycolby@gmail.com', N'0911245780', N'Nuoc Nga')

INSERT tblProducts VALUES(N'TS01', N'Thuốc lào flavor',N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '20')
INSERT tblProducts VALUES(N'TS02', N'Thuốc lá flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '10')
INSERT tblProducts VALUES(N'TS03', N'Lá sung flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '25')
INSERT tblProducts VALUES(N'TS04', N'Nước mắm flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '30')
INSERT tblProducts VALUES(N'TS05', N'Mì tôm flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '22')
INSERT tblProducts VALUES(N'TS06', N'Nấm flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '40')
INSERT tblProducts VALUES(N'TS07', N'Máy in flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '25')
INSERT tblProducts VALUES(N'TS08', N'Doraemon flavor', N'https://assets.grab.com/wp-content/uploads/sites/11/2019/09/24164744/67388701_623935038015136_1489320721967135771_n.jpg', '76')
