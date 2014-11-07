/* создание функции для вычисления среднего балла по предмету */
create function AvMark(id_student in int, predmet in varchar2) return number
is
  n number;
  s varchar2(1000);
begin
  s:='select avg(mark)
  from Marks, Student, Subject
  where Marks.id_student = Student.id_student and
  Marks.id_subject = Subject.id_subject and
  Subject.title = '||predmet||' and
  Student.id_student = '||id_student;
  n:=s;
  return n;
end;

/* --------- вывод результата работы функции ------------ */
SET SERVEROUTPUT ON

DECLARE

BEGIN

	DBMS_OUTPUT.enable;
    DBMS_OUTPUT.put_line(avgMark(1, 'Математика'));
    
END;
/

/* ------- Создание процедуры, которая высчитывает сдерний балл по предмету
для определенного ученика */
create or replace procedure testProc(idStud in int, predmet in varchar2)
is

n int;

begin
  select avg(mark) into n
  from Marks, Student, Subject
  where Marks.id_student = Student.id_student and
  Marks.id_subject = Subject.id_subject and
  Subject.title = predmet and
  Student.id_student = idStud;
  
  DBMS_OUTPUT.enable;
  DBMS_OUTPUT.put_line(n);
 
 END testProc;
 /

/* ------- Запуск Процедуры ------ */
SET SERVEROUTPUT ON

DECLARE 

BEGIN

testProc(1, 'Математика');
	
END;
/