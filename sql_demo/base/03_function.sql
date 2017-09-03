-- ## 单行函数

SQL> -- 字符函数

SQL> select lower('hello WorLd') 转小写,upper ('hello WorLd') 转大写,initcap('HelLo worLd') 首字母大写
       2  from dual;

转小写      转大写      首字母大写
----------- ----------- -----------
hello world HELLO WORLD Hello World

已选择 1 行。

SQL> -- substr
SQL> -- sbustr(a,b) 从a中，第b位开始取，取右边所有的字符
SQL> select substr('hello world',4,4) from dual;

SUBS
----
lo w

SQL> -- length 字符数 lengthb 字节数


1* select length('你好') 字符数, lengthb('你好') 字节数 from dual
SQL> /

字符数     字节数
---------- ----------
2          4

SQL>
SQL> --instr
SQL> --在母串中查找子串，找到返回下标（从1开始），否则返回0


SQL> select instr('hello world','ll') from dual;

INSTR('HELLOWORLD','LL')
------------------------
3

SQL> select instr('hello world','lo') from dual;

INSTR('HELLOWORLD','LO')
------------------------
4

SQL> --lpad 左填充， rpad右填充
SQL> select lpad('abc',10,'*') 左填充,rpad('abc',10,'*') 右填充
       2  from dual；
3  ;
from dual；
*
第 2 行出现错误:
ORA-00911: 无效字符


SQL> select lpad('abc',10,'*') 左填充,rpad('abc',10,'*') 右填充
       2  from dual;

左填充     右填充
---------- ----------
*******abc abc*******

SQL> --trim 去掉前后指定的字符
SQL> select trim('h' from 'hello world') from dual;

TRIM('H'FR                                                 )
----------
ello world

SQL> --replace
SQL> select replace('hello world','l',' ') from dual;

REPLACE('HE       '               )
-----------
he  o wor d
SQL>


SQL> --数字函数  (ROUND, TRUNC )

1  select ROUND(54.456,2) no1,ROUND(23.643,1) no2,ROUND(24.21,0) no3,ROUND(2.43,-1) no4
     2* from dual
SQL> /

NO1        NO2        NO3        NO4
---------- ---------- ---------- ----------
54.46       23.6         24          0

SQL> ed
已写入 file afiedt.buf

1  select ROUND(54.456,2) no1,ROUND(23.643,1) no2,ROUND(24.21,0) no3,ROUND(222.43,-1) no4
     2* from dual
SQL> /

NO1        NO2        NO3        NO4
---------- ---------- ---------- ----------
54.46       23.6         24        220

SQL> --TRUNC 截断
SQL> ed
已写入 file afiedt.buf

1  select TRUNC(54.456,2) no1, TRUNC(23.643,1) no2, TRUNC(24.21,0) no3, TRUNC(222.43,-1) no4
     2* from dual
SQL> /

NO1        NO2        NO3        NO4
---------- ---------- ---------- ----------
54.45       23.6         24        220

SQL> --时间的截断
SQL>
SQL> --MOD 取余
SQL> host cls

SQL> -- 日期函数
SQL> select sysdate from dual；
2
SQL> select sysdate from dual;

SYSDATE
--------------
01-8月 -13

SQL> select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;

TO_CHAR(SYSDATE,'YY                ')
-------------------
2013-08-01 15:35:35

SQL> select systimestamp from dual;

SYSTIMESTAMP
---------------------------------------------------------------------------
31-8月 -17 05.13.33.154665 下午 +08:00

已选择 1 行。


SQL> select to_char(systimestamp,'yyyy-mm-dd hh24:mi:ss*ff') from dual;

