drop table emp;
create table emp
	(emp_num number primary key,
	emp_name char(15) not null,
	addr	char(15) default'Saguenay');
