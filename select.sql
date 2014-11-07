/* ------ INNER JOIN ------- */
select * from 
Student
inner join
Address
on Student.id_address = Address.id_address;

/* ------ LEFT OUTER JOIN ------ */
select * from
Student
left join
Address
on Student.id_address = Address.id_address;

/* ------- RIGHT OUTER JOIN -------- */
select * from
Student
right join
Address
on Student.id_address = Address.id_address;

/* -------- FULL OUTER JOIN --------- */
select * from
Student
full join
Address
on Student.id_address = Address.id_address;

/* -------- CROSS JOIN -------------- */
select * from
Student, Address;

/* --------- Информация об учениках ---------- */
select s.person.name, s.person.surname, dateEnrollment, street,
city, state, class_number, class_character
from Student s, Address, Class
where s.id_address = Address.id_address and
s.id_class = Class.id_class;

/* информация об учениках определенного класса */
select s.person.name, s.person.surname, dateEnrollment, street,
city, state, class_number, class_character
from Student s, Address, Class
where s.id_address = Address.id_address and
s.id_class = Class.id_class and Class.class_number = 7 and
Class.class_character = 'А';

/* информация об определенном ученике заданного класса */
select s.person.name, s.person.surname, dateEnrollment, street,
city, state, class_number, class_character
from Student s, Address, Class
where s.id_address = Address.id_address and
s.id_class = Class.id_class and Class.class_number = 7 and
Class.class_character = 'А' and s.person.surname = 'Dima';

/* вся успеваемость учеников */
select mark, semester, title, s.person.name, s.person.surname
from Marks, Student s, Subject
where Marks.id_subject = Subject.id_subject and
Marks.id_student = s.id_student;

/* успеваемость всех учеников за определенный семестр */
select mark, semester, title, s.person.name, s.person.surname
from Marks, Student s, Subject
where Marks.id_subject = Subject.id_subject and
Marks.id_student = s.id_student and
Marks.semester = 1;

/* успеваемость определенного ученика за определенный семестр */
select mark, semester, title, s.person.name, s.person.surname
from Marks, Student s, Subject
where Marks.id_subject = Subject.id_subject and
Marks.id_student = s.id_student and
Marks.semester = 1 and s.person.surname = 'Petrov';

/* успеваемость определенного ученика из определенного класса за заданный семестр */
select mark, semester, title, s.person.name, s.person.surname,
class_number, class_character
from Marks, Student s, Subject, Class
where Marks.id_subject = Subject.id_subject and
Marks.id_student = s.id_student and
s.id_class = Class.id_class and
Marks.semester = 1 and s.person.name = 'Petrov' and
Class.class_number = 7 and Class.class_character = 'А';

/* успеваемость всех учеников определенного класса за заданный семестр */
select mark, semester, title, s.person.name, s.person.surname,
class_number, class_character
from Marks, Student s, Subject, Class
where Marks.id_subject = Subject.id_subject and
Marks.id_student = s.id_student and
s.id_class = Class.id_class and
Marks.semester = 1 and
Class.class_number = 7 and Class.class_character = 'А';

/* ---------- Все прогулы ------------ */
select date_truancy, reason, title, s.person.name, s.person.surname,
class_number, class_character
from Truancy, Subject, Student s, Class
where Truancy.id_subject = Subject.id_subject and
Truancy.id_student = s.id_student and s.id_class = Class.id_class;

/* прогулы определенного ученика из заданного класса */
select date_truancy, reason, title, s.person.name, s.person.surname,
class_number, class_character
from Truancy, Subject, Student s, Class
where Truancy.id_subject = Subject.id_subject and
Truancy.id_student = s.id_student and s.id_class = Class.id_class and
s.person.surname = 'Dima' and Class.class_number = 7 and
Class.class_character = 'А';

/* информация о всех учениках, пропустивших занятия по неуважительной причине */
select date_truancy, reason, title, s.person.name, s.person.surname,
class_number, class_character
from Truancy, Subject, Student s, Class
where Truancy.id_subject = Subject.id_subject and
Truancy.id_student = s.id_student and s.id_class = Class.id_class and
Truancy.reason = 'Прогул';

/* информация об учениках определенного класса, пропустивших занятия по неуважительной причине */
select date_truancy, reason, title, s.person.name, s.person.surname,
class_number, class_character
from Truancy, Subject, Student s, Class
where Truancy.id_subject = Subject.id_subject and
Truancy.id_student = s.id_student and s.id_class = Class.id_class and
s.person.surname = 'Dima' and Class.class_number = 7 and
Class.class_character = 'А' and
Truancy.reason = 'Прогул';

/* прогулы определенного ученика из зданного класса по заданному предмету */
select date_truancy, reason, title, s.person.name, s.person.surname,
class_number, class_character
from Truancy, Subject, Student s, Class
where Truancy.id_subject = Subject.id_subject and
Truancy.id_student = s.id_student and s.id_class = Class.id_class and
s.person.surname = 'Dima' and
Class.class_number = 7 and Class.class_character = 'А' and
Subject.title = 'Математика' and
Truancy.reason = 'Прогул';

/* ----------- Рассписание на неделю для заданного класса ---------- */
select day_name, classroom_number, title, start_lesson, end_lesson,
class_number, class_character, t.person.name, t.person.surname
from Classroom, WeekDay, LessonTime, Subject, Class, Teacher t, Schedule
where Schedule.id_classroom = Classroom.id_classroom and
Schedule.id_day = WeekDay.id_day and
Schedule.lesson_number = LessonTime.lesson_number and
Schedule.id_subject = Subject.id_subject and
Schedule.id_class = Class.id_class and
Schedule.id_teacher = t.id_teacher and
Class.class_number = 7 and Class.class_character = 'А';

/* ----------- Информация об учителе ---------- */
select t.person.name, t.person.surname, street,
city, state
from Teacher t, Address
where t.id_address = Address.id_address;

/* ------------ Рассписание для учителя -------------- */
select day_name, classroom_number, title, start_lesson, end_lesson,
class_number, class_character, t.person.name, t.person.surname
from Classroom, WeekDay, LessonTime, Subject, Class, Teacher t, Schedule
where Schedule.id_classroom = Classroom.id_classroom and
Schedule.id_day = WeekDay.id_day and
Schedule.lesson_number = LessonTime.lesson_number and
Schedule.id_subject = Subject.id_subject and
Schedule.id_class = Class.id_class and
Schedule.id_teacher = t.id_teacher and
t.person.surname = 'Alexander';