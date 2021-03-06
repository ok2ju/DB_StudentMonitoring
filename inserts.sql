/* ----------- Address ---------------- */
insert into Address(id_address, street) values(1,'Lenina');
insert into Address(id_address, street) values(2,'Schorsa');
insert into Address(id_address, street) values(3,'Himikov');
insert into Address(id_address, street) values(4,'Taulaya');
insert into Address(id_address, street) values(5,'Kosmonautov');

/* ----------- Subjects ------------------- */
insert into Subject values(1, 'Математика');
insert into Subject values(2, 'Информатика');
insert into Subject values(3, 'Биология');
insert into Subject values(4, 'История');

/* ------------ Class -------------------- */
insert into Class values(1, 7, 'А');
insert into Class values(2, 8, 'А');
insert into Class values(3, 9, 'А');
insert into Class values(4, 10, 'А');
insert into Class values(5, 11, 'А');
insert into Class values(6, 7, 'Б');
insert into Class values(7, 8, 'Б');
insert into Class values(8, 9, 'Б');
insert into Class values(9, 10, 'Б');
insert into Class values(10, 11, 'Б');

/* ----------- Student ---------------- */

insert into Student values(1, Person('Dima', 'Petrov', 'M'),TO_DATE('1994-05-03', 'yyyy-mm-dd'), 1, 1, 1);
insert into Student values(2, Person('Petya', 'Kartoshkin', 'M'),TO_DATE('1994-01-04', 'yyyy-mm-dd'), 1, 2, 4);

/* ----------- Teacher ---------------- */
insert into Teacher values(1, Person('Alexander', 'Pavlov', 'M'), 2);

/* ----------- Marks ------------------- */
insert into Marks values(1, 10, 1, 1, 1);
insert into Marks values(2, 9, 1, 2, 1);
insert into Marks values(3, 9, 1, 3, 1);
insert into Marks values(4, 8, 1, 4, 1);
insert into Marks values(5, 9, 2, 4, 1);

insert all into Marks(id_marks, mark, semester, id_subject, id_student)
values(marks_seq.nextval, mar_marks, mar_semester, mar_id_subject, mar_id_student)
select
  9 as mar_marks,
  3 as mar_semester,
  Subject.id_subject as mar_id_subject,
  s.id_student as mar_id_student
from Subject, Student s
where s.person.surname = 'Testovich' and
Subject.title = 'Математика';

/* ----------- Truancy ---------------- */
insert into Truancy values(1, TO_DATE('2003-05-03', 'yyyy-mm-dd'), 'Прогул', 1, 1);
insert into Truancy values(2, TO_DATE('2003-06-01', 'yyyy-mm-dd'), 'По болезни', 2, 1);
insert into Truancy values(3, TO_DATE('2003-02-04', 'yyyy-mm-dd'), 'Письменное распоряжение', 3, 1);

/* ----------- Classroom -------------- */
insert into Classroom values(1, 101, 1, 'ул.Щорса');
insert into Classroom values(2, 200, 2, 'ул.Щорса');
insert into Classroom values(3, 250, 3, 'ул.Щорса');

/* ------------ WeekDay --------------- */
insert into WeekDay values(1, 'Понедельник');
insert into WeekDay values(2, 'Вторник');
insert into WeekDay values(3, 'Среда');
insert into WeekDay values(4, 'Четверг');
insert into WeekDay values(5, 'Пятница');
insert into WeekDay values(6, 'Суббота');
insert into WeekDay values(7, 'Воскресенье');

/* ------------- LessonTime ------------ */
insert into LessonTime values(1, '08:30', '09:15');
insert into LessonTime values(2, '09:30', '10:15');
insert into LessonTime values(3, '10:30', '11:15');
insert into LessonTime values(4, '11:30', '12:15');
insert into LessonTime values(5, '12:30', '13:15');
insert into LessonTime values(6, '13:30', '14:15');

/* ------------- Schedule -------------- */
insert into Schedule values(1, 1, 1, 1, 1, 1);
insert into Schedule values(1, 1, 2, 2, 1, 1);