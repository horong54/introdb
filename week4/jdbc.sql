DROP TABLE IF EXISTS line_memo;
CREATE TABLE line_memo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64),
	msg VARCHAR(255),
	msg_time TIMESTAMP
);

INSERT INTO line_memo(name, msg) VALUES('정호영', '여러분 오래 사세요.');
INSERT INTO line_memo(name, msg) VALUES('시몬', '드릴은 사랑입니다.');
INSERT INTO line_memo(name, msg) VALUES('김용', '옆집에 사람이 산다.');
