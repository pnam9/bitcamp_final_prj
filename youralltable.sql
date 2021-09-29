DROP TABLE CS_BBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CS;

commit;

CREATE TABLE CS_BBS(
SEQ NUMBER(10) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
RDATE DATE NOT NULL,
TYPE NUMBER(1) NOT NULL, --공지사항인지, 답글인지 구분
DEL NUMBER(1) NOT NULL
);


CREATE SEQUENCE SEQ_CS
START WITH 1
INCREMENT BY 1;

ALTER TABLE CS_BBS
ADD CONSTRAINT FK_CS_ID FOREIGN KEY (ID)
REFERENCES MEMBER(ID);

commit;


--MEMBER
DROP TABLE MEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MEMBER;


CREATE TABLE MEMBER(
SEQ NUMBER(5)  NOT NULL,
ID VARCHAR2(50) PRIMARY KEY,
PWD VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
NICKNAME  VARCHAR2(50)  UNIQUE NOT NULL,
BIRTH VARCHAR2(50) NOT NULL,
GENDER VARCHAR2(20) NOT NULL,
PHONE VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(50) NOT NULL,
ADDRESS1 VARCHAR2(100) NOT NULL,
ADDRESS2 VARCHAR2(100),
ADDRESS3 VARCHAR2(100),
SNS_TYPE VARCHAR2(100),
AUTH NUMBER(1) NOT NULL,	-- 0일반회원 1 관리자 3 탈퇴
JOINDATE DATE NOT NULL --가입일
);

CREATE SEQUENCE SEQ_MEMBER
START WITH 1
INCREMENT BY 1;


commit;
--쿠킹클래스 게시물 DB

DROP TABLE COOKCLASS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COOKCLASS;

CREATE TABLE COOKCLASS(
SEQ NUMBER(10) PRIMARY KEY,	
NICKNAME VARCHAR2(50) NOT NULL,	-- 작성자 닉네임
TITLE VARCHAR2(50) NOT NULL, --클래스 이름
LOCATION VARCHAR2(100) NOT NULL, --클래스 장소
KINDS VARCHAR2(40) NOT NULL, --클래스 카테고리
READCOUNT NUMBER(10) NOT NULL, --조회수
CONTENT VARCHAR2(4000) NOT NULL, --상세내용
MEMBERNUM NUMBER(10) NOT NULL, --모집인원수
RDATE DATE NOT NULL,	--작성날짜
EDATE DATE NOT NULL, --마감날짜
CDATE DATE NOT NULL, -- 클래스 시작날짜
FILENAME VARCHAR2(50) NOT NULL, --원본파일 이름
NEWFILENAME VARCHAR2(50) NOT NULL, --변형파일 이름
DEL NUMBER(10) NOT NULL --삭제 유무 기본 0 삭제 1
);
-----

CREATE SEQUENCE SEQ_COOKCLASS
START WITH 1
INCREMENT BY 1;

ALTER TABLE COOKCLASS
ADD CONSTRAINT FK_COOKCLASS_NICKNAME FOREIGN KEY (NICKNAME)
REFERENCES MEMBER(NICKNAME);

---

--클래스참여 DB

DROP TABLE CLASSMEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CLASSMEMBER;


CREATE TABLE CLASSMEMBER(
SEQ NUMBER(10) PRIMARY KEY,	
SEQ_CLASS NUMBER(10) NOT NULL, --어떤 클래스의 댓글인가
NICKNAME VARCHAR2(50) NOT NULL,	-- 참가한 닉네임
GENDER VARCHAR2(20) NOT NULL -- 가입될 때 받을 성별
);

CREATE SEQUENCE SEQ_CLASSMEMBER
START WITH 1
INCREMENT BY 1;

ALTER TABLE CLASSMEMBER
ADD CONSTRAINT FK_CLASSMEMBER_NICKNAME FOREIGN KEY (NICKNAME)
REFERENCES MEMBER(NICKNAME);

ALTER TABLE CLASSMEMBER
ADD CONSTRAINT FK_CLASSMEMBER_SEQ_CLASS FOREIGN KEY (SEQ_CLASS)
REFERENCES COOKCLASS(SEQ);



--댓글 DB

DROP TABLE COMMENT_CLASS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COMMENT_CLASS;


