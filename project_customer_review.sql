create table customer_grade(
customer_grade VARCHAR2(10),
bonus_pct NUMBER);

ALTER TABLE customer_grade
ADD CONSTRAINT customer_grade_pk
PRIMARY KEY(customer_grade);

CREATE TABLE customers(
customer_id VARCHAR2(10) ,
phoneno VARCHAR2(10) UNIQUE NOT NULL,
PW VARCHAR2(10)NOT NULL,
birth date,
bonus NUMBER DEFAULT(0),
customer_grade VARCHAR2(10));

ALTER TABLE customers
ADD CONSTRAINT customers_customer_id_pk PRIMARY KEY(customer_id);

ALTER TABLE customers
ADD CONSTRAINT customers_customer_grade_fk FOREIGN KEY(customer_grade)
REFERENCES customer_grade(customer_grade);

ALTER TABLE customers
ADD (name VARCHAR2(10));

ALTER TABLE customers
MODIFY (phoneno VARCHAR2(20));

INSERT INTO customer_grade
VALUES('DIAMOND', 0.2);
INSERT INTO customer_grade
VALUES('GOLD', 0.2);
INSERT INTO customer_grade
VALUES('BRONZE', 0.2);

INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('1', '010-1111-1111', '1234', '1991/01/24', 'DIAMOND', 'À±º´·Ï');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('2', '010-2222-2222', '4321', '1993/09/17', 'BRONZE', '±èÁØÇü');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('3', '010-3333-3333', '2341', '1991/05/06', 'GOLD', 'ÃÖ¿ë¶ô');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('4', '010-4444-4444', '3124', '1993/12/29', 'BRONZE', 'Á¤Ã¶Èñ');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('5', '010-5555-5555', '3421', '1991/08/12', 'GOLD', 'À±º´·Ï');

CREATE TABLE reviews(
review_id VARCHAR2(20) PRIMARY KEY,
comm VARCHAR2(20),
review_grade NUMBER,
customer_id VARCHAR2(20),
hotel_id VARCHAR2(20));

ALTER TABLE reviews
ADD CONSTRAINT reviews_hotel_id_fk FOREIGN KEY(hotel_id)
REFERENCES hotel(hotel_id);
ALTER TABLE reviews
ADD CONSTRAINT reviews_customer_id_fk FOREIGN KEY(customer_id)
REFERENCES customers(customer_id);
