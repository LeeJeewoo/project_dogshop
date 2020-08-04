CREATE TABLE MP_BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(100)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(BNO)
);

CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);

create sequence mp_reply_seq START WITH 1 MINVALUE 0;

CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --���� ��ȣ
    BNO NUMBER NOT NULL,                    --�Խ��� ��ȣ
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --���� ���� �̸�
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --����� ���� �̸�
    FILE_SIZE NUMBER,                       --���� ũ��
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --���ϵ����
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--��������
    PRIMARY KEY(FILE_NO)                    --�⺻Ű FILE_NO
);

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

COMMIT;