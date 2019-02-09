CREATE SEQUENCE customer_id_seq;


CREATE TABLE customer
    (customer_number NUMBER PRIMARY KEY,
     phoneNum NUMBER,
     customer_name VARCHAR2(5),
     password NUMBER,
     customer_birth VARCHAR2(10),
     coupon NUMBER,
     customer_grade VARCHAR2(10)
    );
    
    INSERT INTO customer
    VALUES(customer_id_seq.NEXTVAL, '010-1111-1111', '윤병록', 1234, '1990/10/24', 100, 'Diamond');
    INSERT INTO customer
    VALUES(customer_id_seq.NEXTVAL, '010-2222-2222', '김준형', 4321, '1993/09/17', 20, 'Bronze');
    INSERT INTO customer
    VALUES(customer_id_seq.NEXTVAL, '010-3333-3333', '최용락', 2341, '1991/05/06', 40, 'Gold');
    INSERT INTO customer
    VALUES(customer_id_seq.NEXTVAL, '010-4444-4444', '정철희', 3124, '1993/12/29', 20, 'Bronze');
    INSERT INTO customer
    VALUES(customer_id_seq.NEXTVAL, '010-5555-5555', '황소희', 3421, '1991/08/12', 80, 'Gold');
    
    

CREATE TABLE customergrade
    (customer_grade VARCHAR2(10),
     discount NUMBER
    );
    
    INSERT INTO customergrade
    VALUES('Bronze', 0.1);
    INSERT INTO customergrade
    VALUES('Gold', 0.15);
    INSERT INTO customergrade
    VALUES('Diamond', 0.20);
    
    
 
CREATE TABLE reservation
    (reservation_Num VARCHAR2(10) PRIMARY KEY,
     check_in VARCHAR2(30),
     check_out VARCHAR2(30),
     customer_price NUMBER
    );
    
    
    INSERT INTO reservation
    VALUES('R-001', '18-12-22 17:00', '18-12-23 12:00', 30000);
    INSERT INTO reservation
    VALUES('R-002', '18-12-23 17:00', '18-12-23 12:00', 40000);
    INSERT INTO reservation
    VALUES('R-003', '18-12-25 17:00', '18-12-23 12:00', 60000);
    INSERT INTO reservation
    VALUES('R-004', '18-12-28 17:00', '18-12-23 12:00', 50000);
    INSERT INTO reservation
    VALUES('R-005', '18-12-30 17:00', '18-12-23 12:00', 100000);
    INSERT INTO reservation
    VALUES('R-006', '19-1-2 17:00', '19-1-3 12:00', 40000);
    INSERT INTO reservation
    VALUES('R-007', '19-1-3 17:00', '19-1-4 12:00', 100000);
    INSERT INTO reservation
    VALUES('R-008', '19-1-4 17:00', '19-1-6 12:00', 60000);
    INSERT INTO reservation
    VALUES('R-009', '19-1-5 17:00', '19-1-6 12:00', 40000);
    INSERT INTO reservation
    VALUES('R-010', '19-1-6 17:00', '19-1-7 12:00', 70000);
    
    
    
CREATE TABLE reservationlist
    (customer_number NUMBER,
     hotel_num VARCHAR2(10),
     reservation_Num VARCHAR2(10) PRIMARY KEY
    );
    
    INSERT INTO reservationlist VALUES('1', 'A-01', 'R-001');
    INSERT INTO reservationlist VALUES('2', 'B-01', 'R-002');
    INSERT INTO reservationlist VALUES('3', 'A-02', 'R-003');
    INSERT INTO reservationlist VALUES('4', 'C-03', 'R-004');
    INSERT INTO reservationlist VALUES('5', 'D-04', 'R-005');
    INSERT INTO reservationlist VALUES('1', 'B-01', 'R-006');
    INSERT INTO reservationlist VALUES('2', 'D-05', 'R-007');
    INSERT INTO reservationlist VALUES('3', 'A-03', 'R-008');
    INSERT INTO reservationlist VALUES('4', 'B-02', 'R-009');
    INSERT INTO reservationlist VALUES('5', 'C-05', 'R-010');
    
    
    
CREATE TABLE hotelowner
    (owner_num VARCHAR2(15) PRIMARY KEY,
     address VARCHAR2(15),
     cellphone_num VARCHAR2(30),
     review NUMBER
    );
    
    
INSERT INTO hotelowner VALUES('Amotel', '금천구', '02-406-4444', 5);
INSERT INTO hotelowner VALUES('Bmotel', '안양시', '031-444-5555', 2);
INSERT INTO hotelowner VALUES('Bhotel', '청주시', '043-666-6666', 4);
INSERT INTO hotelowner VALUES('Chotel', '청원군', '043-555-5555', 1);

    
    
CREATE TABLE hotel
    (hotel_num VARCHAR2(10) PRIMARY KEY,
     owner_num VARCHAR2(10),
     hotel_stair VARCHAR2(30),
     hotel_grade VARCHAR2(30),
     hotel_price NUMBER
    );
    
    INSERT INTO hotel VALUES('A-01', 'Amotel', '101', 'Standard', 30000);
    INSERT INTO hotel VALUES('A-02', 'Amotel', '102', 'Standard', 30000);
    INSERT INTO hotel VALUES('A-03', 'Amotel', '103', 'Standard', 30000);
    INSERT INTO hotel VALUES('A-04', 'Amotel', '201', 'Sweet', 70000);
    INSERT INTO hotel VALUES('A-05', 'Amotel', '202', 'Sweet', 70000);
    INSERT INTO hotel VALUES('A-06', 'Amotel', '203', 'Sweet', 70000);
    INSERT INTO hotel VALUES('B-01', 'Bmotel', '101', 'Standard', 40000);
    INSERT INTO hotel VALUES('B-02', 'Bmotel', '102', 'Standard', 40000);
    INSERT INTO hotel VALUES('B-03', 'Bmotel', '103', 'Standard', 40000);
    INSERT INTO hotel VALUES('B-04', 'Bmotel', '201', 'Sweet', 70000);
    INSERT INTO hotel VALUES('B-05', 'Bmotel', '202', 'Sweet', 70000);
    INSERT INTO hotel VALUES('B-06', 'Bmotel', '203', 'Sweet', 70000);
    INSERT INTO hotel VALUES('C-01', 'Bhotel', '101', 'Premium', 50000);
    INSERT INTO hotel VALUES('C-02', 'Bhotel', '102', 'Premium', 50000);
    INSERT INTO hotel VALUES('C-03', 'Bhotel', '103', 'Premium', 50000);
    INSERT INTO hotel VALUES('C-04', 'Bhotel', '201', 'Sweet', 70000);
    INSERT INTO hotel VALUES('C-05', 'Bhotel', '202', 'Sweet', 70000);
    INSERT INTO hotel VALUES('C-06', 'Bhotel', '203', 'Sweet', 70000);
    INSERT INTO hotel VALUES('D-01', 'Chotel', '101', 'Premium', 60000);
    INSERT INTO hotel VALUES('D-02', 'Chotel', '102', 'Premium', 60000);
    INSERT INTO hotel VALUES('D-03', 'Chotel', '103', 'Premium', 60000);
    INSERT INTO hotel VALUES('D-04', 'Chotel', '201', 'Sweet', 100000);
    INSERT INTO hotel VALUES('D-05', 'Chotel', '202', 'Sweet', 100000);
    INSERT INTO hotel VALUES('D-06', 'Chotel', '203', 'Sweet', 100000);
    
    
                