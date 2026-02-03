-- TODO.sql
SELECT ename || '''s sal is $' || sal as "Name And Sal"
FROM emp;
-- 숙제완료.

-- 2026.02.03(화) TODO.

-- 107page, 108page, 113page(nvl2).

-- 학생테이블의 생년월일을 기준으로 1~3 => 1/4분기.
--                              4~6 => 2/4분기.
--                              7~9 => 3/4분기.
--                             10~11 => 4/4분기.
SELECT studno
      ,name
      ,to_char(birthday, 'Q') || '/4분기' quarter1
      ,ceil(to_char(birthday , 'MM') / 3) || '/4분기' quarter2
FROM student;

