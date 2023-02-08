--샘플 데이터 
DROP TABLE SAMPLE_TBL;
CREATE TABLE SAMPLE_TBL(
    NAME VARCHAR2(10 BYTE),
    KOR NUMBER(3),
    ENG NUMBER(3),
    MAT NUMBER(3)
);

INSERT INTO SAMPLE_TBL (NAME, KOR, ENG, MAT) VALUES(NULL, 100, 100, 100);
INSERT INTO SAMPLE_TBL (NAME, KOR, ENG, MAT) VALUES('정숙', NULL, 90, 90);
INSERT INTO SAMPLE_TBL (NAME, KOR, ENG, MAT) VALUES('미희', 80, NULL, 80);
INSERT INTO SAMPLE_TBL (NAME, KOR, ENG, MAT) VALUES('철순', 70, 70, NULL);
COMMIT;


/*
    집계함수(그룹별 통계)                                            -----GROUP BY 사용할 때 들어감. 참고! 
    1. 통계(합계, 평균, 개수, 최대, 최소 등)를 계산하는 함수이다. 
    2. GROUP BY절에서 주로 사용한다. 
    3. 종류 
        1) 합계 : SUM(칼럼)
        2) 평균 : AVG(칼럼)
        3) 개수 : COUNT(칼럼)
        4) 최대 : MAX(칼럼)
        5) 최소 : MIN(칼럼)
    4. NULL 값은 연산에서 제외한다. 
    
*/


/*
    이름   국어 영어 수학 합계 (SUM으로 구할 수 없는 합계이다.)
    NULL,  100, 100, 100  300
    '정숙', NULL, 90, 90  180
    '미희', 80, NULL, 80  160
    '철순', 70, 70, NULL  140
    ----------------------------
     합계  250 260 270           
     (SUM으로 구할 수 있는 합계이다.)
     
*/

-- 합계 
SELECT 
      SUM(KOR) --NULL값이 없는 칼럼에서는 사용 가능 EX : PK 
     ,SUM(ENG)
     ,SUM(MAT)
--   ,SUM(KOR + ENG + MAT) -- SUM 함수의 인수는 1개만 가능하다. 
  FROM SAMPLE_TBL;
  

-- 평균(응시 결과가 없으면 0으로 처리하기)  
SELECT 
        AVG(NVL(KOR, 0)) -- 함수 계산 시 안쪽 것부터 먼저 처리 됨. NVL함수 없을 시 NULL값은 무시되어 /3으로 처리해버린다. /4 처리 위해서는 NULL값을 0으로 처리해주는 작업이 필요하다. 
       ,AVG(NVL(ENG, 0))
       ,AVG(NVL(MAT,0))
  FROM
        SAMPLE_TBL;
        

-- 개수 
SELECT 
        COUNT(KOR) -- 국어시험 응시한 인원 
       ,COUNT(ENG) -- 영어시험 응시한 인원 
       ,COUNT(MAT) -- 수학시험 응시한 인원
       ,COUNT(*) -- 모든 칼럼을 참조해서 어느 한 칼럼이라도 값을 가지고 있으면 개수에 포함. 이대로 기억하기. 특별한 사유 있을 때 따로 알려 줄 예정. 
 FROM 
        SAMPLE_TBL;
        
-- 개수 정리! 
-- 테이블에 포함된 데이터(행, ROW)의 개수는 COUNT(*)로 구한다. 
   