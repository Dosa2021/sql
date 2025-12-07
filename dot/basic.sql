SELECT VERSION();

-- テーブル作成
create database dot_sql;

drop table if exists posts;
CREATE TABLE posts 
(
  message VARCHAR(140),
  likes INT UNSIGNED,
  mood DECIMAL(4, 2) UNSIGNED,
  lang CHAR(2),
  category ENUM('Gadget', 'Game', 'Business'),
  categories SET('Gadget', 'Game', 'Business')
);
desc posts;

INSERT INTO posts
  ( message, likes )
  VALUES
  ('thanks', 12) ;

INSERT INTO posts
  ( message, likes, mood, lang, category, categories )
  VALUES
  ('thanks', 12, 7.825, 'EN', 'Gadget', 'Gadget,Game'),
  ('arigato', 4, 4.21, 'JA', 'Gadget', 3);
  ('arigato', 4, 4.21, 'JA', 'Gadget', 4);
  ('arigato', 4, 4.21, 'JA', 'Gadget', 5);

