1.1. select ecode from employee e where exists (select * from project p where e.dcode = p.dcode and p.prjlocation = 'Los Angeles');

1.2. select distinct ecode from work w1 where not exists (
   select prjnum from work where hours = 10
   MINUS
   select prjnum from work w2 where w1.ecode = w2.ecode
);

1.3. select ecode from work w where not exists (select prjnum from project where prjlocation = 'Los Angeles' MINUS select prjnum from 

work w1 where w1.ecode = w.ecode and w.hours =
10);

1.4.select prjnum from project p where exists (select dcode from department d where budget = (select MAX(budget) from department) and 

p.dcode = d.dcode);

2. alter table project MODIFY prjname default 'Some Value';

3.1. create view e as
select ecode, budget from employee,department where employee.dcode = department.dcode;
   create view v2 as
select e1.ecode as EMP1, e2.ecode as EMP2 from e e1, e e2 where e1.budget > e2.budget;	

3.2. create view v1 as
select distinct ecode from work w1 where 1 < (select count(prjnum) from work w2 where w1.ecode = w2.ecode);
