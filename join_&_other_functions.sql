insert into repair(resp_person, id_mus)
values ('vorobyev', 1);
insert into repair(resp_person, id_mus)
values ('berezin', 2);
insert into repair(resp_person, id_mus)
values ('kozyrev', 3);

select *
from repair;

update repair
set id_mus = 3
where repair.resp_person = 'vorobyev';

alter table if exists repair
    drop constraint repair_id_mus_fkey;

alter table if exists repair
    drop column resp_person;

drop table repair;


--ex1
--full_outer(right)
select s.last_name, ex.id
from staff s
         full outer join excursions ex on s.id = ex.id_rab;

--left
select p.title, s.last_name
from posts p
         left join staff s on s.id_post = p.id;

--inner
select exh.date_begin_ex date_begin_ex, exh.date_end_ex date_end_ex, m.name_of_museum
from exhibition exh
         inner join museum m on exh.id_mus = m.id;
--ex2
--multiple join
select e.id id, e.duration duration, s.salary salary, e.id_rab id_rab, e.id_room id_room
from excursions e
         join staff s on e.id_rab = s.id
         join posts p on p.id = s.id_post
where p.title = 'guide'
  and e.duration > '02:00:00';



-- select p.id, sum(s.salary)
-- from staff s
--          join posts p on p.id = s.id_post
-- group by p.id;

--ex3
select p.title, count(*)
from staff s
         join posts p on p.id = s.id_post
     --join excursions ex on s.id = ex.id_rab
where s.salary > 2
--  and ex.duration > '02:40:00'
group by p.title
having count(*) > 1;



create procedure add_staff(l_name varchar(25), salary int, staff_name varchar(25))
as
$$
declare
    id_posts int;
begin
    select id
    into id_posts
    from posts p
    where p.title = staff_name;
    insert into staff (last_name, salary, id_post)
    values (l_name, salary, id_posts);
end;
$$ language plpgsql;

--id -> staff_name
select *
from staff_id_seq;

call add_staff('dorn1', 12, 150, 'guide');

create function show_all_ex(name_mus varchar)
    returns table
            (
                ex_id         int,
                ex_id_mus     int,
                ex_date_begin date,
                ex_date_end   date
            )
as
$$
begin
    return query
        select ex.id, ex.id_mus, ex.date_begin_ex, ex.date_end_ex
        from exhibition ex
                 join museum m on ex.id_mus = m.id
        where m.name_of_museum = name_mus;
end;
$$ language plpgsql;

select *
from show_all_ex('skinder');
