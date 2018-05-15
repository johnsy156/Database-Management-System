--Queries to create all the tables required for the bookstore management system

create table Branch(
	BID varchar2(10) NOT NULL primary key,
	ADDRESS varchar2(50),
	Phone NUMBER(10);
	
create table Employee(
	SSN NUMBER(9) NOT NULL primary key,
	NAME varchar2(40),
	DOJ DATE,
	Phone NUMBER(10),
	Designation varchar2(20),
	Address varchar2(50), 
	BID varchar2(10), 
	FOREIGN KEY(BID) REFERENCES Branch(BID) ON DELETE CASCADE);
	
create table Customer(
	CID NUMBER(10) NOT NULL primary key,
	PHONE NUMBER(10),
	SSN NUMBER(9),
	NAME varchar2(40),
	ADDRESS varchar2(50),
	CUST_TYPE varchar2(10),
	FEE NUMBER(10),
	MEM_ID varchar2(10),
	BID varchar2(10), 
	FOREIGN KEY(BID) REFERENCES Branch(BID) ON DELETE CASCADE);
	
create table Products(
	PROD_ID VARCHAR2(10) NOT NULL PRIMARY KEY,
	BUY_DATE DATE,
	NAME varchar2(20),
	PCOUNT NUMBER(5),
	TYPE_CODE varchar2(10),
	CNAME varchar2(10),
	COST_PRICE NUMBER(10,2));
	
create table Books(
	BPROD_ID varchar2(10) NOT NULL PRIMARY KEY, 
	Publication varchar2(30), 
	FOREIGN KEY(BPROD_ID) REFERENCES PRODUCTS(PROD_ID) ON DELETE CASCADE);
	
create table Merchandise(
	MPROD_ID varchar2(10) NOT NULL PRIMARY KEY, 
	Brand varchar2(30), 
	FOREIGN KEY(MPROD_ID) REFERENCES PRODUCTS(PROD_ID) ON DELETE CASCADE); 
	
create table Book_Author(
	BPROD_ID varchar2(10), 
	AUTHOR varchar2(30) NOT NULL, 
	PRIMARY KEY(BPROD_ID,AUTHOR), 
	FOREIGN KEY(BPROD_ID) REFERENCES Products(PROD_ID));
	
create table Purchase(
	CID NUMBER(10),
	BID varchar2(10),
	PROD_ID varchar2(10),
	SELLING_PRICE NUMBER(10,2), 
	SELL_DATE DATE, 
	PRIMARY KEY(CID,BID,PROD_ID), 
	FOREIGN KEY(CID) REFERENCES Customer(CID), 
	FOREIGN KEY(BID) REFERENCES Branch(BID), 
	FOREIGN KEY(PROD_ID) REFERENCES Products(PROD_ID));
	
create table Rents(
	CID NUMBER(10),
	BID varchar2(10),
	BPROD_ID varchar2(10), 
	RENT_DATE DATE,
	RETURN_DATE DATE, 
	PRIMARY KEY(CID,BID,BPROD_ID), 
	FOREIGN KEY(CID) REFERENCES Customer(CID), 
	FOREIGN KEY(BID) REFERENCES Branch(BID), 
	FOREIGN KEY(BPROD_ID) REFERENCES Products(PROD_ID)); 
	
create table Has(
	BID varchar2(10),
	PROD_ID varchar2(10), 
	PRIMARY KEY(BID,PROD_ID), 
	FOREIGN KEY(BID) REFERENCES BRANCH(BID), 
	FOREIGN KEY(PROD_ID) REFERENCES PRODUCTS(PROD_ID));
	
create table Expenses(
	BID varchar2(10),
	Etype varchar2(20),
	Cost NUMBER(10,2),
	Edate DATE, 
	PRIMARY KEY(BID,Etype,Cost,Edate), 
	FOREIGN KEY(BID) REFERENCES Branch(BID));
