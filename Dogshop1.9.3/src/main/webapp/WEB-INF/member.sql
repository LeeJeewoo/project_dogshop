


CREATE TABLE PRODUCT_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    PNO NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);
COMMIT;

CREATE SEQUENCE SEQ_PRODUCT_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;


CREATE TABLE DS_PRODUCT(
    PNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    TYPE VARCHAR2(50)    NOT NULL,
    SEX VARCHAR2(10)     NOT NULL,
    AGE VARCHAR2(20)     NOT NULL,
    PRICE  NUMBER(10) NOT NULL,
    BREED VARCHAR2(50) NOT NULL,
    INOCULATION VARCHAR2(100) NOT NULL,
    SHAPE VARCHAR2(10) NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(PNO)
);

CREATE SEQUENCE DS_PRODUCT_SEQ START WITH 0 MINVALUE 0;




CREATE TABLE DS_MEMBER(
    USERID VARCHAR2(40) NOT NULL,	
    USERPASS VARCHAR2(100)     NOT NULL,	
    USERNAME VARCHAR2(40)  NOT NULL,	
    USERGEN  VARCHAR2(20)          NOT NULL,	
    USERTEL VARCHAR2(100)  NOT NULL,
    USERMAIL VARCHAR2(300)  NOT NULL,
    USEROADDRESS VARCHAR2(100)  NOT NULL,	
    USERDATEADDRESS VARCHAR2(100)  NOT NULL,	
    USERADDRESS VARCHAR2(100)  NOT NULL,	
    USERBIRTH VARCHAR2(100)  NOT NULL,	
    PRIMARY KEY(USERID)
);


