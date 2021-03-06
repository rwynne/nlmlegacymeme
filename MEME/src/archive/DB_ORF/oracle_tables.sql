WHENEVER SQLERROR EXIT -1
SET ECHO ON

ALTER SESSION SET NLS_LENGTH_SEMANTICS='CHAR';

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRATX'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRATX (
    CUI	char(8),
    SAB	varchar2(40),
    REL	varchar2(3),
    ATX	varchar2(300)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRCOC'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRCOC (
    CUI1	char(8) NOT NULL,
    CUI2	char(8),
    SOC	varchar2(40) NOT NULL,
    COT	varchar2(3) NOT NULL,
    COF	integer,
    COA	varchar2(300)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRCOLS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRCOLS (
    COL	varchar2(10),
    DES	varchar2(100),
    REF	varchar2(20),
    MIN	integer,
    AV	numeric(5,2),
    MAX	integer,
    FIL	varchar2(50),
    DTY	varchar2(20)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRCON'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRCON (
    CUI	char(8) NOT NULL,
    LAT	char(3) NOT NULL,
    TS	char(1) NOT NULL,
    LUI	char(8) NOT NULL,
    STT	varchar2(3) NOT NULL,
    SUI	char(8) NOT NULL,
    STR	varchar2(3000) NOT NULL,
    LRL	integer NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRCXT'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRCXT (
    CUI	char(8),
    SUI	char(8),
    SAB	varchar2(40),
    CODE	varchar2(100),
    CXN	integer,
    CXL	char(3),
    RNK	integer,
    CXS	varchar2(3000),
    CUI2	char(8),
    HCD	varchar2(100),
    RELA	varchar2(100),
    XC	varchar2(1)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRCUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRCUI (
    CUI1	char(8) NOT NULL,
    VER	varchar2(10) NOT NULL,
    CREL	varchar2(4) NOT NULL,
    CUI2	char(8),
    MAPIN	char(1)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRDEF'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRDEF (
    CUI	char(8) NOT NULL,
    SAB	varchar2(40) NOT NULL,
    DEF	varchar2(4000) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRDOC'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRDOC (
    DOCKEY	varchar2(50) NOT NULL,
    VALUE	varchar2(200),
    TYPE	varchar2(50) NOT NULL,
    EXPL	varchar2(1000)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRFILES'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRFILES (
    FIL	varchar2(50),
    DES	varchar2(100),
    FMT	varchar2(150),
    CLS	integer,
    RWS	integer,
    BTS	integer
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRRANK'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRRANK (
    RANK	integer NOT NULL,
    SAB	varchar2(40) NOT NULL,
    TTY	varchar2(20) NOT NULL,
    SUPRES	char(1) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRREL'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRREL (
    CUI1	char(8) NOT NULL,
    REL	varchar2(3) NOT NULL,
    CUI2	char(8) NOT NULL,
    RELA	varchar2(100),
    SAB	varchar2(40) NOT NULL,
    SL	varchar2(40) NOT NULL,
    MG	varchar2(1)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRSAB'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRSAB (
    VCUI	char(8),
    RCUI	char(8) NOT NULL,
    VSAB	varchar2(40) NOT NULL,
    RSAB	varchar2(40) NOT NULL,
    SON	varchar2(3000) NOT NULL,
    SF	varchar2(40) NOT NULL,
    SVER	varchar2(20),
    MSTART	char(10),
    MEND	char(8),
    IMETA	varchar2(10) NOT NULL,
    RMETA	varchar2(10),
    SLC	varchar2(1000),
    SCC	varchar2(1000),
    SRL	integer NOT NULL,
    TFR	integer,
    CFR	integer,
    CXTY	varchar2(50),
    TTYL	varchar2(200),
    ATNL	varchar2(4000),
    LAT	char(3),
    CENC	varchar2(20) NOT NULL,
    CURVER	char(1) NOT NULL,
    SABIN	char(1) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRSAT'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRSAT (
    CUI	char(8),
    LUI	char(8),
    SUI	char(8),
    CODE	varchar2(100),
    ATN	varchar2(100),
    SAB	varchar2(40),
    ATV	varchar2(4000)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRSO'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRSO (
    CUI	char(8) NOT NULL,
    LUI	char(8) NOT NULL,
    SUI	char(8) NOT NULL,
    SAB	varchar2(40) NOT NULL,
    TTY	varchar2(20) NOT NULL,
    CODE	varchar2(100) NOT NULL,
    SRL	integer NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRSTY'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRSTY (
    CUI	char(8) NOT NULL,
    TUI	char(4) NOT NULL,
    STY	varchar2(50) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXNS_ENG'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXNS_ENG (
    LAT	char(3) NOT NULL,
    NSTR	varchar2(3000) NOT NULL,
    CUI	char(8) NOT NULL,
    LUI	char(8) NOT NULL,
    SUI	char(8) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXNW_ENG'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXNW_ENG (
    LAT	char(3) NOT NULL,
    NWD	varchar2(100) NOT NULL,
    CUI	char(8) NOT NULL,
    LUI	char(8) NOT NULL,
    SUI	char(8) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_BAQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_BAQ (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_CZE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_CZE (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_DAN'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_DAN (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_DUT'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_DUT (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_ENG'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_ENG (
    LAT	char(3) NOT NULL,
    WD	varchar2(100) NOT NULL,
    CUI	char(8) NOT NULL,
    LUI	char(8) NOT NULL,
    SUI	char(8) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_FIN'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_FIN (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_FRE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_FRE (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_GER'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_GER (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_HEB'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_HEB (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_HUN'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_HUN (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_ITA'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_ITA (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_JPN'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_JPN (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_NOR'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_NOR (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_POR'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_POR (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_RUS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_RUS (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_SPA'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_SPA (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MRXW_SWE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MRXW_SWE (
    LAT	char(3),
    WD	varchar2(100),
    CUI	char(8),
    LUI	char(8),
    SUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE AMBIG_SUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE AMBIG_SUI (
    SUI	char(8),
    CUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE AMBIG_LUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE AMBIG_LUI (
    LUI	char(8),
    CUI	char(8)
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE DELETED_CUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE DELETED_CUI (
    PCUI	char(8) NOT NULL,
    PSTR	varchar2(3000) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE DELETED_LUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE DELETED_LUI (
    PLUI	char(8) NOT NULL,
    PSTR	varchar2(3000) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE DELETED_SUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE DELETED_SUI (
    PSUI	char(8) NOT NULL,
    LAT	char(3) NOT NULL,
    PSTR	varchar2(3000) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MERGED_CUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MERGED_CUI (
    PCUI	char(8) NOT NULL,
    CUI	char(8) NOT NULL
)
PCTFREE 10 PCTUSED 80;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE MERGED_LUI'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE MERGED_LUI (
    PLUI	char(8),
    LUI	char(8)
)
PCTFREE 10 PCTUSED 80;

