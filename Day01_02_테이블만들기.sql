/*
    테이블 
    1. 데이터베이스의 가장 대표적인 객체이다. 
    2. 데이터를 보관하는 객체이다. 
    3. 표 형식으로 데이터를 보관한다. 
    4. 테이블 기본 용어 
        1) 열 : column, 속성(attribute), 필드(field) 
        2) 행 : row,    개체(entity),    레코드(record) 
*/

/*
    오라클의 데이터 타입
    1. CHAR(size)    : 고정 길이 문자 타입(size : 1 ~ 2000바이트)
    2. VARCHAR2(size): 가변 길이 문자 타입(size : 1 ~ 4000바이트) -STRING으로 알면 됨 
    3. DATE          : 날짜/시간 타입 
    4. TIMESTAMP     : 날짜/시간 타입(좀 더 정밀)
    5. NUMBER(p,s)   : 정밀도(p), 스케일(s)로 표현하는 숫자 타입
        1) 정밀도 : 정수부와 소수부를 모두 포함하는 전체 유효 숫자가 몇 개인가? 
        2) 스케일 : 소수부의 전체 유효 숫자가 몇 개인가? 
        예시) 
            (1) NUMBER      : 최대 38자리 숫자(22바이트)
            (2) NUMBER(3)   : 정수부가 최대 3자리인 숫자(최대 999)
            (3) NUMBER(5,2) : 최대 전체 5자리, 소수부 2자리인 숫자(123.45)
            (4) NUMBER(2,2) : 1 미만의 소수부 2자리인 실수(0.15) - 정수부의 0은 유효 자리가 아님
*/

/*
    제약조건(Constraint) 5개 중 3개 
    1. 널 
       1) NULL 또는 생략
       2) NOT NULL
    2. 중복 데이터 방지 
        UNIQUE 
    3. 값의 제한 
        CHECK 
        
    4. 개체무결성 (PK : PRIMARY KEY) 
     NOT NULL + UNIQUE
     중복된 값이 저장될 수 없고, NULL값이 저장될 수 없다. 
     (*기본키가 없는 테이블이 규칙에 어긋나는  테이블은 아니다.) 
     
*/




-- 예시 테이블 

DROP TABLE PRODUCT;
CREATE TABLE PRODUCT(
    CODE VARCHAR2(2 BYTE) NOT NULL UNIQUE, --최대 2바이트 / NOT NULL로 인해 CODE는 필수로 데이터 입력해야 함 / 제약 순서 없음 띄어쓰기만 잘하면 됨 
    MODEL VARCHAR2(10 BYTE), 
    CATEGORY VARCHAR2(5 BYTE)   CHECK(CATEGORY = 'MAIN' OR CATEGORY = 'SUB'), -- CHECK(CATEGORY IN('MAIN','SUB')) 이렇게 사용하기
    PRICE NUMBER                CHECK(PRICE >= 0),  -- 제품의 가격이 0 이상인지 확인하세요 
    AMOUNT NUMBER(2)            CHECK(AMOUNT >= 0 AND AMOUNT <= 100), -- CHECK(AMOUNT BETWEEN 0 AND 100) 이렇게 사용하기 
    MANUFACTURED DATE
);