TO_CHAR(SYSTIMESTAMP,'YYYY-MM     '
-----------------------------
2017-08-31 17:17:37*897684

已选择 1 行。



SQL> -- systimestamp 时间戳
SQL> -- orcl内部的计时器
SQL>
SQL> -- 昨天 今天 明天


SQL> select (sysdate-1) 昨天, sysdate 今天, sysdate+1 明天
  2  from dual;

昨天           今天           明天
-------------- -------------- --------------
31-7月 -13     01-8月 -13     02-8月 -13

SQL> -- 员工的工龄

  1  select ename, hiredate, (sysdate-hiredate) 天, (sysdate-hiredate)/7 星期
  2* from emp
SQL> /

ENAME      HIREDATE               天       星期
---------- -------------- ---------- ----------
SMITH      17-12月-80     11915.6567 1702.23667
ALLEN      20-2月 -81     11850.6567 1692.95095
WARD       22-2月 -81     11848.6567 1692.66524
JONES      02-4月 -81     11809.6567 1687.09381
MARTIN     28-9月 -81     11630.6567 1661.52238
BLAKE      01-5月 -81     11780.6567 1682.95095
CLARK      09-6月 -81     11741.6567 1677.37952
SCOTT      19-4月 -87     9601.65666 1371.66524
KING       17-11月-81     11580.6567 1654.37952
TURNER     08-9月 -81     11650.6567 1664.37952
ADAMS      23-5月 -87     9567.65666 1366.80809

ENAME      HIREDATE               天       星期
---------- -------------- ---------- ----------
JAMES      03-12月-81     11564.6567 1652.09381
FORD       03-12月-81     11564.6567 1652.09381
MILLER     23-1月 -82     11513.6567 1644.80809

已选择14行。

SQL> select last_day(sysdate) from dual;

LAST_DAY(SYSDA        )
--------------
31-8月 -13

SQL> -- MONTHS_BETWEEN 计算工龄


SQL> select (sysdate-hiredate)/30 no1, MONTHS_BETWEEN(sysdate,hiredate) no2
  2  from emp;

       NO1        NO2
---------- ----------
397.188887 391.505375
395.022221 389.408601
394.955554 389.344085
393.655554 387.989246
387.688887 382.150536
392.688887        387
391.388887 385.763439
320.055554 315.440859
386.022221 380.505375
388.355554 382.795697
318.922221 314.311826

       NO1        NO2
---------- ----------
385.488887 379.956988
385.488887 379.956988
383.788887 378.311826

已选择14行。

SQL>
SQL> -- 114月后
SQL> select ADD_MONTHS(sysdate,114) from dual;

ADD_MONTHS(SYS
--------------
28-2月 -27

已选择 1 行。

SQL> -- 从今天开始算(2013-8-1),星期四，下一个星期四
SQL> select NEXT_DAY(sysdate,'星期四') from dual;

NEXT_DAY(SYSDA  )
--------------
08-8月 -13

SQL> --下个星期一
SQL> select NEXT_DAY(sysdate,'星期一') from dual;

NEXT_DAY(SYSDA )
--------------
05-8月 -13
SQL> --对日期进行四舍五入

SQL> select round(sysdate,'month') no1,round(sysdate,'year') no2,trunc(sysdate,'year') no3
2  from dual;

NO1            NO2            NO3
-------------- -------------- --------------
01-8月 -13     01-1月 -14     01-1月 -13

SQL> --隐性转换的前提，被转换对象是可以转换的
SQL> --显式转换
SQL> --2013-08-01 16:26:12 今天是星期一
SQL> select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss "今天是"day') from dual;

TO_CHAR(SYSDATE,'YYYY-MM-DDHH24:MI:                        ')
-----------------------------------
2013-08-01 16:28:32 今天是星期四

SQL>
SQL> --查询员工的薪水 货币符号，两位小数，千位符
SQL> select sal, to_char(sal,'L9,999.99') from emp;



SQL> --通用函数
SQL> --nvl2(a,b,c) 当a=null时，返回c，否则返回b
SQL> select sal*12+nvl2(comm,comm,0) from emp;

SAL*12+NVL2(COMM,COMM,0)
------------------------
9600
19500
15500
35700
16400
34200
29400
36000
60000
18000
13200

SAL*12+NVL2(COMM,COMM,0)
------------------------
11400
36000
15600

已选择14行。

SQL> --nullif(a,b) 当a=b时，返回null，否则返回a
SQL> select nullif('abc','abc') from dual;

NUL
---


SQL> select nullif('abc','abcd') from dual;

NUL
---
abc

SQL> select coalesce('','1','','2') from dual;

C
-
1

SQL> --从左至右找到第一个不为null的值
SQL> select sal,comm,coalesce(comm,sal) from emp;

SAL       COMM COALESCE(COMM,SAL)
---------- ---------- ------------------
800                           800
1600        300                300
1250        500                500
2975                          2975
1250       1400               1400
2850                          2850
2450                          2450
3000                          3000
5000                          5000
1500          0                  0
1100                          1100

SAL       COMM COALESCE(COMM,SAL)
---------- ---------- ------------------
950                           950
3000                          3000
1300                          1300

已选择14行。

SQL> select sal,comm,coalesce(sal,comm) from emp;

SAL       COMM COALESCE(SAL,COMM)
---------- ---------- ------------------
800                           800
1600        300               1600
1250        500               1250
2975                          2975
1250       1400               1250
2850                          2850
2450                          2450
3000                          3000
5000                          5000
1500          0               1500
1100                          1100

SAL       COMM COALESCE(SAL,COMM)
---------- ---------- ------------------
950                           950
3000                          3000
1300                          1300

已选择14行。

SQL>
SQL>
SQL>
SQL> --条件表达式
SQL> if-then-else   )

SQL> --CASE表达式
SQL> --DECODE函数
SQL> ---case,sql99的语法，类似basic，比较繁琐
SQL> ---decode，oracle自己的语法，类似java，比较简洁
SQL>
SQL> --根据职位涨工资，总裁1000，经理800，其他400
SQL> select ename,job,sal 涨前薪水，case job when 'PRESIDENT' then sal+1000
2  					when 'MANAGER' then sal+800
3  					else sal+400
4  					END 涨后薪水
5  from emp;
)
ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
SMITH      CLERK            800       1200
ALLEN      SALESMAN        1600       2000
WARD       SALESMAN        1250       1650
JONES      MANAGER         2975       3775
MARTIN     SALESMAN        1250       1650
BLAKE      MANAGER         2850       3650
CLARK      MANAGER         2450       3250
SCOTT      ANALYST         3000       3400
KING       PRESIDENT       5000       6000
TURNER     SALESMAN        1500       1900
ADAMS      CLERK           1100       1500

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
JAMES      CLERK            950       1350
FORD       ANALYST         3000       3400
MILLER     CLERK           1300       1700

