/*
    KEY 제약조건 
    1. 기본키(PK : Primary Key) 
      1) 개체무결성 
      2) PK는 NOT NULL + UNIQUE 해야 한다. 
    
    2. 외래키(FK: Foreign Key) 
     1) 참조무결성
     2) FK는 참조하는 값만 가질 수 있다. 
    
*/

/*
    일대다(1:M) 관계 
    1. PK와 FK를 가진 테이블 간의 관계이다. 
        1) 부모 테이블 : 1, PK를 가진 테이블 
        2) 자식 테이블 : M, FK를 가진 테이블 
    2. 생성과 삭제 규칙 
      1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다. 
      2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다. 
      
*/

--삽입수정삭제는 COMMIT 필요 (맛동산 등록하고 COMMIT 눌러야 반영 됐었음) 
--제약조건의 이름을 명시하자 (PK, FK) 그래야 나중에 찾기 편함 CONSTRAINT PK PROD_NO 이런식으로 


-- 테이블 삭제 --삭제를 몰아서 위쪽에 배치, 생성은 몰아서 아래쪽에 배치. 생성(부모 - 자식) 삭제(자식 - 부모) 
DROP TABLE ORDER_TBL;
DROP TABLE PRODUCT_TBL;


-- 제품 테이블 (부모 테이블) 

CREATE TABLE PRODUCT_TBL (
    PROD_NO NUMBER NOT NULL,  --NOT NULL 명시는 대부분 함께함. 생략해도 NOT NULL. UNIQUE는 NOT NULL UIQUE로 기재했을 때 오류 낫었음. 
    PROD_NAME VARCHAR2 (10 BYTE),
    PROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)
);




-- 주문 테이블 (자식 테이블) 

CREATE TABLE ORDER_TBL (
    ORDER_NO NUMBER NOT NULL, 
    USER_ID VARCHAR2(10 BYTE), 
    PROD_NO NUMBER,
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO) -- 이 형식으로 제약조건 익힐 것 
);





/*
    제약조건 테이블 
    1. SYS, SYSTEM 관리 계정으로 접속해서 확인한다. 
    2. 종류 
     1) ALL_CONSTRAINTS     - 모든 제약 조건 
     2) USER_CONSTRAINTS    - 사용자 제약 조건 
     3) DBA_CONSTRAINTS     - 관리자 제약 조건 

    1. ALL, USER, DBA를 앞에 붙일 수 있다. 
    2. 테이블 확인하고 싶으면 ALL_TABLE 처럼 뒤에 확인하고자 하는 대상을 기재한다. 
*/

-- 테이블의 구조를 확인하는 쿼리문 (설명) 
--DESCRIBE ALL_CONSTRAINTS; --이름(컬럼) NOT NULL 유무 데이터타입 확인 가능 

---SELECT * FROM ALL_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'PK%'; --ALL_CONSTRAINTS에 담긴 PK로 시작하는 모든 내용 확인 가능 



