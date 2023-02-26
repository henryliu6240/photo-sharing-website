CREATE DATABASE IF NOT EXISTS photoshare;
USE photoshare;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Friends CASCADE;
DROP TABLE IF EXISTS Albums CASCADE;
DROP TABLE IF EXISTS Tags CASCADE;
DROP TABLE IF EXISTS Photos CASCADE;
DROP TABLE IF EXISTS Tagged CASCADE;
DROP TABLE IF EXISTS Comments CASCADE;
DROP TABLE IF EXISTS Likes CASCADE;

CREATE TABLE Users(
 user_id INTEGER AUTO_INCREMENT,
 fname VARCHAR(100),
 lname VARCHAR(100),
 email VARCHAR(100),
 DOB DATE,
 hometown VARCHAR(100),
 gender VARCHAR(100),
 password VARCHAR(100) NOT NULL,
 PRIMARY KEY (user_id)
 );

 CREATE TABLE Friends(
 user_id1 INTEGER,
 user_id2 INTEGER,
 PRIMARY KEY (user_id1, user_id2),
 FOREIGN KEY (user_id1)
 REFERENCES Users(user_id),
 FOREIGN KEY (user_id2)
 REFERENCES Users(user_id)
);

CREATE TABLE Albums(
 albums_id INTEGER AUTO_INCREMENT,
 name VARCHAR(100),
 date DATE,
 user_id INTEGER NOT NULL,
 PRIMARY KEY (albums_id),
 FOREIGN KEY (user_id)
 REFERENCES Users(user_id)
);

CREATE TABLE Tags(
 tag_id INTEGER AUTO_INCREMENT,
 name VARCHAR(100),
 PRIMARY KEY (tag_id)
);

CREATE TABLE Photos(
 photo_id INTEGER AUTO_INCREMENT,
 caption VARCHAR(100),
 imgdata LONGBLOB,
 albums_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
 PRIMARY KEY (photo_id),
 FOREIGN KEY (albums_id) REFERENCES Albums (albums_id),
FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
DROP Table Photos


CREATE TABLE Tagged(
 photo_id INTEGER,
 tag_id INTEGER,
 PRIMARY KEY (photo_id, tag_id),
 FOREIGN KEY(photo_id)
 REFERENCES Photos (photo_id),
 FOREIGN KEY(tag_id)
 REFERENCES Tags (tag_id)
);


DROP TABLE Tagged
DROP TABLE Comments
DROP TABLE Likes
CREATE TABLE Comments(
 comment_id INTEGER AUTO_INCREMENT,
 user_id INTEGER NOT NULL,
 photo_id INTEGER NOT NULL,
 text VARCHAR (100),
 date DATE,
 PRIMARY KEY (comment_id),
 FOREIGN KEY (user_id)
 REFERENCES Users (user_id),
 FOREIGN KEY (photo_id)
 REFERENCES Photos (photo_id)
);

CREATE TABLE Likes(
 photo_id INTEGER,
 user_id INTEGER,
 PRIMARY KEY (photo_id,user_id),
 FOREIGN KEY (photo_id)
 REFERENCES Photos (photo_id),
 FOREIGN KEY (user_id)
 REFERENCES Users (user_id)
);

CREATE TABLE Friends (
	user_id1 INTEGER,
	user_id2 INTEGER,
	PRIMARY KEY (user_id1, user_id2),
	FOREIGN KEY (user_id1) REFERENCES User(user_id),
	FOREIGN KEY (user_id2) REFERENCES User(user_id)
	);

SELECT * FROM Users;

INSERT INTO Friends (user_id1, user_id2) VALUES (1,2);
SELECT * FROM Friends;
SELECT Count(*) counter, F2.user_id2, U3.email
FROM Users U1, Users U2, Users U3, Friends F1, Friends F2
WHERE U1.user_id = 2 AND F1.user_id1 = 2 AND U2.user_id = F1.user_id2 AND U2.user_id = F2.user_id1 AND U3.user_id = F2.user_id2 AND 2 <> F2.user_id2
GROUP BY F2.user_id2
ORDER BY counter DESC

INSERT INTO Albums (name, date, user_id) VALUES ('a', '01-01-1999', 1) SET @LASTID = @@IDENTITY

SELECT * FROM Albums

SELECT A.name FROM Albums A WHERE A.user_id = 2

SELECT * FROM Photos