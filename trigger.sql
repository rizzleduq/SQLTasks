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
