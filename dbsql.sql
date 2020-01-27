/*List all employees*/
select * from employee;

/*List name of all departments*/
select name from dept;

/*List of parts not in the store*/
select * from parts where qoh=0;

/*List os employees with salary between 10000 and 12000*/
select * from employee where salary between 10000 and 12000;

/*Name,price and new price of a;; the items sold in dept 49*/
select name,price,1.1*price as increased_price from item where dept=49;

/*Employees who have a family name starting with "S"*/
select name,numb,salary from employee where name like "s%";

/*Name and weight of parts supplied by supplier "DEC"*/
select name,weight from parts where numb in (select parts from supply ,supplier where supplier=numb and name="DEC");

/*Same as above but without using a subquery*/
select distinct p.name,p.weight from parts p,supply s,supplier su where p.numb=s.parts and s.supplier=su.numb and su.name="DEC";

/*Name and color of parts heavier than black tape drive*/
select name,color from parts where weight > (select weight from parts where name="tape drive" and color="black");

/*same as above but without using a subquery*/
select a.name,a.color from parts a,parts b where a.weight>b.weight and b.name="tape drive" and b.color="black";

/*Average salary of employees with manager=199*/
select avg(salary) from employee where manager="199";

/*Name of each supplier and number of different parts he supplies*/
select name,count(distinct numb) as number_of_parts from supplier join supply on supplier.numb=item.supplier group by name;

/*Total weight of parts wupplierd by supplier in Massachusetts*/
select sum(p.weight) as total_weight from parts p,supply s,supplier su,city c where p.numb=s.parts and s.supplier=su.numb and su.city=c.name and c.state="MASS" group by s.supplier;

/*Inserting into supplier table*/
insert into supplier values ("2048","R K","Los Angeles");

/*Names and Salaries of managers of departments in store 8, and their new updated salaries*/
select e.name,e.numb,e.salary from employee e,dept d where e.numb=d.manager and d.subdivision=8;
update employee set salary=1.05*salary where numb in (select manager from dept where subdivision=8);
select e.name,e.numb,e.salary from employee e,dept d where e.numb=d.manager and d.subdivision=8;