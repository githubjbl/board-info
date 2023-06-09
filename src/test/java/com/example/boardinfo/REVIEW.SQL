-- 리뷰 테이블 SQL
CREATE TABLE REVIEW                                         -- 게임 및 모임 후기
(
    REG_NUM       NUMBER        NOT NULL
        CONSTRAINT REVIEW_PK
            PRIMARY KEY,                                    -- 리뷰 테이블 PK
    CATEGORY      VARCHAR2(100)                NOT NULL,    -- GAME 리뷰 OR 모임 리뷰
    VIEWS         NUMBER       DEFAULT 0       NOT NULL,    -- 조회수
    TITLE         VARCHAR2(100)                NOT NULL,    -- 리뷰 제목
    REVIEW_DETAIL VARCHAR2(4000),                           -- 리뷰 내용 (사진 포함)
    DEL           VARCHAR2(10) DEFAULT 'N'     NOT NULL,    -- 삭제 여부 (기본값 : N)
    CREATE_USER   VARCHAR2(100)                NOT NULL,    -- 작성자 → 회원 테이블의 PK와 조인 예정
    CREATE_DATE   DATE         DEFAULT SYSDATE NOT NULL,    -- 작성 일자
    UPDATE_USER   VARCHAR2(100),                            -- 수정자
    UPDATE_DATE   DATE                                      -- 수정 일자
);

COMMENT ON TABLE REVIEW                 IS '커뮤니티';
COMMENT ON COLUMN REVIEW.REG_NUM        IS '커뮤니티 테이블 PK';
COMMENT ON COLUMN REVIEW.CATEGORY       IS '게임포럼 (게임후기, 노하우, 질문), 자유게시판';
COMMENT ON COLUMN REVIEW.VIEWS          IS '조회수';
COMMENT ON COLUMN REVIEW.TITLE          IS '리뷰 제목';
COMMENT ON COLUMN REVIEW.REVIEW_DETAIL  IS '리뷰 내용 (사진 포함)';
COMMENT ON COLUMN REVIEW.DEL            IS '삭제 여부';
COMMENT ON COLUMN REVIEW.CREATE_USER    IS '작성자';
COMMENT ON COLUMN REVIEW.CREATE_DATE    IS '작성 일자';
COMMENT ON COLUMN REVIEW.UPDATE_USER    IS '수정자';
COMMENT ON COLUMN REVIEW.UPDATE_DATE    IS '수정 일자';

-- 유저 아이디, 유저 닉네임 → 회원 테이블에서 가져올 예정
-- 게임 아이디, 게임명 → 게임 테이블에서 가져올 예정

-- 댓글 테이블 SQL
CREATE TABLE REPLY_COMMENTS                                     -- 댓글 및 답글 테이블
(
    REPLY_REG_NUM     NUMBER       DEFAULT 0       NOT NULL
        CONSTRAINT REPLY_COMMENTS_PK
            PRIMARY KEY,                                        -- 댓글 테이블 PK
    REG_NUM           NUMBER NOT NULL,                          -- 리뷰 테이블 PK
    TOP_REPLY_REG_NUM NUMBER       DEFAULT 0,                   -- 상위 댓글 키
    COMMENT_DETAIL    VARCHAR2(4000),                           -- 댓글 내용
    DEL               VARCHAR2(10) DEFAULT 'N',                 -- 삭제 여부 (기본값 : N)
    CREATE_USER       VARCHAR2(100)                NOT NULL,    -- 작성자
    CREATE_DATE       DATE         DEFAULT SYSDATE NOT NULL,    -- 작성 일자
    UPDATE_USER       VARCHAR2(100),                            -- 수정자
    UPDATE_DATE       DATE                                      -- 수정 일자
);

