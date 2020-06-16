# Create Table
```
CREATE TABLE users (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(50),
	password VARCHAR(50),
	role VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME     
);

CREATE TABLE categories(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME 
);


CREATE TABLE photos(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100),
	category_id INT,
	image VARCHAR(100),
	created_at DATETIME,
	updated_at DATETIME,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE tags(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME 
);


CREATE TABLE taggale(
	tag_id int,
	photo_id int,
	created_at DATETIME,
	updated_at DATETIME,
	FOREIGN KEY (tag_id) REFERENCES tags(id),
	FOREIGN KEY (photo_id) REFERENCES photos(id),
  	PRIMARY KEY (tag_id,photo_id)
);


CREATE TABLE photo_descriptions(
	id int NOT NULL,
	content VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME,
	FOREIGN KEY (id) REFERENCES photos(id),
	PRIMARY KEY (id)
);
```

# INSERT DATA

'''
INSERT INTO users (email,password,role)
VALUES ('dung@gmail.com','123','users'),
	   ('admin','admin','admin');
       
INSERT INTO categories (name)
VALUES ('romantic'),
	   ('sad');
       
INSERT INTO photos (title,category_id,image)
VALUES ('Love you',1,'abc.jpg'),
	   ('To day is a sad day',2,'xyz.jpg');
       
INSERT INTO tags (name)
VALUES ('Lonely'),
	   ('Funnuy'),
	   ('Scary'),
	   ('Dirty');
       
INSERT INTO taggale (tag_id,photo_id)
VALUES (1,1), 
	   (2,1),
       (1,2),
       (2,2),
       (3,1);
       
INSERT INTO photo_descriptions (id,content)
VALUES (1,'That is a normal day');
'''

# QUERY

'''
    select p.title, c.name ,(select pd.content from photo_descriptions as pd where pd.id = p.id) as  descriptions 
    ,(select group_concat(t.name) from tags as t, taggale as tg where tg.tag_id = t.id and tg.photo_id = p.id  ) as  tags 
    from photos as p , categories as c where p.category_id = c.id ;
'''
