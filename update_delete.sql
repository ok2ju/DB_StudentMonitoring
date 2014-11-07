update Marks
set mark = mark + 1
where mark < 9;

update Classroom
set classroom_number = 210
where classroom_number = 200;

delete from WeekDay
where day_name = 'Воскресенье';