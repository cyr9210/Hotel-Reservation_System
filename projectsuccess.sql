set serveroutput on;

SELECT * FROM customers;
SELECT * FROM customer_grade;
SELECT * FROM hotel;
SELECT * FROM reservation;
SELECT * FROM reservationlist;
SELECT * FROM reviews;
SELECT * FROM room;


-- 회원 등급 검색
SELECT c.name, g.customer_grade
FROM customers c
JOIN customer_grade g
ON c.customer_grade = g.customer_grade;


-- 고객 번호로 검색
SELECT c.name, l.check_in, m.room_no, m.room_grade, c.customer_id
FROM customers c
JOIN reservation r
ON c.customer_id = r.customer_id
JOIN reservationlist l
ON r.reservation_id = l.reservation_id
JOIN room m
ON l.room_id = m.room_id
WHERE c.customer_id = '1';


-- 숙소 번호로 검색
SELECT c.name, l.check_in, m.room_no, m.room_grade, c.customer_id, h.hotel_id
FROM customers c
JOIN reservation r
ON c.customer_id = r.customer_id
JOIN reservationlist l
ON r.reservation_id = l.reservation_id
JOIN room m
ON l.room_id = m.room_id
JOIN hotel h
ON m.hotel_id = h.hotel_id
WHERE h.hotel_id ='Amotel';


-- 호텔 중 가장 싼 방 TOP3는 ?
SELECT alias.*, ROWNUM
FROM(SELECT r.hotel_id, r.room_grade, r.price, h.address
        FROM room r
        JOIN hotel h
        ON r.hotel_id = h.hotel_id
        GROUP BY r.hotel_id, r.room_grade, r.price, h.address
        ORDER BY r.price)alias
        WHERE ROWNUM <= 3;


-- 호텔 중 평균평점보다 높은 숙소는 ?
SELECT DISTINCT hotel_id FROM reviews
WHERE review_grade > (SELECT AVG(review_grade) FROM reviews);



-- 날짜 및 방 중복시 예외 발생(PL/SQL)
DECLARE
-- 변수 선언

v_customer_id VARCHAR2(50) := '3';
v_date VARCHAR2(50) := '2018/08/13';
v_room_id VARCHAR2(50) := 'A-04';
v_reservation VARCHAR2(50) := 'R-012';


BEGIN

INSERT INTO reservation VALUES(v_reservation, v_customer_id);
INSERT INTO reservationlist VALUES(v_date, v_reservation, v_room_id);

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('이미 예약이 찼습니다.');


END;



-- 날짜 및 방 중복시 예외 발생(PL/SQL)
DECLARE
-- 변수 선언

v_customer_id VARCHAR2(50) := '3';
v_date VARCHAR2(50) := '2018/08/13';
v_room_id VARCHAR2(50) := 'A-04';
v_reservation VARCHAR2(50) := 'R-012';


BEGIN

INSERT INTO reservation VALUES(v_reservation, v_customer_id);
INSERT INTO reservationlist VALUES(v_date, v_reservation, v_room_id);

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('이미 예약이 찼습니다.');


END;


-- 날짜 및 방 중복시 예외 발생(PL/SQL) - 프로시저 사용
CREATE OR REPLACE PROCEDURE reservate(
p_customer_id  IN VARCHAR2,
p_reservation IN VARCHAR2,
p_date IN VARCHAR2,
p_room_id IN VARCHAR2
)IS

BEGIN

SAVEPOINT A;

INSERT INTO reservation VALUES(p_reservation, p_customer_id);
INSERT INTO reservationlist VALUES(p_date, p_reservation, p_room_id);

COMMIT;

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('이미 예약이 찼습니다.');

ROLLBACK TO A;

END;

EXECUTE reservate('1', 'R-012', '18/12/25', 'B-02');
