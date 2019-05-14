drop table if exists posts;
create table posts (
  id integer primary key,
  title text,
  body text
);

insert into posts (title, body) values ('title1','body1');
insert into posts (title, body) values ('title2','body2');
insert into posts (title, body) values ('title3','body3');