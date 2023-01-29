-- 1
use academy;

select `groups`.`name` as `group name`,
	concat(`teachers`.`name`, ' ', `teachers`.`surname`) as 'Teacher name'
from `groups`
join `teachers`
on `groups`.`id` = `teachers`.`id`;

-- 2 (Тут не уверен, либо финансирование всех кафедр превышает факультет, либо я не понял задания)
select departments.name as 'Название кафедры',
		round(departments.financing/1000000, 1),
        faculties.name as 'Название факультета',
        round(faculties.financing/1000000, 1)
from `departments`
join `faculties`
	where `faculties`.`financing` > `departments`.`financing`;
    
-- 3
select concat(c.`name`, ' ', c.`surname`) as 'Curator Full Name',
	   g.`name` as 'Group'
from `curators` as c
join `groups_curators` as gc
	on c.`id` = gc.`curator_id`
join `groups` as g
	on g.`id` = gc.`group_id`
order by c.`name`;

-- 4
select g.name as 'Group Name',
	   concat(t.`name`, ' ',t.`surname`) as 'Teacher'
from `groups` as g
join `groups_lectures` as gl
	on g.`id` = gl.`group_id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
join `teachers` as t
	on t.`id` = l.`teacher_id`
    where g.`name` = 'JW-014';

-- 5
select t.`surname` as 'Surname',
	   f.`name` as 'Faculty Name'
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
	on t.`id` = l.`teacher_id`;
    
-- 6
select d.`id` as 'Department ID',
	   d.`name` as 'Department Name',
       g.`department_id` as 'Group ID',
       g.`name` as 'Group Name'
from `departments` as d
join `groups` as g
	on d.`id` = g.`department_id`
order by d.`id`;

-- 7
select distinct concat(t.`name`, ' ', t.`surname`) as 'Teacher Name',
	   s.`name` as 'Subject Name'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
join `subjects` as s
	on s.`id` = l.`subject_id`
    where t.`name` = 'Stewart' and t.`surname` = 'Richards'
order by s.name;

-- 8
select distinct d.id as 'Department ID',
	   d.name as 'Department Name',
	   s.name as 'Subject Name'
from `departments` as d
join `groups` as g
	on d.`id` = g.`department_id`
join `groups_lectures` as gl
	on gl.`lecture_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
join `subjects` as s
	on s.`id` = l.`subject_id`
order by s.`name`;

-- 9
select g.`id` as ' Group ID',
	   g.`name` as 'Group Name',
       f.`id` as 'Faculty ID',
       f.`name` as 'Faculty Name'
from `groups` as g
join `departments` as d
	on g.`department_id` = d.`id`
join `faculties` as f
	on f.`id` = d.`faculty_id`
    where f.`name` = 'Higher School of Engineering and Technology';
    
-- 10
select g.`year` as 'Group Year',
	   g.`name` as 'Group Name',
       f.`name` as 'Faculty Name'
from `groups` as g
join `departments` as d
	on g.`department_id` = d.`id`
join `faculties` as f
	on f.`id` = d.`faculty_id`
    where g.`year` = 5;
    
-- 11(вместо аудитории отсортировал по дате лекции '2022-09-25')
select concat(t.`name`, ' ', t.`surname`) as 'Teacher Name',
	   s.`name` as 'Subject Name',
       g.`name` as 'Group Name',
       l.`date` as 'Lecture Date'
from `teachers` as t
join `lectures` as l
	on t.`id` = l.`teacher_id`
join `subjects` as s
	on s.`id` = l.`subject_id`
join `groups_lectures` as gl
	on gl.`lecture_id` = l.`id`
join `groups` as g
	on g.`id` = gl.`group_id`
    where l.date = '2022-09-25';