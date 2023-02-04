use academy;

-- 1
select d.`building` as 'Building'
from `departments` as d
group by d.`building`
having sum(d.`financing`) > 12000000;

-- 2
select g.`year` as 'Group Year',
       g.`name` as 'Group Name',
       d.`name` as 'Department Name',
       count(l.`date`) as 'Qtt of Lectures at 1st week'
from `faculties` as f
join `departments` as d
	on f.`id` = d.`faculty_id`
join `groups` as g
	on g.`department_id` = d.`id`
join `groups_lectures` as gl
	on gl.`group_id` = g.`id`
join `lectures` as l
	on l.`id` = gl.`lecture_id`
where g.`year` = 5 and l.`date` < '2022-09-08' and d.`name` = 'Software Engineering and Computer Systems'
group by g.`name`
having count(l.`date`) > 20
order by g.`name`;

-- 3 не доделал
select *
from (select g.`name` as 'Group Name',
	  avg(s.`rating`) as 'AVG Student Rating'
	  from `groups` as g
	  join `groups_students` as gs
		on g.`id` = gs.`group_id`
	  join `students` as s
			on s.`id` = gs.`student_id`
	group by `Group Name`
	order by `AVG Student Rating` desc) as `rt`
where `AVG Student Rating` > (select `AVG Student Rating` from `rt` where `Group Name` = 'YA-027');

-- 4
select t.`name` as 'Teacher Name',
	   t.`surname` as 'Teacher Surname'
from `teachers` as t
where t.`salary` > (select avg(t.`salary`) from `teachers` as t where t.`is_professor` = 1);

-- 5
select g.`name` as 'Group Name'
from `groups` as g
join `groups_curators` as gc
	on g.`id` = gc.`group_id`
join `curators` as c
	on c.`id` = gc.`curator_id`
group by `Group Name`
having count(c.`id`) > 1;

-- 6
select g.`name` as 'Group Name'
from `groups` as g
join `groups_students` as gs
	on g.`id` = gs.`group_id`
join `students` as s
	on s.`id` = gs.`student_id`
group by g.`name`
having avg(s.`rating`) < (select avg(s.`rating`) as 'Group Rating'
						  from `groups` as g
                          join `groups_students` as gs
							on g.`id` = gs.`group_id`
						  join `students` as s
							on s.`id` = gs.`student_id`
						  where g.`year` = 5
                          group by g.`name`
                          limit 1);
						
-- 7
select f.`name` as 'Faculty Name',
	   sum(d.`financing`) as 'Department Financing'
from `faculties` as f
join `departments` as d
	on d.`faculty_id` = f.`id`
group by f.`name`
having sum(d.`financing`) > (select sum(d.`financing`)
						   from `faculties` as f
                           join `departments` as d
							on d.`faculty_id` = f.`id`
						   where f.`name` = 'School of Physics and Engineering'
                           group by f.`name`);

-- 8 не сделал, наброски были как в 3 задании


-- 9
select count(l.`id`) as 'MIN Lectures',
	   s.name as 'Subject Name'
from `subjects` as s
join `lectures` as l
	on l.`subject_id` = s.`id`
group by s.`name`
order by count(l.`id`)
limit 1;

-- 10
select count(distinct s.`name`) as 'Qtt of Students',
	   count(distinct l.`subject_id`) as 'Qtt of Lectures'
    from `departments` as d
    join `groups` as g
		on g.`department_id` = d.`id`
    join `groups_lectures` as gl
		on gl.`group_id` = g.`id`
    join `lectures` as l
		on l.`id` = gl.`lecture_id`
	join `groups_students` as gs
		on gs.`group_id` = g.`id`
	join `students` as s
		on s.`id` = gs.`student_id`
   where d.`name` = 'Composite AI';
