-- 전달된 부서번호의 부서를 삭제하는 프로시저를 작성하시오. 
-- 전달된 부서에 근무하는 모든 사원을 함께 삭제하시오. 
CREATE OR REPLACE PROCEDURE DELETE_PROC(DEPTNO IN DEPARTMENT_TBL.DEPT_NO%TYPE) -- 실제와 변수는 다르게 해야함 IN은 입력 파라미터 
IS --변수 있을 시 선언 이쪽에서 하는 것 
BEGIN 
--사원부터 지워야함(외래키를 가졌기 때문에)  
--1:M의 경우 M쪽을 먼저 지워야 하고 만들때는 1쪽을 먼저 만들어야 한다.
--DELETE 순서 잘못되면 안됨 ㅠ 명심 꼭 명심 ROLLBACK 잘 챙겨서 넣기 
    DELETE 
        FROM EMPLOYEE_TBL
        WHERE DEPART = DEPTNO;
       DELETE
       FROM DEPARTMENT_TBL
       WHERE DEPT_NO = DEPTNO;
       COMMIT;
EXCEPTION
    WHEN OTHERS THEN --모든 예외의 경우 
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            DBMS_OUTPUT.PUT_LINE(SQLERRM);--SQL 에러메시지 
            ROLLBACK;
END;

--1. 컴파일 하기 

--첫번째 실행방법 
EXECUTE DELETE_PROC(1) --부서번호1인 부서 삭제 