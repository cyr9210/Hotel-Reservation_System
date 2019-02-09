CREATE TABLE hotel(
        hotel_id VARCHAR2(10) PRIMARY KEY,
        address VARCHAR2(10),
        hotel_phoneno VARCHAR(20)
        );
        
INSERT INTO hotel VALUES('Amotel', '금천구', '02-406-4444');
INSERT INTO hotel VALUES('Bmotel', '안양시', '031-444-5555');
INSERT INTO hotel VALUES('Bhotel', '청주시', '043-666-6666');
INSERT INTO hotel VALUES('Chotel', '청원군', '043-555-5555');
    
    
    
CREATE TABLE room(
        room_id VARCHAR2(10) PRIMARY KEY,
        room_no NUMBER(10),
        price NUMBER(20),
        room_grade VARCHAR2(10),
        hotel_id VARCHAR2(10) REFERENCES hotel(hotel_id)
        );
        
        
    INSERT INTO room VALUES('A-01', '101', 30000, 'Standard', 'Amotel');
    INSERT INTO room VALUES('A-02', '102', 30000, 'Standard','Amotel');
    INSERT INTO room VALUES('A-03', '103', 30000, 'Standard', 'Amotel');
    INSERT INTO room VALUES('A-04', '201', 70000, 'Sweet', 'Amotel');
    INSERT INTO room VALUES('A-05', '202', 70000, 'Sweet', 'Amotel');
    INSERT INTO room VALUES('A-06', '203', 70000, 'Sweet', 'Amotel');
    INSERT INTO room VALUES('B-01', '101', 40000, 'Standard', 'Bmotel');
    INSERT INTO room VALUES('B-02', '102', 40000, 'Standard', 'Bmotel');
    INSERT INTO room VALUES('B-03', '103', 40000, 'Standard', 'Bmotel');
    INSERT INTO room VALUES('B-04', '201', 70000, 'Sweet', 'Bmotel');
    INSERT INTO room VALUES('B-05', '202', 70000, 'Sweet', 'Bmotel');
    INSERT INTO room VALUES('B-06', '203', 70000, 'Sweet', 'Bmotel');
    INSERT INTO room VALUES('C-01', '101', 50000, 'Premium', 'Bhotel');
    INSERT INTO room VALUES('C-02', '102', 50000, 'Premium', 'Bhotel');
    INSERT INTO room VALUES('C-03', '103', 50000, 'Premium', 'Bhotel');
    INSERT INTO room VALUES('C-04', '201', 70000, 'Sweet', 'Bhotel');
    INSERT INTO room VALUES('C-05', '202', 70000, 'Sweet', 'Bhotel');
    INSERT INTO room VALUES('C-06', '203', 70000, 'Sweet', 'Bhotel');
    INSERT INTO room VALUES('D-01', '101', 60000, 'Premium', 'Chotel');
    INSERT INTO room VALUES('D-02', '102', 60000, 'Premium', 'Chotel');
    INSERT INTO room VALUES('D-03', '103', 60000, 'Premium', 'Chotel');
    INSERT INTO room VALUES('D-04', '201', 100000, 'Sweet', 'Chotel');
    INSERT INTO room VALUES('D-05', '202', 100000, 'Sweet', 'Chotel');
    INSERT INTO room VALUES('D-06', '203', 100000, 'Sweet', 'Chotel');
            
            
            
CREATE TABLE reservationlist(
check_in DATE,
reservation_id VARCHAR2(20),
room_id VARCHAR2(20));

ALTER TABLE reservationlist
ADD CONSTRAINT reservationlist_pk PRIMARY KEY(check_in, room_in);

ALTER TABLE reservationlist
ADD CONSTRAINT reservationlist_reservation_id_fk FOREIGN KEY(reservation_id)
REFERENCES reservation(reservation_id);

ALTER TABLE reservationlist
ADD CONSTRAINT reservationlist_room_id_fk FOREIGN KEY(room_id)
REFERENCES room(room_id);
    
    
    INSERT INTO reservationlist VALUES('2018/12/22', 'R-001', 'A-01');
    INSERT INTO reservationlist VALUES('2018/12/23', 'R-002', 'B-01');
    INSERT INTO reservationlist VALUES('2018/12/25','R-003', 'A-02');
    INSERT INTO reservationlist VALUES('2018/12/28','R-004', 'C-03');
    INSERT INTO reservationlist VALUES('2018/12/30','R-005', 'D-04');
    INSERT INTO reservationlist VALUES('2019/1/2','R-006', 'B-01');
    INSERT INTO reservationlist VALUES('2019/1/3','R-007', 'D-05');
    INSERT INTO reservationlist VALUES('2019/1/4', 'R-008', 'A-03');
    INSERT INTO reservationlist VALUES('2019/1/5','R-009', 'B-02');
    INSERT INTO reservationlist VALUES('2019/1/6', 'R-010', 'C-05');
    
    
    
CREATE TABLE reservation(
    reservation_id VARCHAR2(10) PRIMARY KEY,
    customer_id VARCHAR2(10) REFERENCES customers(customer_id)
    );
        
                
    INSERT INTO reservation VALUES('R-001',1);
    INSERT INTO reservation VALUES('R-002',2);
    INSERT INTO reservation VALUES('R-003',3);
    INSERT INTO reservation VALUES('R-004',4);
    INSERT INTO reservation VALUES('R-005',5);
    INSERT INTO reservation VALUES('R-006',1);
    INSERT INTO reservation VALUES('R-007',2);
    INSERT INTO reservation VALUES('R-008',3);
    INSERT INTO reservation VALUES('R-009',4);
    INSERT INTO reservation VALUES('R-010',5);


CREATE TABLE customer_grade(
    customer_grade VARCHAR2(10),
    bonus_pct NUMBER);

ALTER TABLE customer_grade
    ADD CONSTRAINT customer_grade_pk PRIMARY KEY(customer_grade);
    
INSERT INTO customer_grade VALUES('DIAMOND', 0.2);
INSERT INTO customer_grade VALUES('GOLD', 0.15);
INSERT INTO customer_grade VALUES('BRONZE', 0.1);


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


INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('1', '010-1111-1111', '1234', '1991/01/24', 'DIAMOND', '윤병록');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('2', '010-2222-2222', '4321', '1993/09/17', 'BRONZE', '김준형');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('3', '010-3333-3333', '2341', '1991/05/06', 'GOLD', '최용락');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('4', '010-4444-4444', '3124', '1993/12/29', 'BRONZE', '정철희');
INSERT INTO customers(customer_id, phoneno, pw, birth, customer_grade, name)
VALUES('5', '010-5555-5555', '3421', '1991/08/12', 'GOLD', '황소희');



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


INSERT INTO reviews
VALUES('1', '좋음', 5, '2', 'Bmotel');
INSERT INTO reviews
VALUES('2', '나쁨', 1, '3', 'Amotel');
INSERT INTO reviews
VALUES('3', '별로', 2, '5', 'Chotel');
INSERT INTO reviews
VALUES('4', '보통', 3, '1', 'Bmotel');