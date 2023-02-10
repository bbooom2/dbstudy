-- 1. 다음 칼럼 정보를 이용하여 MEMBER_TBL 테이블을 생성하시오.
--    1) 회원번호: MEMBER_NO, NUMBER, 필수
--    2) 회원아이디: ID, VARCHAR2(30 BYTE), 필수, 중복 불가
--    3) 회원패스워드: PW, VARCHAR2(30 BYTE), 필수
--    4) 회원포인트: POINT, NUMBER
--    5) 회원등급: GRADE, VARCHAR2(10 BYTE), 'VIP', 'GOLD', 'SILVER', 'BRONZE' 값 중 하나를 가짐
--    6) 회원이메일: EMAIL, VARCHAR2(100 BYTE), 중복 불가

DROP TABLE MEMBER_TBL;

CREATE TABLE MEMBER_TBL(
MEMBER_NO NUMBER NOT NULL,
ID VARCHAR2(30 BYTE) NOT NULL UNIQUE,
PW VARCHAR2(30 BYTE) NOT NULL,
POINT NUMBER,
GRADE VARCHAR2(10 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE')),
EMAIL VARCHAR2(100 BYTE) UNIQUE
);



-- 2. MEMBER_TBL 테이블에 다음 새로운 칼럼을 추가하시오.
--    1) 회원주소: ADDRESS VARCHAR2(200 BYTE)
--    2) 회원가입일: REGIST_DATE DATE
ALTER TABLE MEMBER_TBL ADD ADDRESS VARCHAR2(200 BYTE);
ALTER TABLE MEMBER_TBL ADD REGIST_DATE DATE;

-- 3. 추가된 회원주소 칼럼을 다시 삭제하시오.
ALTER TABLE  MEMBER_TBL
   DROP COLUMN ADDRESS;

-- 4. 회원등급 칼럼의 타입을 VARCHAR2(20 BYTE)으로 수정하시오.

ALTER TABLE MEMBER_TBL
    MODIFY GRADE VARCHAR2(20 BYTE);

-- 5. 회원패스워드 칼럼의 이름을 PWD로 수정하시오.
ALTER TABLE MEMBER_TBL
  RENAME COLUMN PW TO PWD;

-- 6. 회원번호 칼럼에 기본키(PK_MEMBER)를 설정하시오.
ALTER TABLE ADD 

-- 7. 다음 칼럼 정보를 이용하여 BOARD_TBL 테이블을 생성하시오.
--    1) 글번호: BOARD_NO, NUMBER, 필수
--    2) 글제목: TITLE, VARCHAR2(1000 BYTE), 필수
--    3) 글내용: CONTENT, VARCHAR2(4000 BYTE), 필수
--    4) 조회수: HIT, VARCHAR2(1 BYTE)
--    5) 작성자: WRITER, VARCHAR2(30 BYTE), 필수
--    6) 작성일자: CREATE_DATE, DATE


-- 8. 조회수 칼럼의 타입을 NUMBER로 수정하시오.


-- 9. 글내용 칼럼의 필수 제약조건을 제거하시오.


-- 10. 글번호 칼럼에 기본키(PK_BOARD)를 설정하시오.


-- 11. 작성자 칼럼에 MEMBER_TBL 테이블의 회원아이디를 참조하는 FK_BOARD_MEMBER 외래키를 설정하시오.
-- 게시글을 작성한 회원 정보가 삭제되면 해당 회원이 작성한 게시글도 모두 함께 지워지도록 처리하시오.


-- 12. MEMBER_TBL 테이블과 BOARD_TBL 테이블을 모두 삭제하시오.