COMMENT ON TABLE REPLY_COMMENTS                     IS '댓글 및 답글 테이블';
COMMENT ON COLUMN REPLY_COMMENTS.REPLY_REG_NUM      IS '댓글 테이블_PK';
-- 상위 댓글 키 : 키 작성시 댓글의 답글이 됨, 작성 시간으로 댓글과 답글의 정렬 예정
COMMENT ON COLUMN REPLY_COMMENTS.REG_NUM            IS '리뷰 테이블 PK';
COMMENT ON COLUMN REPLY_COMMENTS.TOP_REPLY_REG_NUM  IS '상위 댓글 키';
COMMENT ON COLUMN REPLY_COMMENTS.COMMENT_DETAIL     IS '댓글 내용';
COMMENT ON COLUMN REPLY_COMMENTS.DEL                IS '삭제 여부';
COMMENT ON COLUMN REPLY_COMMENTS.CREATE_USER        IS '작성자';
COMMENT ON COLUMN REPLY_COMMENTS.CREATE_DATE        IS '작성 일자';
COMMENT ON COLUMN REPLY_COMMENTS.UPDATE_USER        IS '수정자';
COMMENT ON COLUMN REPLY_COMMENTS.UPDATE_DATE        IS '수정 일자';

-- 선택된 게임 테이블 SQL
CREATE TABLE CHOICE_GAME
(
    CHOICE_REG_NUM NUMBER       DEFAULT 0       NOT NULL
        CONSTRAINT CHOICE_REG_NUM_PK
            PRIMARY KEY,
    GNUM           NUMBER,
    REVIEWREGNUM   NUMBER                       NOT NULL,
    DEL            VARCHAR2(10) DEFAULT 'N',
    CREATE_USER    VARCHAR2(100)                NOT NULL,
    CREATE_DATE    DATE         DEFAULT SYSDATE NOT NULL,
    UPDATE_USER    VARCHAR2(100),
    UPDATE_DATE    DATE
)
;

COMMENT ON TABLE CHOICE_GAME IS '선택된 게임 테이블';
COMMENT ON COLUMN CHOICE_GAME.CHOICE_REG_NUM IS '선택된 게임 테이블의 PK';
COMMENT ON COLUMN CHOICE_GAME.GNUM IS '게임 테이블 PK';
COMMENT ON COLUMN CHOICE_GAME.REVIEWREGNUM IS '리뷰 테이블 PK';
COMMENT ON COLUMN CHOICE_GAME.DEL IS '삭제 여부';
COMMENT ON COLUMN CHOICE_GAME.CREATE_USER IS '작성자';
COMMENT ON COLUMN CHOICE_GAME.CREATE_DATE IS '작성 일자';
COMMENT ON COLUMN CHOICE_GAME.UPDATE_USER IS '수정자';
COMMENT ON COLUMN CHOICE_GAME.UPDATE_DATE IS '수정 일자';


-- 리뷰 좋아요 테이블
create table REVIEWGOOD
(
    GOODKEY     VARCHAR2(50) not null
        constraint REVIEWGOOD_PK
            primary key,
    REVIEWPK    VARCHAR2(50),
    GOOD        VARCHAR2(50) default 'N',
    DEL         VARCHAR2(50) default 'N',
    CREATE_USER VARCHAR2(50),
    CREATE_DATE DATE         default SYSDATE,
    UPDATE_USER VARCHAR2(50),
    UPDATE_DATE DATE
)
;

comment on table REVIEWGOOD is '리뷰 좋아요 테이블';
comment on column REVIEWGOOD.GOODKEY is '좋아요 테이블의 PK';
comment on column REVIEWGOOD.REVIEWPK is '리뷰 테이블의 PK';
comment on column REVIEWGOOD.GOOD is '디폴트 값 : N, 클릭 한 번씩 Y, N 변경';
comment on column REVIEWGOOD.DEL is '삭제여부';
comment on column REVIEWGOOD.CREATE_USER is '작성자, 회원테이블의 PK';
comment on column REVIEWGOOD.CREATE_DATE is '작성일자';
comment on column REVIEWGOOD.UPDATE_USER is '수정자';
comment on column REVIEWGOOD.UPDATE_DATE is '수정일자';





