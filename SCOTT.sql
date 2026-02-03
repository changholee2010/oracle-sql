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
select * from student;

-- 연습2)
SELECT *
FROM emp;

-- WHERE 
SELECT *
FROM student
WHERE weight between 60 and 70 --weight >= 60 AND   weight <= 70
AND   deptno1 in (101, 201);

SELECT *
FROM student
WHERE deptno2 is not null;

-- 비교연산자 연습1) emp테이블 급여 3000보다 큰 직원.

-- 비교연산자 연습2) emp테이블 보너스 있는 직원.

-- 비교연산자 연습3) student테이블 주전공학과: 101, 102, 103 인 학생.

-- 급여가 2000 이상인 직원. 커미션(급여 + 커미션)

-- 교수=> 연봉이 4000 이상인. 보너스 3번
   -- > 교수번호, 이름, 연봉으로 출력.
SELECT profno
      ,name
      ,pay
      ,bonus
      ,pay * 12 as total_1
      ,pay * 12 + bonus * 3 as total_2
FROM professor
WHERE (pay * 12 >= 3000 AND bonus is null)
OR (pay * 12 + bonus * 3 >= 3000 AND bonus is not null)
ORDER BY 5 -- 정렬기준.
;

-- 문자열 like 연산자.
SELECT *
FROM student
WHERE name like '%on____%';

--
SELECT profno
      ,name
      ,pay
      ,bonus
      ,hiredate
FROM professor
WHERE hiredate > to_date('1999-01-01', 'rrrr-mm-dd')
order by hiredate; -- 1970.01.01 

-- 학생테이블, 전화번호(02, 031, 051, 052, 053..)
-- 부산거주.

-- 이름 M으로 시작 8개 이상인 사람만 조회.

-- 주민번호 10월달에 태어난 사람조회.


-- AND / OR 
-- IF (sal > 100 || height > 170)
SELECT studno
      ,name
      ,grade
      ,height
      ,weight
FROM student
WHERE (height > 170
OR   weight > 60)
AND (grade = 4 OR height > 150);



