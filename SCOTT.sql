-- Oracle(DBMS) - version(21C) - xe(database명)
-- user(scott) - 테이블.
-- Structured Query Language (SQL)
SELECT studno, name -- 컬럼명(전체)
FROM STUDENT; -- 테이블.

-- 1) professor 테이블. 전체 컬럼 조회.
SELECT *
FROM professor;

-- 2) 학생 -> 학생번호, 이름, 학년
SELECT studno, name, grade
FROM student;

-- 숙제완료함.  \'
select name || '''id is ' || id || ' 이고 ' || grade || '학년입니다.' 
       as "학년설명" -- 별칭(alias) 
      --,grade "학년"
from student;
-- James Seo의 '아이디'는 75true 이고 4학년입니다. => alias (학년설명)

SELECT distinct name, grade -- 중복된값 제거.
FROM student;

-- 연습1) 


-- 연습2)
SELECT *
FROM emp;