CREATE TABLE COMMENT_CLASS(
SEQ NUMBER(10) PRIMARY KEY, --댓글의 시퀀스
NICKNAME VARCHAR2(50) NOT NULL, --작성자
SEQ_CL NUMBER(10), --어떤 클래스의 댓글인가
CONTENT VARCHAR2(1000) NOT NULL, --댓글내용
RDATE DATE NOT NULL, --작성날짜
DEL NUMBER(1) NOT NULL, --삭제유무
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_COMMENT_CLASS
START WITH 1
INCREMENT BY 1;

ALTER TABLE COMMENT_CLASS
ADD CONSTRAINT FK_COMMENT_CLASS_NICKNAME FOREIGN KEY (NICKNAME)
REFERENCES MEMBER(NICKNAME);

ALTER TABLE COMMENT_CLASS
ADD CONSTRAINT FK_COMMENT_CLASS_SEQ_CL FOREIGN KEY (SEQ_CL)
REFERENCES COOKCLASS(SEQ);



--RECIPE	레시피게시판

DROP TABLE RECIPE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_RECIPE;


CREATE TABLE RECIPE(
SEQ NUMBER(20) PRIMARY KEY,              --게시글번호
ID VARCHAR2(50)    NOT NULL,                    --작성자
RECIPETITLE  VARCHAR2(200) NOT NULL,     --레시피제목
BESTIMG   VARCHAR2(200) NOT NULL,         --대표이미지
NEWBESTIMG VARCHAR2(200) NOT NULL,
RECINTRODUCE VARCHAR2(2000) NOT NULL,   --레시피소개
RECCATEGORY VARCHAR2(50) NOT NULL,     --레시피카테고리
RECPERSON  VARCHAR2(50) NOT NULL,       --몇인분
RECTIME    VARCHAR2(50)  NOT NULL,         --조리시간
RECLEVEL     VARCHAR2(50)  NOT NULL,      --조리난이도
INGREDIENT  VARCHAR2(200)  NOT NULL,     --재료
READCOUNT NUMBER(8) NOT NULL,          --조회수
LIKED NUMBER(10) NOT NULL ,           --좋아요
RECCONTENT VARCHAR2(2000) NOT NULL,   --요리순서 글
RECCONTENT_B VARCHAR2(2000) , 
RECCONTENT_C VARCHAR2(2000) , 
RECCONTENT_D VARCHAR2(2000) , 
RECCONTENT_E VARCHAR2(2000) , 
RECCONTENT_F VARCHAR2(2000) , 

RECIMG   VARCHAR2(200),          --요리순서 이미지1
NEWRECIMG VARCHAR2(200),    --default 'aaa.png'
RECIMG_B   VARCHAR2(200),          --요리순서 이미지2
NEWRECIMG_B VARCHAR2(200),    
RECIMG_C   VARCHAR2(200),          --요리순서 이미지3
NEWRECIMG_C VARCHAR2(200),    
RECIMG_D  VARCHAR2(200),          --요리순서 이미지4
NEWRECIMG_D VARCHAR2(200),   
RECIMG_E   VARCHAR2(200),          --요리순서 이미지5
NEWRECIMG_E VARCHAR2(200),   
RECIMG_F   VARCHAR2(200),          --요리순서 이미지6
NEWRECIMG_F VARCHAR2(200),
DEL NUMBER(20) NOT NULL
);

CREATE SEQUENCE SEQ_RECIPE
START WITH 1 INCREMENT BY 1;

ALTER TABLE RECIPE
ADD CONSTRAINT FK_RECIPE_NAME FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

commit;
---


DROP TABLE RECCOMMENTDB
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_RECCOMMENTDB;

CREATE TABLE RECCOMMENTDB (
SEQ  NUMBER(8) PRIMARY KEY,       --번호
BBSID NUMBER(8) NOT NULL,     	  --게시판번호
ID  VARCHAR2(50) NOT NULL,     	  --작성자---------------
RDATE    DATE NOT NULL,         	  --작성일
CONTENT VARCHAR2(500)  NOT NULL ,   --내용
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,             
DEPTH NUMBER(8) NOT NULL,  
DEL NUMBER(1) NOT NULL               --삭제
);

CREATE SEQUENCE SEQ_RECCOMMENTDB
START WITH 1 INCREMENT BY 1;

ALTER TABLE RECCOMMENTDB
ADD CONSTRAINT FK_COM_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

ALTER TABLE RECCOMMENTDB
ADD CONSTRAINT FK_COM_BBSID FOREIGN KEY(BBSID)
REFERENCES RECIPE(SEQ);

commit;
---

DROP TABLE LIKED
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_LIKED;


CREATE TABLE LIKED(			               --좋아요
SEQ NUMBER(10) PRIMARY KEY ,		      --번호
ID VARCHAR2(50) NOT NULL,		          --작성자
SEQ_RECIPE NUMBER(10) NOT NULL	      --레시피글 번호
);

CREATE SEQUENCE SEQ_LIKED
START WITH 1
INCREMENT BY 1;

ALTER TABLE LIKED				
ADD CONSTRAINT FK_LIKED_ID FOREIGN KEY (ID)
REFERENCES MEMBER(ID);

ALTER TABLE LIKED				
ADD CONSTRAINT FK_LIKED_SEQ FOREIGN KEY (SEQ_RECIPE)
REFERENCES RECIPE(SEQ);



DROP TABLE MARKET
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MARKET;
DROP SEQUENCE ITEMNUM_MARKET;

CREATE TABLE MARKET(
SEQ NUMBER(20) NOT NULL,    --상품게시글 번호
CANUM NUMBER(8)  NOT NULL,   --상품 카테고리 번호 (육류,생선,야채)
ITEMNUM NUMBER(8) PRIMARY KEY,  --상품 번호
TITLE VARCHAR2(100) NOT NULL,     --상품명
SUBTITLE VARCHAR2(100) NOT NULL, -- 서브 상품명
PRICE NUMBER(20) NOT NULL,     --상품 가격
GRAM VARCHAR2(20) NOT NULL,   --상품 용량,중량
COUNTRY VARCHAR2(30) NOT NULL,  --상품 원산지
EXPIRATION VARCHAR2(200) NOT NULL,  --상품 유통기한
COUNT NUMBER(8) NOT NULL,      --상품 수량
CONTENT VARCHAR2(50) NOT NULL,   --게시글 내용
MAINPT VARCHAR2(50) NOT NULL,  --상품 썸네일 사진
NEWMAINPT VARCHAR2(50) NOT NULL, --상품 썸네일 사진
RVCOUNT NUMBER(20) NOT NULL,     -- 리뷰 갯수
RDATE DATE NOT NULL          --상품 등록일
);

CREATE SEQUENCE SEQ_MARKET    --시퀀스 값
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE ITEMNUM_MARKET    --아이템넘버 시퀀스 값
START WITH 100 INCREMENT BY 1;


--장바구니

DROP TABLE CART
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CART;
DROP SEQUENCE ORDERNUM_CART;


CREATE TABLE CART(
SEQ NUMBER(20) NOT NULL,    --장바구니 상품번호
ID VARCHAR2(50) NOT NULL,    -- 회원아이디
CHECKNUM NUMBER(2) NOT NULL,  --결제 확인용
CANUM NUMBER(2)  NOT NULL,   --상품 카테고리 번호 (육류,생선,야채)
ITEMNUM NUMBER(8) NOT NULL,  --상품 번호 (MARKET에 ITEMNUM 와 연결)
MAINPT VARCHAR2(50) NOT NULL,  --상품 썸네일 사진
TITLE VARCHAR2(50) NOT NULL,     --상품명
COUNT NUMBER(8) NOT NULL,      --상품 수량
PRICE NUMBER(20) NOT NULL,     --상품 가격
ADDRESS VARCHAR2(50) NOT NULL              --배송지

);

--마켓테이블 ITEMNUM (상품번호)와 카트테이블 ITEMNUM (장바구니 상품번호)를 연결

ALTER TABLE CART
ADD CONSTRAINT FK_CART_ITEMNUM  FOREIGN KEY(ITEMNUM )
REFERENCES MARKET(ITEMNUM );

ALTER TABLE CART
ADD CONSTRAINT FK_CART_MEMID  FOREIGN KEY(ID )
REFERENCES MEMBER(ID );

-- 장바구니 상품번호 1씩증가

CREATE SEQUENCE SEQ_CART
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE ORDERNUM_CART
START WITH 1000 INCREMENT BY 1;

commit;
-- 결제완료

DROP TABLE INCOME
CASCADE CONSTRAINTS;

DROP SEQUENCE ORDERNUM_INCOME;
DROP SEQUENCE SEQ_INCOME;

CREATE TABLE INCOME(
SEQ NUMBER(20) NOT NULL,
ORDERNUM NUMBER(20) NOT NULL,  --주문번호
TITLE VARCHAR2(50) NOT NULL,    --상품명
PRICE NUMBER(20) NOT NULL,     --상품 가격
CANUM NUMBER(2)  NOT NULL,   --상품 카테고리 번호 (육류,생선,야채)
PDATE DATE NOT NULL  --결제일
);

CREATE SEQUENCE SEQ_INCOME
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE ORDERNUM_INCOME
START WITH 1000 INCREMENT BY 1;


commit;