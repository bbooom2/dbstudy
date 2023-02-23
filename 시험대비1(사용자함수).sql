-- 사원번호를 전달하면 해당 사원의 이름을 반환하는 함수 만들기 
-- 리턴 타입 적을 때는 사이즈 안 적음 
CREATE OR REPLACE FUNCTION GET_NAME(EMPNO EMPLOYEE_TBL.EMP_NO%TYPE)
RETURN VARCHAR2 
IS
    EMPNAME EMPLOYEE_TBL.NAME%TYPE; --구창민을 이 변수에 넣어야 함 
BEGIN
    SELECT NAME 
    INTO   EMPNAME -- 구창민이 들어있다고 봐야함 
    FROM   EMPLOYEE_TBL
    WHERE  EMP_NO = EMPNO; --1001번 확인 가능 
    RETURN EMPNAME;
END;

--순서1. 여기까지 컨트롤 엔터 - >  Function GET_NAME이(가) 컴파일되었습니다.

-- 사원명
-- 구창민 

SELECT GET_NAME(1001) AS 사원명 
FROM EMPLOYEE_TBL
WHERE EMP_NO = 1001; --이거 없이 조회하면 4개의 구창민이 나옴 우리는 하나만 조회하고 싶기 때문에 WHERE절 입력 

--이런방법도 있음 (참고)
SELECT DISTINCT GET_NAME(1001) AS 사원명 
FROM EMPLOYEE_TBL

SELECT GET_NAME(EMP_NO) AS 사원명 --EMPNO에 저장 / 전체 사원을 조회하려면 EMP_NO를 넣으면 된다. 
FROM EMPLOYEE_TBL;



--2. 컨트롤 엔터 -> 잘 안나오면 컴파일 한번 더 하고 다시 조회
