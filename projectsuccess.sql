set serveroutput on;

SELECT * FROM customers;
SELECT * FROM customer_grade;
SELECT * FROM hotel;
SELECT * FROM reservation;
SELECT * FROM reservationlist;
SELECT * FROM reviews;
SELECT * FROM room;


-- ȸ�� ��� �˻�
SELECT c.name, g.customer_grade
FROM customers c
JOIN customer_grade g
ON c.customer_grade = g.customer_grade;


-- �� ��ȣ�� �˻�
SELECT c.name, l.check_in, m.room_no, m.room_grade, c.customer_id
FROM customers c
JOIN reservation r
ON c.customer_id = r.customer_id
JOIN reservationlist l
ON r.reservation_id = l.reservation_id
JOIN room m
ON l.room_id = m.room_id
WHERE c.customer_id = '1';


-- ���� ��ȣ�� �˻�
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


-- ȣ�� �� ���� �� �� TOP3�� ?
SELECT alias.*, ROWNUM
FROM(SELECT r.hotel_id, r.room_grade, r.price, h.address
        FROM room r
        JOIN hotel h
        ON r.hotel_id = h.hotel_id
        GROUP BY r.hotel_id, r.room_grade, r.price, h.address
        ORDER BY r.price)alias
        WHERE ROWNUM <= 3;


-- ȣ�� �� ����������� ���� ���Ҵ� ?
SELECT DISTINCT hotel_id FROM reviews
WHERE review_grade > (SELECT AVG(review_grade) FROM reviews);



-- ��¥ �� �� �ߺ��� ���� �߻�(PL/SQL)
DECLARE
-- ���� ����

v_customer_id VARCHAR2(50) := '3';
v_date VARCHAR2(50) := '2018/08/13';
v_room_id VARCHAR2(50) := 'A-04';
v_reservation VARCHAR2(50) := 'R-012';


BEGIN

INSERT INTO reservation VALUES(v_reservation, v_customer_id);
INSERT INTO reservationlist VALUES(v_date, v_reservation, v_room_id);

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('�̹� ������ á���ϴ�.');


END;



-- ��¥ �� �� �ߺ��� ���� �߻�(PL/SQL)
DECLARE
-- ���� ����

v_customer_id VARCHAR2(50) := '3';
v_date VARCHAR2(50) := '2018/08/13';
v_room_id VARCHAR2(50) := 'A-04';
v_reservation VARCHAR2(50) := 'R-012';


BEGIN

INSERT INTO reservation VALUES(v_reservation, v_customer_id);
INSERT INTO reservationlist VALUES(v_date, v_reservation, v_room_id);

EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('�̹� ������ á���ϴ�.');


END;


-- ��¥ �� �� �ߺ��� ���� �߻�(PL/SQL) - ���ν��� ���
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
dbms_output.put_line('�̹� ������ á���ϴ�.');

ROLLBACK TO A;

END;

EXECUTE reservate('1', 'R-012', '18/12/25', 'B-02');
