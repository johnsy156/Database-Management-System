INSERT INTO BRANCH(BID,ADDRESS,PHONE) values('TPJ001','Arlington','9790957890'); commit;
INSERT INTO BRANCH(BID,ADDRESS,PHONE) values('TPJ001','Arlington','8789056743'); commit;

Insert into Employee(ssn,name,doj,phone,designation,address,bid) values('123456999','Sam','12-Nov-17','9729566833','Manager','Arlington','TPJ001'); commit;
INSERT INTO Employee(ssn,name,doj,phone,designation,address,bid) values('787123413','Jo','01-Sep-16','9764530833','Assistant','Arlington','TPJ001'); commit;
INSERT INTO Employee(ssn,name,doj,phone,designation,address,bid) values('785786631','Tej','15-Apr-16','8712378787','Assistant','Dallas','TPJ002'); commit;
INSERT INTO Employee(ssn,name,doj,phone,designation,address,bid) values('554489831','Karl','15-June-17','8799997800','Manager','Austin','TPJ003'); commit;
INSERT INTO Employee(ssn,name,doj,phone,designation,address,bid) values('554543888','Mark','01-Oct-17','8886543901','Assistant','Austin','TPJ003'); commit;

insert into Customer(CID,PHONE,SSN,NAME,ADDRESS,CUST_TYPE,FEE,MEM_ID,BID) values('10005','6653416766','465665473','Sherlock','Austin','Member','25','TPJ3007','TPJ003'); commit;

insert into Products(PROD_ID,BUY_DATE,PCOUNT,TYPE_CODE,CNAME,COST_PRICE) values('B001','03-Nov-17','10','CS001','Comp Sci','75'); commit;
insert into products(prod_id, buy_date, name, pcount, type_code, cname, cost_price) values ('M004','23-may-17','DC comic Bottle','7','WB001','Bottle','20');

insert into rents(CID,BID,PROD_ID,RENT_DATE,RETURN_DATE,DUE_DATE) values('10005','TPJ001','B001','09-Sep-17','12-Nov-17','12-Nov-17'); commit;
insert into rents(CID,BID,PROD_ID,RENT_DATE,RETURN_DATE,DUE_DATE) values('10002','TPJ002','M001','11-Sep-17','19-Oct-17','12-OCt-17'); commit;
insert into rents(CID,BID,PROD_ID,RENT_DATE,RETURN_DATE,DUE_DATE) values('10001','TPJ003','B003','11-Sep-16','19-Oct-16','19-OCt-16'); commit;

insert into Expenses(BID,Etype,Cost,Edate) values('TPJ003','Maintenance','795','15-Oct-17'); commit;

insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17'); commit;
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10005','TPJ003','M003','100','19-Sep-17'); commit;
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10006','TPJ003','B003','125','29-Jan-17'); commit;
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10001','TPJ002','B002','120','02-Feb-17'); commit;

insert all
into mxv2621.books(bprod_id,publication) values ('B006','Penguin')
into mxv2621.books(bprod_id,publication) values ('B007','CreateSpace')
select * from dual;

INSERT ALL
INTO mxv2621.products(prod_id,buy_date,name,pcount,type_code,cname,cost_price) VALUES ('M061','15-jun-17','Vogue Fashion',20,'MZ001','Magazine',7)
 INTO mxv2621.products(prod_id,buy_date,name,pcount,type_code,cname,cost_price) VALUES ('M091','27-sep-17','Striking blue HS',11,'HS001','Headset',60)
 INTO mxv2621.products(prod_id,buy_date,name,pcount,type_code,cname,cost_price) VALUES ('M031','31-mar-16','Comic bottle','19','WB001','Bottle','20')
 INTO mxv2621.products(prod_id,buy_date,name,pcount,type_code,cname,cost_price) VALUES ('M030','27-mar-17','Batman tee','10','SH001','T-shirt','50')
select * from dual;


INSERT ALL
INTO mxv2621.merchandise(mprod_id,brand) VALUES ('M061','Vogue')
INTO mxv2621.merchandise(mprod_id,brand) VALUES ('M091','Beats')
INTO mxv2621.merchandise(mprod_id,brand) VALUES ('M031','Marvel')
INTO mxv2621.merchandise(mprod_id,brand) VALUES ('M030','DC')
select * from dual;

