SELECT VERSION();

create database dot_sql;

drop table if exists posts;
create table posts 
(
  message varchar(140),
  likes int
);
desc posts;

INSERT INTO posts
  ( message, likes )
  VALUES
  ('thanks', 12) ;

