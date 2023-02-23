--삽입/삭제/수정하면 메시지를 출력하는 트리거 만들기 

SET SERVEROUTPUT ON; --이거는 딱 한번만 실행하면 그 뒤에 안해도 됨 

CREATE OR REPLACE TRIGGER MY_TRIGGER  --문제에 에프터 아니면 비포로 적어놨다고 함 일단 우리는 에프터로 진행해보겠다고 함 
 AFTER 
 INSERT OR DELETE OR UPDATE  --하나 두개 세개 전부 다 할수 있음 
 ON DEPARTMENT_TBL -- 어떤 테이블 대상인지 
 FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('하하하하하');
END;

-- PLSQ 실행하는 문제는 무조건 블락 잡아서 해결할 것. 컴파일 완료. 

INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(5, '개발부', '서울'); -- 평가문제로는 트리거만 제출 해당 쿼리문 제출필요 X 각자 확인해보는 용도 