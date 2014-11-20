/* ADDRESS AUTOINCREMENT ID */
create sequence address_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger address_ai_trigger
	before insert on Address
	for each row
begin
	select address_seq.nextval
	into :new.id_address
	from dual;
end;

/* ------------ SUBJECT AUTOINCREMENT ID ------------ */
create sequence subject_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger subject_ai_trigger
	before insert on Subject
	for each row
begin
	select subject_seq.nextval
	into :new.id_subject
	from dual;
end;

/* ------------ Class AUTOINCREMENT ID ------------ */
create sequence class_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger class_ai_trigger
	before insert on Class
	for each row
begin
	select class_seq.nextval
	into :new.id_class
	from dual;
end;

/* ------------ Student AUTOINCREMENT ID ------------ */
create sequence student_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger student_ai_trigger
	before insert on Student
	for each row
begin
	select student_seq.nextval
	into :new.id_student
	from dual;
end;

/* ------------ Teacher AUTOINCREMENT ID ------------ */
create sequence teacher_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger teacher_ai_trigger
	before insert on Teacher
	for each row
begin
	select teacher_seq.nextval
	into :new.id_teacher
	from dual;
end;

/* ------------ Truancy AUTOINCREMENT ID ------------ */
create sequence truancy_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger truancy_ai_trigger
	before insert on Truancy
	for each row
begin
	select truancy_seq.nextval
	into :new.id_truancy
	from dual;
end;

/* ------------ Marks AUTOINCREMENT ID ------------ */
create sequence marks_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger marks_ai_trigger
	before insert on Marks
	for each row
begin
	select marks_seq.nextval
	into :new.id_marks
	from dual;
end;

/* ------------ Teacher_Subject AUTOINCREMENT ID ------------ */
/* ????????????????????????????????? */

/* ------------ Classroom AUTOINCREMENT ID ------------ */
create sequence classroom_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger classroom_ai_trigger
	before insert on Classroom
	for each row
begin
	select classroom_seq.nextval
	into :new.id_classroom
	from dual;
end;

/* ------------ WeekDay AUTOINCREMENT ID ------------ */
create sequence weekday_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger weekday_ai_trigger
	before insert on WeekDay
	for each row
begin
	select weekday_seq.nextval
	into :new.id_day
	from dual;
end;

/* ------------ LessonTime AUTOINCREMENT ID ------------ */
create sequence lessontime_seq
	start with 1
	increment by 1
	nomaxvalue;

create or replace trigger lessontime_ai_trigger
	before insert on LessonTime
	for each row
begin
	select lessontime_seq.nextval
	into :new.lesson_number
	from dual;
end;