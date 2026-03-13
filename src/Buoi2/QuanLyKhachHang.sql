create DATABASE QuanLyBanHang;
use QuanLyBanHang;

create table Customer (
	cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(20),
    cAge INT(3)
);

create table Orders(
	oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice decimal(10,2),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

create table Product (
	pID INT AUTO_INCREMENT PRIMARY KEY,
    pName varchar(20),
    pPrice decimal(10,2)
);

create table OrderDetail(
	oID INT,
    pID INT,
    primary key(oID,pID),
    FOREIGN KEY (oID) references Orders(oID),
    FOREIGN KEY (pID) references Product(pID),
    odQTY INT
);