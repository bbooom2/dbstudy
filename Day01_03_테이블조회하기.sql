
-- 예시 ) SCOTT : MYSQL에서는 이와 같은 걸 스키마라고 함 '계정'이라고 생각하면 편함 

/*

    DQL
    1. Data Query Language
    2. 데이터 질의(조회) 언어 
    3. 테이블의 데이터를 조회하는 언어이다. 
    4. 테이블 내용의 변경이 생기지 않는다. 
        (트랜잭션 처리 대상이 아니고, COMMIT이 필요하지 않다.)
    5. 형식([]는 생략 가능) - 각 절에 뭐가 들어가는지 알고 있어야 함 
     SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ... 
     FROM 테이블이름                                                              SELECT절 FROM절 각 절 별로 한줄씩 기재하는걸 추천한다 
     [WHERE 조건식]
     [GROUP BY 그룹화할칼럼 [HAVING 그룹 조건식] // GROUP만 들어오는 건 가능 GROUP이 없는데 HAVING이 들어오는 건 불가능 
     [ORDER BY 정렬할칼럼 정렬방식]
     6. 순서
     ④SELECT 조회할칼럼, 조회할칼럼, 조회할칼럼, ... 
     ①FROM 테이블이름       
     ②[WHERE 조건식]
     ③[GROUP BY 그룹화할칼럼 [HAVING 그룹 조건식] 
     ⑤[ORDER BY 정렬할칼럼 정렬방식]
/*
    트랜잭션 
    1. Transaction 
    2. 여러 개의 세부 작업으로 구성된 하나의 작업을 의미한다. 
    3. 모든 세부 작업이 성공하면 COMMIT하고 하나라도 실패하면 모든 세부 작업의 취소를 진행한다. 
        (All or Nothing)

*/


-- 조회 실습.

--1. 사원 테이블에서 사원명 조회하기
--1) 기본 방식 
SELECT ENAME
  FROM EMP;

--2) 오너 명시하기 (테이블을 가지고 있는 계정)
SELECT ENAME
  FROM SCOTT.EMP; --SCOTT 계정에 저장된 EMP 테이블 

--3) 테이블 명시하기(칼럼을 가지고 있는 테이블)
SELECT EMP.ENAME
  FROM EMP;

--4) 테이블 별명 지정하기 
SELECT E.ENAME
  FROM EMP E; -- EMP 테이블의 별명을 E로 부여한다. AS(ALIAS)를 사용할 수 없다.

--5) 칼럼 별명 지정하기 
SELECT E.ENAME AS 사원명 -- E.ENAME 칼럼의 별명을 '사원명'으로 부여한다. AS(ALIAS)를 사용할 수 있다. 칼럼에서만 AS 사용 가능 
  FROM EMP E;
  
-- 2. 사원 테이블의 모든 칼럼 조회하기 
-- 1)  * 활용하기 (SELECT절에서 *는 모든 칼럼을 의미한다.)
SELECT *         -- 불려 가기 싫으면 사용 금지! 
  FROM EMP; 
  
SELECT EMPNO, ENAME, JOB, MRG, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP;
  
--3. 동일한 데이터는 한 번만 조회하기
-- DISTINCT
SELECT DISTINCT JOB
  FROM EMP;
  
--4. JOB이 MANAGER인 사원 목록 조회하기 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
  WHERE JOB = 'MANAGER'; -- 대문자로 기재되어있는데 소문자로 검색하면 안 나옴 
  
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
  WHERE JOB IN('MANAGER');
  
--5. SAL이 1500 초과인 사원 목록 조회하기 

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL > 1500;
 
 --6. SAL이 2000 ~ 2999인 사원 목록 조회하기 
 SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
 FROM EMP
 WHERE SAL BETWEEN 2000 AND 2999;
 
 
 --7. COMM을 받는 사원 목록 조회하기 
 --   1) NULL 이다 : IS NULL
 --   2) NULL 아니다 : IS NOT NULL
 SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
   FROM EMP
 WHERE COMM IS NOT NULL 
    AND COMM != 0; --조건 분리해서 기재해줘도 됨 
    
    
    /* 개발자들은 이렇게 한다 근데 권장하지는 않지..
    줄 단위로 주석처리 되기 때문에 단축키를 사용해도 불편하고 보기에도 좋지 않기 때문에 번거로움을 가장 첫 줄에 1=1이라는 항상 맞는 조건을 추가하면 해결된다
     SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
       FROM EMP
      WHERE 1 = 1
        AND COMM IS NOT NULL
        AND COMM != 0; 
    
    */
    /*  
  8. ENAME이 A로 시작하는 사원 목록 조회하기 

         1) WILD CARD 
            (1) % : 글자 수 제한 없는 모든 문자  
            (2) _ : 1글자로 제한된 모든 문자 
    
                      A%      A_
                      AI      AI
                      APP     AP
                      APPLE   AM
     
        2) 연산자 
             (1) LIKE : WILD CARD를 포함한다. 
             (2) NOT LIKE : WILD CARD를 포함하지 않는다. 
    */
 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
  WHERE ENAME LIKE 'A%'; --자동완성 기능에 이런 거 자주 씀 


