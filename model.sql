alter table Student drop constraint FK_STUDENT_ADDRESS;
alter table Teacher drop constraint FK_TEACHER_ADDRESS;
drop table Address;

create table Address 
(
	id_address int not null,
	street varchar2(20),
	city varchar2(30) default 'Гродно',
	state varchar2(30) default 'Беларусь',
	constraint PK_ADDRESS primary key (id_address)
);

alter table Marks drop constraint FK_MARKS_SUBJECT;
alter table Schedule drop constraint FK_SCHEDULE_SUBJECT;
alter table Teacher_Subject drop constraint FK_TEACHER_SUBJECT_SUBJECT;
alter table Truancy drop constraint FK_TRUANCY_SUBJECT;
drop table Subject;

create table Subject 
(
	id_subject int not null,
	title varchar2(30)
	constraint TITLE_SUBJECT_CONSTRAINT check (title in ('Математика', 'Информатика', 'Биология', 'История')),
	constraint PK_SUBJECT primary key (id_subject)
);

alter table Student drop constraint FK_STUDENT_TRUANCY;
drop table Truancy;

create table Truancy 
(
	id_truancy int not null,
	date_truancy date,
	reason varchar2(30)
	constraint REASON_TRUANCY_CONSTRAINT check (reason in ('Прогул', 'По болезни', 'Письменное распоряжение')),
	id_subject int,
	constraint PK_TRUANCY primary key (id_truancy),
	constraint FK_TRUANCY_SUBJECT foreign key (id_subject) references Subject (id_subject)
);

alter table Student drop constraint FK_STUDENT_MARKS;
drop table Marks;

create table Marks 
(
	id_marks int not null,
	mark int
	constraint MARK_MARKS_CONSTRAINT check (mark between 1 and 10),
	semester int
	constraint SEMESTER_MARKS_CONSTRAINT check (semester between 1 and 4),
	id_subject int,
	constraint PK_MARKS primary key (id_marks),
	constraint FK_MARKS_SUBJECT foreign key (id_subject) references Subject (id_subject)
);

alter table Class drop constraint FK_CLASS_STUDENT;
drop table Student;
alter table Teacher_Subject drop constraint FK_TEACHER_SUBJECT_TEACHER;
alter table Schedule drop constraint FK_SCHEDULE_TEACHER;
drop table Teacher;
drop type Person;

create or replace type Person as object 
(
	surname varchar2(20),
	name varchar2(20),
	gender char(1)
)
/

create table Student
(
	id_student int not null,
	person Person,
	dateEnrollment date,
	id_elder int,
	id_marks int,
	id_truancy int,
	id_address int,
	constraint PK_STUDENT primary key (id_student),
	constraint FK_STUDENT_ADDRESS foreign key (id_address) references Address (id_address),
	constraint FK_STUDENT_STUDENT foreign key (id_elder) references Student (id_student),
	constraint FK_STUDENT_MARKS foreign key (id_marks) references Marks (id_marks),
	constraint FK_STUDENT_TRUANCY foreign key (id_truancy) references Truancy (id_truancy)
);

create table Teacher
(
	id_teacher int not null,
	person Person,
	id_address int,
	constraint PK_TEACHER primary key (id_teacher),
	constraint FK_TEACHER_ADDRESS foreign key (id_address) references Address (id_address)
);

drop table Teacher_Subject;

create table Teacher_Subject 
(
	id_teacher int not null,
	id_subject int not null,
	constraint PK_TEACHER_SUBJECT primary key (id_teacher, id_subject),
	constraint FK_TEACHER_SUBJECT_TEACHER foreign key (id_teacher) references Teacher (id_teacher),
	constraint FK_TEACHER_SUBJECT_SUBJECT foreign key (id_subject) references Subject (id_subject)
);

alter table Schedule drop constraint FK_SCHEDULE_CLASS;
drop table Class;

create table Class
(
	id_class int not null,
	class_number int 
	constraint NUMBER_CLASS_CONSTRAINT check (class_number between 1 and 11),
	class_character char
	constraint CHARACTER_CLASS_CONSTRAINT check (class_character in ('А', 'Б', 'В', 'Г')),
	id_student int,
	constraint PK_CLASS primary key (id_class),
	constraint FK_CLASS_STUDENT foreign key (id_student) references Student (id_student)
);

alter table Schedule drop constraint FK_SCHEDULE_CLASSROOM;
drop table Classroom;

create table Classroom 
(
	id_classroom int not null,
	classroom_number int
	constraint NUMBER_CLASSROOM_CONSTRAINT check (classroom_number between 100 and 300),
	floor int
	constraint FLOOR_CLASSROOM_CONSTRAINT check (floor between 1 and 3),
	building varchar2(20),
	constraint PK_CLASSROOM primary key (id_classroom)
);

alter table Schedule drop constraint FK_SCHEDULE_WEEKDAY;
drop table WeekDay;

create table WeekDay 
(
	id_day int not null
	constraint DAY_WEEKDAY_CONSTRAINT check (id_day between 1 and 7),
	day_name varchar2(20)
	constraint DAYNAME_WEEKDAY_CONSTRAINT check (day_name in ('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье')),
	constraint PK_WEEKDAY primary key (id_day)
);

alter table Schedule drop constraint FK_SCHEDULE_LESSONTIME;
drop table LessonTime;

create table LessonTime 
(
	lesson_number int not null,
	start_lesson timestamp,
	end_lesson timestamp,
	constraint PK_LESSONTIME primary key (lesson_number)
);

drop table Schedule;

create table Schedule 
(
	id_classroom int,
	id_day int,
	lesson_number int,
	id_subject int,
	id_class int,
	id_teacher int,
	constraint FK_SCHEDULE_SUBJECT foreign key (id_subject) references Subject (id_subject),
	constraint FK_SCHEDULE_CLASSROOM foreign key (id_classroom) references Classroom (id_classroom),
	constraint FK_SCHEDULE_LESSONTIME foreign key (lesson_number) references LessonTime (lesson_number),
	constraint FK_SCHEDULE_CLASS foreign key (id_class) references Class (id_class),
	constraint FK_SCHEDULE_WEEKDAY foreign key (id_day) references WeekDay (id_day),
	constraint FK_SCHEDULE_TEACHER foreign key (id_teacher) references Teacher (id_teacher)
);