--In functionality 7, if we insert tuples where a customer who is a member makes the below purchases (eg: 5 of the same products), 
--The top 10 customers purchase order will change.
--See this change in the order of the top 10 customer purchase records when we run the Functionality 8 query.

insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17');
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17');
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17');
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17');
insert into purchase(CID,BID,PROD_ID,SEllING_PRICE,SELL_DATE) values('10004','TPJ002','M003','100','01-Nov-17');
commit;


--If the expense amount is increased, the branch grossing the maximum profit will differ:
--The change can be seen when we run the query for functionality no. 6

update expenses set cost='525' where BID='TPJ003' and Etype='Maintenance' and Edate='15-Oct-17';


