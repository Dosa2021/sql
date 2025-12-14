SELECT VERSION();

-- テーブル作成
create database dot_sql;

drop table if exists posts;
CREATE TABLE posts 
(
  -- id INT NOT NULL ,
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  -- likes INT UNSIGNED NOT NULL,
  -- likes INT UNSIGNED DEFAULT 0,
  likes INT UNSIGNED CHECK (likes >= 0 AND likes <= 100),
  mood DECIMAL(4, 2) UNSIGNED,
  lang CHAR(2) UNIQUE,
  category ENUM('Gadget', 'Game', 'Business'),
  categories SET('Gadget', 'Game', 'Business'),
  is_draft BOOL,
  created DATETIME,
  PRIMARY KEY (id)
);
desc posts;

INSERT INTO posts
  ( message, likes )
  VALUES
  ('thanks', 12) ;

INSERT INTO posts
  ( message, likes, mood, lang, category, categories, is_draft, created )
  VALUES
  ('thanks', 100, 7.825, 'EN', 'Gadget', 'Gadget,Game', TRUE, '2025-12-08 00:00:00'),
  ('arigato', 4, 4.21, 'JA', 'Gadget', 3, FALSE, '2025-12-08 00:00:00'),
  ('arigato', 4, 4.21, 'HO', 'Gadget', 4, 1, '2025-12-08 00:00:00'),
  ('arigato', 4, 4.21, 'FU', 'Gadget', 5, 0, NOW());

select * from posts;