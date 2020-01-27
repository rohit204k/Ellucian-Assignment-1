
select * from employee;
select name from dept;
select * from parts where qoh=0;
select * from employee where salary between 10000 and 12000;
select name,price,1.1*price as increased_price from item where dept=49;
select name,numb,salary from employee where name like "s%";
select name,weight from parts where numb in (select parts from supply ,supplier where supplier=numb and name="DEC");
select distinct p.name,p.weight from parts p,supply s,supplier su where p.numb=s.parts and s.supplier=su.numb and su.name="DEC";
select name,color from parts where weight > (select weight from parts where name="tape drive" and color="black");
select a.name,a.color from parts a,parts b where a.weight>b.weight and b.name="tape drive" and b.color="black";
select avg(salary) from employee where manager="199";
select name,count(distinct parts) as number_of_parts from supplier join supply on supplier.numb=supply.supplier group by name;
select sum(p.weight) as total_weight from parts p,supply s,supplier su,city c where p.numb=s.parts and s.supplier=su.numb and su.city=c.name and c.state="MASS" group by s.supplier;
insert into supplier values ("2048","R K","Los Angeles");
select e.name,e.numb,e.salary from employee e,dept d where e.numb=d.manager and d.subdivision=8;
update employee set salary=1.05*salary where numb in (select manager from dept where subdivision=8);
select e.name,e.numb,e.salary from employee e,dept d where e.numb=d.manager and d.subdivision=8;
