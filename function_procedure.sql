/* создание функции для вычисления среднего балла по предмету */
drop function avgMark;

create function avgMark(student in int, predmet in varchar2) return number
is
  n number;
begin
  select avg(mark)
  into n
  from Marks, Student, Subject
  where Marks.id_student = Student.id_student and
  Marks.id_subject = Subject.id_subject and
  Subject.title = predmet and
  Student.id_student = student;
  return n;
end;

select avgMark(1, 'Математика') from dual;

/* ------- Создание процедуры, которая высчитывает сдерний балл класса по предмету */
drop procedure avgMarkInClass;

create or replace procedure avgMarkInClass(class_id in int, predmet in varchar2)
is
n int;
begin
  select avg(mark)
  into n
  from Marks, Student s, Subject, Class
  where s.id_class = Class.id_class and
  Marks.id_student = s.id_student and
  Marks.id_subject = Subject.id_subject and
  Class.id_class = class_id and Subject.title = predmet
  group by class_number, class_character;

  DBMS_OUTPUT.enable;
  DBMS_OUTPUT.put_line(n);
 
 END avgMarkInClass;

/* ------- Запуск Процедуры ------ */
SET SERVEROUTPUT ON

DECLARE 

BEGIN

avgMarkInClass(1, 'Математика');
  
END;
/

/* execute avgMarkInClass(1, 'Математика'); */


/* DYNAMIC SQL EXAMPLE */
DECLARE
  sql_stmt varchar(200);
  addr_id number(4) := 10;
  addr_street varchar2(30) := 'Ozheshko';
BEGIN
  sql_stmt := 'insert into Address(id_address, street) values(:1, :2)';
  EXECUTE IMMEDIATE sql_stmt USING addr_id, addr_street;
END;

/* ---------------------------------------------------------------------- */

create procedure delete_rows (table_name in varchar2, condition in varchar2 default null)
as
where_clause varchar2(100) := ' where ' || condition;
begin
  if condition is null then where_clause := null;
  end if;
  execute immediate 'delete from ' || table_name || where_clause;
end;

SET SERVEROUTPUT ON
DECLARE 
BEGIN

delete_rows('Address', 'id_address = 1');
  
END;