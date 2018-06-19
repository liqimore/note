分工:

ora00062:  DBA,tech FVWg8q

ora00075:  PA,SK ZQN8JV

ora00055:  PDS , Txuthy

ora00110:  SKS, EwQb6Q *



insert into product values(1,1001,'product1','unit',23);

insert into product values(2,1002,'product2','unit',13);

insert into product values(2,1003,'product3','unit',11);

insert into product values(3,1004,'product4','unit',18);

insert into product values(3,1005,'product5','unit',15);

insert into product values(1,1006,'product6','unit',33);



insert into supplier values(3,'supp3','address3','contact3');



insert into pot_supplier values(2,1002,1002);



insert into purchase_order values(9506,22-2-98,60,'I');

update purchase_order set po_date='1-3-99' where po_number=9506;

insert into detail values(9505,1003,20,15);

insert into pa_task values(102,9505);

SELECT 
                po.po_number, po.po_date, 
                pa.pa_name, 
                su.supplier_id, su.addr, su.contact,
                pr.product_id, pr.product_name, pr.unit, pr.unit_price,
                de.qty_order, de.qty_rec
                FROM
                ora00062.purchase_order po, ora00062.pa_agent pa,
                ora00062.supplier su, ora00062.product pr,
                ora00062.detail de, ora00062.pa_task pat
                WHERE 
                po.po_number = 9502
                AND 
                de.po_number = po.po_number
                AND 
                pat.po_number = de.po_number
                AND 
                pat.emp_num = pa.emp_num
                AND 
                de.product_id = pr.product_id
                AND 
                pr.supplier_id = su.supplier_id;