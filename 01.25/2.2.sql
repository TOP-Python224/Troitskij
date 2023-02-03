use academy;
-- 1
select d.`name` as 'Department Name',
	   count(distinct t.`id`) as 'Number of teachers'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
join `groups_lectures` as gl
	on gl.`lecture_id` = l.`id`
join `groups` as g
	on g.`id` = gl.`group_id`
join `departments` as d
	on d.`id` = g.`department_id`
    where d.`name` = 'Control Systems and Robotics';
    
-- 2
select concat(t.`name`, ' ', t.`surname`),
	   count(l.`id`) as 'Number of Lectures'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
    where t.`name` = 'Nasim' and t.surname = 'Carr';
    
-- 3
select l.`date` as 'Date of lecture',
	   count(l.`id`) as 'Qtt of lectures'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
    where l.`date` = '2022-09-15'
    order by t.`id`;

-- 4
select d.`building` as 'Building',
	   count(l.`id`) as 'Lecture ID'
from `departments` as d
join `groups` as g
	on d.`id` = g.`department_id`
join `groups_lectures` as gl
	on gl.`group_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
group by `Building`
order by `Building`;

-- 5
select concat(t.`name`, ' ', t.`surname`) as 'Teacher Name',
	   count(distinct s.`id`) as 'Qtt of Students'
from `students` as s
join `groups_students` as gs
	on s.`id` = gs.`student_id`
join `groups` as g
	on g.`id` = gs.`group_id`
join `groups_lectures` as gl
	on gl.`group_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
join `teachers` as t
	on t.`id` = l.`teacher_id`
where t.name = 'Jessamine' and t.surname = 'Sullivan';

-- 6
select f.`name` as 'Faculty Name',
       avg(t.`salary`) as 'AWG Salary'
from `faculties` as f
join `departments` as d
	on f.`id` = d.`faculty_id`
join `groups` as g
	on g.`department_id` = d.`id`
join `groups_lectures` as gl
	on gl.`group_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
join `teachers` as t
	on t.`id` = l.`teacher_id`
where f.`name` = 'School of Computer Technologies and Control';

-- 7
select max(counter.`Number of students`) as 'MAX',
	   min(counter.`Number of students`) as 'MIN'
from(select count(s.`id`) as 'Number of Students'
from `groups` as g
join `groups_students` as gs
	on g.`id` = gs.`group_id`
join `students` as s
	on s.`id` = gs.`student_id`
group by g.`name`
order by g.`id`) as counter;

-- 8 
select avg(d.`financing`) as 'AWG financing'
from `departments` as d;

-- 9 вроде с дистинктом правильнее будет, но у всех почти одинаковое количество получается
select concat(t.`name`,' ', t.`surname`) as 'Teacher Name',
	   count(distinct s.`id`) as 'Qtt of Subjects'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
join `subjects` as s
	on s.`id` = l.`subject_id`
group by `Teacher Name`;

-- 10
select l.`date` as 'Lecture Date',
       count(l.`id`) as 'Count of Lectures'
from `lectures` as l
join `subjects` as s
	on s.`id` = l.`subject_id`
group by l.`date`
order by l.`date`;

-- 11
select d.`building` as 'Building',
	   count(f.`id`) as 'Qtt of Faculty in Building'
from `departments` as d
join `faculties` as f
	on f.`id` = d.`faculty_id`
group by d.`building`;

-- 12
select f.`name` as 'Faculty Name',
	   count(s.`id`) as 'Qtt of Subjects'
from `faculties` as f
join `departments` as d
	on f.`id` = d.`faculty_id`
join `groups` as g
	on g.`department_id` = d.`id`
join `groups_lectures` as gl
	on gl.`group_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
join `subjects` as s
	on s.`id` = l.`subject_id`
group by `Faculty Name`;

-- 13
select concat(t.`name`, ' ', t.`surname`, ' - ', d.`building`, ' bldng') as 'Teacher Name',
       count(s.`name`) as 'Lectures Qtt'
from `subjects` as s
join `lectures` as l
	on s.`id` = l.`subject_id`
join `teachers` as t
	on t.`id` = l.`teacher_id`
join `groups_lectures` as gl
	on gl.`lecture_id` = l.`id`
join `groups` as g
	on g.`id` = gl.`group_id`
join `departments` as d
	on d.`id` = g.`department_id`
group by `Teacher Name`
order by `Lectures Qtt`;