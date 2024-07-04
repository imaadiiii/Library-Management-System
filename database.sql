drop table FACULTY cascade constraint;
drop table PERIODICALS cascade constraint;
drop table WRITES cascade constraint;
drop table BOOK cascade constraint;
drop table AUTHOR cascade constraint;
drop table STAFF cascade constraint;
drop table LIBRARIAN cascade constraint;
drop table STUDENT cascade constraint;
drop table ISSUE_BY_FACULTY cascade constraint;
drop table ISSUE_BY_STUDENT cascade constraint;

CREATE TABLE AUTHOR(
AUTHOR_ID NUMBER(4) CONSTRAINT PK_AID PRIMARY KEY,
AUTHOR_NAME VARCHAR(30),
DOB DATE,
ADDRESS VARCHAR2(30) ,
EXPERIENCE NUMBER(4)
);



CREATE TABLE BOOK(
BOOK_CODE VARCHAR2(4) CONSTRAINT PK_BK PRIMARY KEY,
BOOK_NAME VARCHAR2(50),
AUTHOR NUMBER(3) REFERENCES AUTHOR,
DATE_OF_PURCHASE DATE,
PRICE NUMBER(4),
SUBJECT_CODE VARCHAR2(3) NOT NULL,
RACK_NO NUMBER(4) CHECK (RACK_NO>0),
NO_OF_BOOKS NUMBER(4)
);



CREATE TABLE FACULTY(
FACULTY_ID NUMBER(4) CONSTRAINT PK_FAC PRIMARY KEY,
NAME VARCHAR2(10) NOT NULL,
ADDRESS VARCHAR(25),
PHONE_NO NUMBER(10),
DEPARTMENT VARCHAR(4) NOT NULL
);



CREATE TABLE PERIODICALS(
ID VARCHAR2(4) CONSTRAINT PK_ID PRIMARY KEY,
NAME VARCHAR2(50),
MONTH_OF_RELEASE VARCHAR2(5),
PUBLISHER_NAME VARCHAR2(50)
);



CREATE TABLE WRITES(
AUTHOR_ID NUMBER CONSTRAINT FK_AID REFERENCES AUTHOR,
BOOK_CODE VARCHAR2(15) CONSTRAINT FK_BK REFERENCES BOOK);



CREATE TABLE STAFF(
STAFF_ID NUMBER(4) CONSTRAINT PK_STF PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL,
DOB DATE,
ADDRESS VARCHAR(25),
DESIGNATION VARCHAR2(15),
SALARY NUMBER(8),
DATE_OF_JOINING DATE
);



CREATE TABLE STUDENT(
STUDENT_ID NUMBER(4) CONSTRAINT PK_STD PRIMARY KEY,
NAME VARCHAR2(20) CONSTRAINT PK_NAME NOT NULL,
BRANCH VARCHAR2(15) NOT NULL,
FINE NUMBER(5) CHECK(FINE > 0),
ADDRESS VARCHAR(20),
PHONE_NO NUMBER(10) NOT NULL,
ISSUE_DATE DATE,
EXPIRY_DATE DATE, CONSTRAINT VALID_EXP CHECK(EXPIRY_DATE > ISSUE_DATE));



CREATE TABLE ISSUE_BY_STUDENT(
ISSUE_DATE DATE,
RETURN_DATE DATE, CONSTRAINT R_ID check(RETURN_DATE>ISSUE_DATE),
STUDENT_ID NUMBER(6) CONSTRAINT FK_SID REFERENCES STUDENT,
BOOK_CODE VARCHAR2(15) CONSTRAINT FK_SBC REFERENCES BOOK
);



CREATE TABLE LIBRARIAN(
ADMIN_LOGIN NUMBER(5) CONSTRAINT PK_ADM PRIMARY KEY,
PASSWORD VARCHAR2(15) CONSTRAINT VALID_PW CHECK(LENGTH(PASSWORD) > 8)
);



CREATE TABLE ISSUE_BY_FACULTY(
ISSUE_DATE DATE,
RETURN_DATE DATE, CHECK (RETURN_DATE > ISSUE_DATE),
FACULTY_ID NUMBER CONSTRAINT FK_FID REFERENCES FACULTY,
BOOK_CODE VARCHAR2(15) CONSTRAINT FK_FBC REFERENCES BOOK
);