已选择14行。

SQL> ED
已写入 file afiedt.buf

1  select ename,job,sal 涨前薪水，decode(job,'PRESIDENT',sal+1000,
2  					'MANAGER',sal+800,
3  						sal+400)涨后薪水
4* from emp
SQL> /

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
SMITH      CLERK            800       1200
ALLEN      SALESMAN        1600       2000
WARD       SALESMAN        1250       1650
JONES      MANAGER         2975       3775
MARTIN     SALESMAN        1250       1650
BLAKE      MANAGER         2850       3650
CLARK      MANAGER         2450       3250
SCOTT      ANALYST         3000       3400
KING       PRESIDENT       5000       6000
TURNER     SALESMAN        1500       1900
ADAMS      CLERK           1100       1500

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
JAMES      CLERK            950       1350
FORD       ANALYST         3000       3400
MILLER     CLERK           1300       1700

已选择14行。


=======================================================================================


---4.组函数


SQL> --工资总额
SQL> select sum(sal) from emp;

SUM(SAL)
----------
29025

SQL> --人员总数
SQL> select count(*) from emp;

COUNT(*)
----------
14

SQL> --平均工资
SQL> select sum(sal)/count(*) no1,avg(sal) no2 from emp;

NO1        NO2
---------- ----------
2073.21429 2073.21429

SQL> --?什么情况下sum/count和avg不一样
SQL> --平均奖金
SQL> select sum(comm)/count(*) no1,sum(comm)/count(comm) no2, avg(comm) from emp;

NO1        NO2  AVG(COMM)
---------- ---------- ----------
157.142857        550        550

SQL> --null
SQL> --null 的第四点，组函数会自动虑空

SQL> select count(*),count(nvl(comm,0)) from emp;

