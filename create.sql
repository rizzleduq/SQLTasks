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
