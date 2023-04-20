-- department table 생성
CREATE TABLE department (
depno NUMBER(10) NOT NULL PRIMARY KEY,
deptname VARCHAR2(20),
manager VARCHAR2(20)
);

-- employee table 생성
CREATE TABLE employee (
empno NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20),
phoneno NUMBER(10),
address VARCHAR2(20),
sex VARCHAR2(20),
position VARCHAR2(20),
deptno NUMBER(10),
FOREIGN KEY (deptno) REFERENCES department(depno)
);

-- project table 생성
CREATE TABLE project (
projno NUMBER(10) NOT NULL PRIMARY KEY,
projname VARCHAR2(20),
deptno NUMBER(10),
FOREIGN KEY (deptno) REFERENCES department(depno)
);

-- works table 생성
CREATE TABLE works (
projno NUMBER(10) NOT NULL,
empno NUMBER(10) NOT NULL,
hoursworked NUMBER(10),
PRIMARY KEY (projno, empno),
FOREIGN KEY (projno) REFERENCES project(projno),
FOREIGN KEY (empno) REFERENCES employee(empno)
);

-- department table 데이터
INSERT INTO department (depno, deptname, manager) VALUES
(1, 'IT', '고남순');
INSERT INTO department (depno, deptname, manager) VALUES
(2, 'Marketing', '홍길동');

-- employee table 데이터
INSERT INTO employee (empno, name, phoneno, address, sex, position, deptno) VALUES
(1, '김덕성', 01012341232, '서울', '여', 'Programmer', 1);
INSERT INTO employee (empno, name, phoneno, address, sex, position, deptno) VALUES
(2, '이서울', 01012323122, '서울', '남', 'Programmer', 1);
INSERT INTO employee (empno, name, phoneno, address, sex, position, deptno) VALUES
(3, '박연세', 01076851231, '대전', '여', 'Salesperson', 2);
INSERT INTO employee (empno, name, phoneno, address, sex, position, deptno) VALUES
(4, '홍길동', 01012341546, '서울', '남', 'Manager', 2);
INSERT INTO employee (empno, name, phoneno, address, sex, position, deptno) VALUES
(5, '고남순', 01012311112, '서울', '여', 'Manager', 1);

-- project table 데이터
INSERT INTO project (projno, projname, deptno) VALUES
(1, '데이터베이스', 1);
INSERT INTO project (projno, projname, deptno) VALUES
(2, '시장조사', 2);

-- works table 데이터
INSERT INTO works (projno, empno, hoursworked) VALUES
(1, 3, 3);
INSERT INTO works (projno, empno, hoursworked) VALUES
(1, 2, 1);
INSERT INTO works (projno, empno, hoursworked) VALUES
(2, 3, 1);
INSERT INTO works (projno, empno, hoursworked) VALUES
(2, 4, 5);
INSERT INTO works (projno, empno, hoursworked) VALUES
(1, 5, 1);