COUNT(*) COUNT(NVL(COMM,0))
---------- ------------------
14                 14

SQL> select avg(nvl(comm,0)) from emp;

AVG(NVL(COMM,0))
----------------
157.142857

SQL> --求各个部门的平均工资
SQL> select deptno ,avg(sal)
       2  from emp
3  group by deptno;

DEPTNO   AVG(SAL)
---------- ----------
30 1566.66667
20       2175
10 2916.66667

SQL> --语法，
SQL> /*
SQL> select a,b,c,avg(a)
SQL> from **
SQL> group by a,b,c;
SQL> */
SQL> select deptno,avg(sal)
       2  from emp
3  group by deptno,job;

DEPTNO   AVG(SAL)
---------- ----------
20        950
30       1400
20       2975
30        950
10       5000
30       2850
10       1300
10       2450
20       3000

已选择9行。

SQL> ed
已写入 file afiedt.buf

1  select deptno,job,avg(sal)
     2  from emp
3* group by deptno,job
SQL> /

DEPTNO JOB         AVG(SAL)
---------- --------- ----------
20 CLERK            950
30 SALESMAN        1400
20 MANAGER         2975
30 CLERK            950
10 PRESIDENT       5000
30 MANAGER         2850
10 CLERK           1300
10 MANAGER         2450
20 ANALYST         3000

已选择9行。

SQL> --group by 多列，
SQL> --先按照第一列分，如果第一列相同，再按照第二列，依次类推

SQL> select deptno,job,avg(sal)
       2  from emp
3  group by deptno,job
4  order by 1;

DEPTNO JOB         AVG(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
20 ANALYST         3000
20 CLERK            950
20 MANAGER         2975
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        1400

已选择9行。


SQL> --having
SQL> select deptno,avg(sal)
       2  from emp
3  group by deptno;

DEPTNO   AVG(SAL)
---------- ----------
30 1566.66667
20       2175
10 2916.66667

SQL> --查询平均工资大于2000的部门
SQL> ed
已写入 file afiedt.buf

1  select deptno,avg(sal)
     2  from emp
3  group by deptno
4* having avg(sal)>2000

SQL> /

DEPTNO   AVG(SAL)
---------- ----------
20       2175
10 2916.66667

SQL> --having,过滤分组
SQL> --前提是要分组
SQL> --having和where的区别
SQL> --求10号部门的平均工资
SQL> ed
已写入 file afiedt.buf

1  select deptno,avg(sal)
     2  from emp
3  group by deptno
4* having deptno=10
SQL> /

DEPTNO   AVG(SAL)
---------- ----------
10 2916.66667


SQL> ed
已写入 file afiedt.buf

1  select deptno,avg(sal)
     2  from emp
3  where deptno=10
4* group by deptno
5
SQL> /

DEPTNO   AVG(SAL)
---------- ----------
10 2916.66667

SQL> --sql 优化，3，尽量使用where
SQL> --一种情况比较特殊，使用having
SQL> --如果条件中含有组函数，只能使用having
SQL>
SQL>
SQL> --group by 增强
SQL> /*
SQL> group by deptno,job
SQL> group by deptno
SQL> group by null
SQL> =
SQL> group by rollup(deptno,job)
SQL> */
SQL> select deptno,job,sum(sal)
       2  from emp
3  group by rollup(deptno,job);

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 CLERK           1900
20 ANALYST         6000
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。

SQL> --sql plus ,支持报表功能
SQL> break on deptno skip 2
SQL> select deptno,job,sum(sal)
       2  from emp
3  group by rollup(deptno,job);

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
MANAGER         2450
PRESIDENT       5000
8750


20 CLERK           1900
ANALYST         6000
MANAGER         2975
10875


DEPTNO JOB         SUM(SAL)
---------- --------- ----------

30 CLERK            950
MANAGER         2850
SALESMAN        5600
9400


29025



已选择13行。

SQL> break on null

SQL> /*
SQL> group by rollup(a,b)
SQL> =
SQL> group by a,b
SQL> +
SQL> group by a
SQL> +
SQL> group by null
SQL> */
SQL>
SQL>
SQL> 组函数会自动滤空