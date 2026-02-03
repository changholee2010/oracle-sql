-- 함수.
SELECT profno
      ,name
      ,pay*12 + nvl(bonus, 0)*3 as "연봉"
      ,pay
      ,nvl(bonus, 0) bonus
FROM professor;

-- initcap('문자열'/ 컬럼)
SELECT initcap('hello')
FROM dual;

SELECT profno
      ,initcap(name)
      ,lower(name)
FROM professor;

-- 예1) 교수테이블의 이름에 'st'(대소문자 구분없이)가 
-- 포함된 교수의 교수번호, 이름, 입사일 출력.
SELECT profno
      ,name
      ,hiredate
FROM professor
WHERE lower(name) like '%st%';

-- 예2) 교수테이블의 교수이름이 10글자가 안되는 교수의 번호,이름,이메일 출력.
SELECT profno
      ,name
      ,email
      ,profno || name
      ,concat(profno, name)
FROM professor
WHERE length(name) < 10;

-- substr
SELECT 'hello, world' 
      ,substr('hello, world', 1, 5) substr1 -- +값이면 왼쪽 순번.
      ,substr('hello, world', -5, 5) substr2 -- -값이면 오른쪽부터 왼쪽순번.
      ,substr('0'||5, -2, 2) mm
      ,substr('02)3456-2345', 1, instr('02)3456-2345', ')', 1) - 1) instr1 
      ,substr('031)2345-2312', 1, instr('031)2345-2312', ')', 1) - 1) instr2 
      ,instr('031)2345-2312', ')', 1) instr2 -- 문자열에서 찾을 문자열의 위치 반환. 
FROM dual;

-- 주전공(210) -> 전화번호, 지역번호 구분.
SELECT name 
      ,tel
      ,substr(tel, 1, instr(tel, ')', 1) - 1) "AREA CODE"
      ,substr(tel                     -- 문자열.
             ,instr(tel, ')', 1) + 1  -- 시작위치.
             ,instr(tel, '-', 1) - instr(tel, ')', 1) - 1 -- 크기.
             ) "1st No"
FROM student s
WHERE deptno1 = 201;

select * from professor;

-- lpad/ rpad 
select rpad('hello', 5, '*')
from dual;

-- LPAD퀴즈.
select lpad(ename, 9, '123456789') lpad
      ,rpad(ename, 9, substr('123456789', length(ename)+1)) rpad
      ,substr('123456789', length(ename)+1) str
from emp
where deptno = 10;

-- ltrim('값', '찾을문자열')
SELECT rtrim('Hello', 'o')
FROM dual;

-- replace('값', '찾을문자열', '대체문자열')
SELECT replace('Hello', 'o', 'o, World')
FROM dual;

SELECT ename
      ,replace(ename, substr(ename, 1, 2), '**') replace
      ,substr(ename, 1, 2) destination
FROM emp
WHERE deptno = 10;

-- round(123.4)
SELECT round(123.456, -2) round
      ,trunc(123.4567, -1) trunc
      ,mod(12, 5) mod
      ,ceil(12.3) ceil
      ,floor(12.3) floor
      ,to_char( trunc(sysdate, 'hh'), 'rrrr/mm/dd hh24:mi:ss') trunc2 -- 년/월/일 시/분/초
FROM dual;

-- 날짜관련함수.
SELECT add_months(sysdate, -1) next_month -- 28
      ,months_between(sysdate + 28, sysdate) months
FROM dual; 

SELECT empno
      ,ename
      ,hiredate
      ,trunc(months_between(sysdate, hiredate) / 12)||'년'  ||
       mod(trunc(months_between(sysdate, hiredate)), 12)||'개월' "근속년수"
      -- 사원번호, 이름, 근속년수 (23년 7개월)
FROM emp;

SELECT profno
      ,name
      ,hiredate
      ,position
      ,pay--교수번호, 이름, 입사일자, 급여 (20년 이상, Software Engineering)
      ,d.dname
FROM professor p, department d
WHERE p.deptno = d.deptno -- 두 테이블간의 equal 조건.
AND   d.dname = 'Software Engineering'
AND   (months_between(sysdate, hiredate)/12) >= 20
--ORDER BY 3
;
select e.empno
      ,e.ename
      ,e.sal
      ,d.dname
from emp e, dept d
where e.deptno = d.deptno
and   d.dname = 'SALES'
and   (months_between(sysdate, hiredate)/12) >= 40
order by e.empno; 
-- SALES부서에서 근속년 40년이 넘는 사람. 
-- 사번,이름,급여,부서명

--학과.
SELECT profno, name, id, pay, deptno
FROM professor;
SELECT d.deptno, dname
FROM department d
;
SELECT profno, name, p.deptno, d.deptno, dname
FROM professor p, department d
WHERE p.deptno = d.deptno
AND d.dname = 'Computer Engineering'; --16*12=192

-- 2 + '2'
SELECT 2 + to_number('2', 9)
      ,concat(2, '2')
      ,sysdate
FROM dual
WHERE sysdate > '2026/02/03';

-- to_char(날짜, '포맷문자')
SELECT sysdate
      ,to_char(sysdate, 'RRRR-MONTH-DD HH24:MI:SS') to_char
      ,to_date('05/2024/03', 'MM/RRRR/DD') to_date
FROM dual;

-- to_char
SELECT to_char(12345.6789, '099,999.99') -- 반올림 한 연산결과를 문자출력.
FROM dual;

-- 연습1
SELECT studno
      ,name
      ,to_char(birthday, 'DD-MON-RR') birthday
FROM student
WHERE to_char(birthday, 'MM') = '01';

-- nvl()
SELECT nvl(10, 0) -- null ? 0 : 10
FROM dual;

SELECT pay + nvl(bonus, 0) "월급"
FROM professor;

-- student(profno) -> 9999(없으면)/ 담당교수번호
--                    담당교수없음/ 담당교수번호
SELECT nvl(profno, 9999) prof1
      ,nvl(profno||'', '담당교수없음') prof2
FROM student
ORDER BY 1 DESC;

-- decode(A, B, '같은조건', '다른조건')
SELECT decode(10, 20, '같다', '다르다') -- 10 == 20 ? '같다' : '다르다'
FROM dual;

SELECT studno, profno, decode(profno, null, 9999, profno)
FROM student
ORDER BY profno desc;

SELECT decode('C', 'A', '현재A', 'B', '현재B', '기타')
FROM dual;


