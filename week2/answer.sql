SELECT id, name, money 
	FROM auction_user
	WHERE money >= 1000 AND money <= 1200;

SELECT id, name, money 
	FROM auction_user
	WHERE money BETWEEN 1000 AND 1200;

SELECT grade FROM auction_user;

SELECT DISTINCT grade FROM auction_user;

SELECT DISTINCT grade FROM auction_user ORDER BY grade;

SELECT * FROM auction_user WHERE name LIKE '김%';

SELECT * FROM auction_user WHERE name LIKE '김__';

SELECT grade, count(*) AS num_people FROM auction_user WHERE grade='B';
SELECT grade, count(*) AS num_people FROM auction_user WHERE grade='S';
SELECT grade, count(*) AS num_people FROM auction_user WHERE grade='G';
SELECT grade, count(*) AS num_people FROM auction_user WHERE grade='P';
SELECT grade, count(*) AS num_people FROM auction_user WHERE grade='D';

SELECT grade, count(*) AS num_people FROM auction_user GROUP BY grade;


