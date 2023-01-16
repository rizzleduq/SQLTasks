create table museum
(
    id               serial,
    name_of_museum   varchar not null,
    amount_of_rooms  integer not null,
    amount_of_floors integer not null,
    primary key (id)
);

create table exhibition
(
    id            serial,
    id_mus        integer not null,
    date_begin_ex date    not null,
    date_end_ex   date    not null,
    primary key (id),
    foreign key (id_mus) references museum (id),
    unique (id_mus, date_begin_ex)
);

create table rooms
(
    id             serial,
    id_mus         integer,
    num_of_room    integer not null,
    amount_of_pers integer not null,
    capacity       integer not null,
    primary key (id),
    unique (id_mus, num_of_room),
    foreign key (id_mus) references museum (id)
);


create table posts
(
    id    serial,
    title varchar(30),
    primary key (id)
);


create table staff
(
    id        serial,
    last_name varchar(25) not null,
    salary    integer     not null,
    id_post   integer,
    primary key (id),
    foreign key (id_post) references posts (id)
);

create table excursions
(
    id       serial,
    duration time    not null,
    price    integer not null,
    id_rab   integer not null,
    id_room  integer not null,
    primary key (id),
    foreign key (id_rab) references staff (id),
    foreign key (id_room) references rooms (id)
);

insert into posts (title)
values ('guide');
insert into posts (title)
values ('resotrer');
insert into posts (title)
values ('artist');
insert into posts (title)
values ('warden');
insert into posts (title)
values ('guard');
insert into posts (title)
values ('guide1');


insert into staff (last_name, salary, id_post)
values ('kilmurry', 23, 1);
insert into staff (last_name, salary, id_post)
values ('bromley', 48, 1);
insert into staff (last_name, salary, id_post)
values ('perotti', 94, 1);
insert into staff (last_name, salary, id_post)
values ('littledyke', 66, 3);
insert into staff (last_name, salary, id_post)
values ('turrill', 28, 3);
insert into staff (last_name, salary, id_post)
values ('batrip', 2, 4);
insert into staff (last_name, salary, id_post)
values ('mollitt', 2, 4);
insert into staff (last_name, salary, id_post)
values ('ekless', 99, 1);
insert into staff (last_name, salary, id_post)
values ('ekless2', 99, 1);
insert into staff (last_name, salary, id_post)
values ('perotti', 94, 1);


insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('photolist', 10, 2);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('snaptags', 5, 3);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('trilith', 4, 3);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('zoonder', 5, 4);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('blognation', 3, 3);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('skinte', 20, 2);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('skinder', 10, 1);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('trilia', 6, 4);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('trilia2', 2, 6);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('africa', 3, 3);
insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('zone', 2, 1);

insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (1, '4/2/2020', '26/12/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (2, '31/5/2020', '19/8/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (3, '7/2/2020', '24/5/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (4, '8/1/2020', '23/5/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (5, '3/5/2020', '9/6/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (6, '25/11/2020', '7/10/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (7, '11/3/2020', '23/11/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (7, '11/2/2020', '23/11/2021');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (8, '18/6/2020', '19/10/2020');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (8, '18/1/2021', '19/4/2021');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (8, '18/2/2021', '19/3/2021');
insert into exhibition (id_mus, date_begin_ex, date_end_ex)
values (2, '18/1/2020', '19/1/2020');


insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (1, 10, 10, 5);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (2, 11, 10, 48);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (3, 12, 5, 12);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (4, 13, 9, 11);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (5, 14, 5, 24);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (6, 15, 3, 33);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (7, 16, 3, 17);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (8, 17, 8, 58);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (9, 17, 8, 58);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (10, 17, 8, 59);
insert into rooms (id_mus, num_of_room, amount_of_pers, capacity)
values (11, 16, 7, 60);



insert into excursions (duration, price, id_rab, id_room)
values ('12:33 am', 61, 1, 1);
insert into excursions (duration, price, id_rab, id_room)
values ('3:13 pm', 55, 2, 2);
insert into excursions (duration, price, id_rab, id_room)
values ('7:16 pm', 12, 3, 3);
insert into excursions (duration, price, id_rab, id_room)
values ('7:26 am', 23, 4, 4);
insert into excursions (duration, price, id_rab, id_room)
values ('2:13 am', 99, 5, 5);
insert into excursions (duration, price, id_rab, id_room)
values ('3:08 am', 96, 6, 6);
insert into excursions (duration, price, id_rab, id_room)
values ('7:50 pm', 91, 7, 7);
insert into excursions (duration, price, id_rab, id_room)
values ('1:29 am', 45, 8, 8);



create table repair
(
);

alter table if exists repair
    add column id int;

alter table if exists repair
    add column resp_person varchar(30);

alter table if exists repair
    add column id_mus int;

create sequence if not exists public.repair_id_seq
    increment 1
    start 1
    minvalue 1
    maxvalue 2147483647
    cache 1;

alter table repair
    alter column id
        set default nextval('repair_id_seq');

alter table if exists repair
    add constraint repair_pkey primary key (id);

alter table if exists repair
    add constraint repair_id_mus_fkey
        foreign key (id_mus) references museum (id);

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



create or replace function tr_new_post()
    returns trigger as
$$
declare
    name_post varchar(25);
begin

    if new.title in (select title from posts where title = new.title)
    then
        raise exception 'u cannot do that, cuz this post already exists';
    end if;
    return new;
end;

$$ language plpgsql;

create trigger trigger_new_post
    before insert
    on posts
    for each row
execute procedure tr_new_post();



select m.id, m.name_of_museum, count(e.id) as ex_count
from museum m
         left join exhibition e on m.id = e.id_mus
group by m.id;

select m1.name_of_museum, m1.ex_count as left_count, m2.ex_count as right_count, m2.name_of_museum
from (select m.id, m.name_of_museum, count(e.id) as ex_count
      from museum m
               left join exhibition e on m.id = e.id_mus
      group by m.id) as m1
         left join (select m.id, m.name_of_museum, count(e.id) as ex_count
                    from museum m
                             left join exhibition e on m.id = e.id_mus
                    group by m.id) as m2
                   on m1.ex_count < m2.ex_count;

with rating as (
    select LT.left_count, count(distinct LT.right_count) as rating
    from (select m1.name_of_museum, m1.ex_count as left_count, m2.ex_count as right_count, m2.name_of_museum
          from (select m.id, m.name_of_museum, count(e.id) as ex_count
                from museum m
                         left join exhibition e on m.id = e.id_mus
                group by m.id) as m1
                   left join (select m.id, m.name_of_museum, count(e.id) as ex_count
                              from museum m
                                       left join exhibition e on m.id = e.id_mus
                              group by m.id) as m2
                             on m1.ex_count < m2.ex_count) as LT
    group by LT.left_count)
   , exhibition_count as (
    select m.id, m.name_of_museum, count(e.id) as ex_count
    from museum m
             left join exhibition e on m.id = e.id_mus
    group by m.id)
select id, left_count as ex_count, rating + 1 as rank
from exhibition_count e
         left join rating r
                   on e.ex_count = r.left_count
order by rank;

with ex_count as (
    select distinct m.id, m.name_of_museum, count(*) over (partition by m.id) as count
    from museum m
    join exhibition e on m.id = e.id_mus)
select e.id,e.count,dense_rank() over (order by e.count desc) as rank
from ex_count as e
order by rank;

create or replace function audit_trigger_function()
    returns trigger
    language plpgsql
as
$body$
declare
    app_user   text;
    app_source text;
    cur_time   timestamp;
begin
    cur_time := now();
    if (tg_op = 'UPDATE' and (coalesce(new.aud_who_create, 'empty') != coalesce(old.aud_who_create, 'empty') or
                              coalesce(new.aud_when_create, cur_time) != coalesce(old.aud_when_create, cur_time) or
                              coalesce(new.aud_source_create, 'empty') != coalesce(old.aud_source_create, 'empty') or
                              coalesce(new.aud_who, 'empty') != coalesce(old.aud_who, 'empty') or
                              coalesce(new.aud_when, cur_time) != coalesce(old.aud_when, cur_time) or
                              coalesce(new.aud_source, 'empty') != coalesce(old.aud_source, 'empty')) or
        tg_op = 'INSERT' and
        (new.aud_who_create is not null or new.aud_when_create is not null or new.aud_source_create is not null or
         new.aud_who is not null or new.aud_when is not null or new.aud_source is not null))
    then
        raise exception 'audit columns not editable';
    end if;

    perform set_config('aud.when'::text, to_char(cur_time, 'yyyy-mm-dd hh24:mi:ss:ms'), true);

    begin
        select current_setting('app.user') into app_user;
        if (app_user = 'unknown')
        then
            app_user := current_user;
        end if;
    exception
        when others then
            app_user := current_user;
    end;

    begin
        select current_setting('app.source') into app_source;
    exception
        when others then app_source := 'db';
    end;

    new.aud_when := cur_time;
    new.aud_who := app_user;
    new.aud_source := app_source;

    if (tg_op = 'INSERT')
    then
        new.aud_when_create := new.aud_when;
        new.aud_who_create := new.aud_who;
        new.aud_source_create := new.aud_source;
    end if;
    return new;
end
$body$;

create trigger audit_trigger
    before insert or update
    on museum
    for each row
execute function audit_trigger_function();

alter table museum add column aud_who_create varchar;
alter table museum add column aud_when_create timestamp(6);
alter table museum add column aud_source_create varchar;

alter table museum add column aud_who varchar;
alter table museum add column aud_when timestamp(6);
alter table museum add column aud_source varchar;

insert into museum (name_of_museum, amount_of_rooms, amount_of_floors)
values ('Museum_for_Audit', 5, 4);

update museum set amount_of_floors=12 where id=15;


alter table museum drop column aud_who_create restrict;
alter table museum drop column aud_when_create restrict;
alter table museum drop column aud_source_create restrict;

alter table museum drop column aud_who restrict;
alter table museum drop column aud_when restrict;
alter table museum drop column aud_source restrict;

