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

select * from posts where likes >= 10 and likes <= 20;
-- 上と同じ意味
select * from posts where likes between 10 and 20;
-- 反転
select * from posts where likes not between 10 and 20;

select * from posts where likes = 4 or likes = 9;
-- 上と同じ意味
select * from posts where likes in (4, 9);
-- 反転
select * from posts where likes not in (4, 9);


select * from posts where message Like 't%';
-- 完全一致
select * from posts where message Like binary 't%';
-- 後方一致
select * from posts where message Like binary '%t';
-- 部分一致
select * from posts where message Like  '%g%';

-- ３文字目が'a'
select * from posts where message Like  '__a%';
-- '%'文字を含む文字列
select * from posts where message Like  '%\%%';

-- nullのレコード抽出
select * from posts where likes is null;
select * from posts where likes is not null;

-- 20. 抽出結果の並べ替え
select * from posts order by likes desc, message limit 2 offset 1;

-- 21. 数値の関数
select
	likes * 500 / 3 as bounus,
	FLOOR(likes * 500 / 3) as floor,
	CEIL(likes * 500 / 3) as ceil,
	ROUND(likes * 500 / 3, 2) as round
from
	posts;

-- » #22 文字列の関数を見ていこう
select message, SUBSTRING(message, 3) from posts;
select message, CONCAT(message, likes) from posts;
-- バイト単位
select message, LENGTH(message) from posts;
-- 日本語の場合
select message, char_length(message) from posts;