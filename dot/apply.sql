-- 08 サブクエリを使ってみよう
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  likes INT,
  area VARCHAR(20),
  PRIMARY KEY (id)
);
INSERT INTO posts (message, likes, area) VALUES
  ('post-1', 12, 'Tokyo'),
  ('post-2', 8, 'Fukuoka'),
  ('post-3', 11, 'Tokyo'),
  ('post-4', 3, 'Osaka'),
  ('post-5', 8, 'Tokyo'),
  ('post-6', 9, 'Osaka'),
  ('post-7', 4, 'Tokyo'),
  ('post-8', 10, 'Osaka'),
  ('post-9', 31, 'Fukuoka');

-- 以下の結果の横に likesの平均を表示したい
SELECT
	*
FROM
	posts;

-- 以下では、期待値にならない
SELECT
	*,
	AVG(likes)
FROM
	posts
GROUP BY
	id;

-- これで期待値（サブクエリ）
SELECT
	*,
	(
		SELECT
			AVG(likes)
		FROM
			posts
	) AS AVG
FROM
	posts
GROUP BY
	id;


