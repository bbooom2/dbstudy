--문자열 함수 


-- 1. 대소문자 변환 함수 
SELECT 
     UPPER(EMAIL) -- 대문자
    ,LOWER(EMAIL) -- 소문자 
    ,INITCAP(EMAIL) --첫글자만 대문자, 나머지 글자 소문자 변환 
 FROM 
     EMPLOYEES; 
     

-- 2. 글자 수 반환 함수 
SELECT 
      LENGTH('HELLO') -- 글자 수 
    , LENGTH('안녕')  -- 글자 수 
    , LENGTHB('HELLO') -- 바이트 수 : 5 
    , LENGTHB('안녕') -- 바이트 수  : 6 // UTF-8 처리 했기 때문에 3바이트 씩 
  FROM 
      DUAL; 
      
-- 3. 문자열 연결 함수 / 연산자 
--  1) 함수 : CONCAT(A,B) 주의! 인수가 2개만 전달 가능하다. (CONCAT(A,B,C) 같은 형태는 불가능하다.) 
--  2) 연산자 : || 주의! OR 연산자 아닙니다! 오라클 전용입니다!
SELECT 
        CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
       ,FIRST_NAME || ' ' || LAST_NAME
   FROM 
        EMPLOYEES; 
        

-- 4. 문자열의 일부 반환하기 
-- SUBSTR(칼럼, BEGIN, LENGTH) : BEGIN부터 LENGTH 개를 반환 
-- 주의! BEGIN은 인덱스가 아니라 1부터 시작한다. 

SELECT  
      SUBSTR(EMAIL, 1, 3) -- 1번째 글자부터 3글자를 가져오시오. 
  FROM  
        EMPLOYEES; 
    
      
      
-- 5. 특정 문자열의 위치 반환하기 
--  INSTR(칼럼, 찾을 문자열)
--  주의! 반환되는 위치 정보는 인덱스가 아니므로 0부터 시작하지 않고, 1부터 시작한다. 
--  못 찾으면 0을 반환한다. 

SELECT
      INSTR(EMAIL, 'A') -- 'A'의 위치를 반환 
  FROM 
      EMPLOYEES;
      
-- 6. 문자열 채우기(PADDING)
--    1) LPAD(칼럼, 전체폭, 채울문자) 
--    2) RPAD(칼럼, 전체폭, 채울문자)
SELECT
      LPAD(DEPARTMENT_ID, 3, '0') -- 0을 따옴표로 묶을 필요는 없을 것 같지만 (=실제로 결과도 똑같았음) 멋있게 묶어 봤다고 함. 
    , RPAD(EMAIL, 10, '*') -- 전체 10자리 만들 건데 빈 문자열은 *로 채울 것. 
  FROM
      EMPLOYEES;
      
      
-- 연습문제 
SELECT
      LPAD(NVL(DEPARTMENT_ID,0), 3, '0') -- 'NULL'이 나오면 0을 쓰겠다. NVL 함수 활용 
    , RPAD(SUBSTR(EMAIL, 1, 2), 5, '*') -- 전체 5자리 만들 건데 빈 문자열은 *로 채울 것. SUBSTR 함수 활용 
  FROM
      EMPLOYEES;
      

-- 7. 불필요한 공백 제거 
-- 1) LTRIM(칼럼) : 왼쪽 공백 제거 
-- 2) RTRIM(칼럼) : 오른쪽 공백 제거 
-- 3) TRIM(칼럼)  : 왼쪽, 오른쪽 공백 모두 제거
SELECT 
        LTRIM('     HELLO')
       ,RTRIM('HELLO     ')
  FROM
      EMPLOYEES;

        