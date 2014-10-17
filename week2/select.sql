DROP TABLE IF EXISTS auction_user;
CREATE TABLE auction_user(
	id CHAR(4) PRIMARY KEY,
	name CHAR(8),
	grade CHAR(1),
	money INT
);

