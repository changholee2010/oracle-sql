SELECT *
FROM emp;

-- 추가작업(origin merge 테스트)
SELECT *
FROM dept;

-- DML (insert, update, delete, merge)
-- 1) insert into table명 (컬럼1, 컬럼2,....) values(값1, 값2,....);
select * from board;
-- 4/ 글등록연습/ user01/ sql연습중
-- insert 완성.
insert into board (board_no, title, content, writer) 
values ((select max(board_no)+1 from board) 
        ,:title
        ,:content
        ,:writer
        );
insert into board
values(9, 'title', 'user02', 'content', sysdate, 0);

select * from board;
select max(board_no)+1 from board;

update board
set    click_cnt = click_cnt + 1
      ,title = :title
      ,content = :content
where board_no = :bno;

delete from board
where content like '%바인드%';

select * from board;

select * from emp order by 1 desc;
-- max+1, 이름, SALESMAN, , 2026-02-01, 3000, 10, 30
insert into emp (empno, ename, job, hiredate, sal, comm, deptno)
values((select max(empno)+1 from emp)
       ,'이창호', 'SALESMAN', to_date('2026-02-01','rrrr-mm-dd')
       ,3000, 10, 30);
-- 30부서의 MANAGER의 사번.
update emp
set    mgr = (select empno from emp
              where deptno = 30
              and   job = 'MANAGER')
where empno = 7935;

select empno from emp
where deptno = 30
and   job = 'MANAGER';

-- 상품테이블(product_tbl)
-- 상품코드, 상품명, 가격, 상품설명, 평점(5,4,3,2,1), 제조사, 등록일자
-- key      nn     nn    nn        3                      sysdate
select *
from product_tbl;

select ('S'||(select lpad(max(substr(product_code, 2, 3)) + 1, 3, '0') from product_tbl))
from dual;
select * from product_tbl
order by 1 desc;

insert into product_tbl (product_code, product_name, price, description,rating)
values ((select ('S'||(select lpad(max(substr(product_code, 2, 3)) + 1, 3, '0') from product_tbl)) from dual)
       ,'새로운상품3'
       ,3000
       ,'새로운상품3 좋습니다'
       ,3);

select 'S'||
  (select lpad(max(substr(product_code, 2, 3)) + 1, 3, '0') from product_tbl) 
from dual;

select * from product_tbl
order by 1 desc;

-- merge into table1
-- using table2
-- on 병합조건
-- when matched then
-- update ...
-- when not matched then
-- insert ...
merge into product_tbl tbl1
using (select :pcode product_code
              ,:pname product_name
              ,:price price
              ,:desc description
       from dual) tbl2
on (tbl1.product_code = tbl2.product_code)
when matched then
  update set 
      tbl1.product_name = tbl2.product_name
     ,tbl1.price = tbl2.price
     ,tbl1.description = tbl2.description
when not matched then
  insert (product_code, product_name, price, description)
  values (tbl2.product_code, tbl2.product_name, tbl2.price, tbl2.description);
