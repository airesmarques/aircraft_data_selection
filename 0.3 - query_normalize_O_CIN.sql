IF OBJECT_ID ( 'dbo.NormalizeOCIN' ) IS NOT NULL   
    DROP PROCEDURE dbo.NormalizeOCIN;  
GO  
CREATE PROCEDURE dbo.NormalizeOCIN
WITH EXECUTE AS CALLER  
AS  

DROP TABLE IF EXISTS O_CIN_NORM_TEMP;

CREATE TABLE O_CIN_NORM_TEMP(
        CIN VARCHAR (500),
        MODNUMBER INTEGER,
        MODTITLE VARCHAR (500),
        MPNUMBER VARCHAR (500),
        MPTITLE VARCHAR (500),
        TEAM_DISPLAY VARCHAR (500),
        CATEGORY VARCHAR (500),
        CONFIGSETNAME VARCHAR (500),
        VALIDITYUPDATEDATE DATE,
        VALIDITYTYPE VARCHAR (500),
        INDUSSTDCODE VARCHAR (500),
        STDCODE VARCHAR (500),
        VERSIONCODE VARCHAR (500),
        RANGE VARCHAR (500),
        RANGE_START VARCHAR (500),
        RANGE_END VARCHAR (500),
);



DROP TABLE IF EXISTS O_CIN;
CREATE TABLE O_CIN(
        CIN VARCHAR (500),
        MODNUMBER INTEGER,
        MODTITLE VARCHAR (500),
        MPNUMBER VARCHAR (500),
        MPTITLE VARCHAR (500),
        TEAM_DISPLAY VARCHAR (500),
        CATEGORY VARCHAR (500),
        CONFIGSETNAME VARCHAR (500),
        VALIDITYUPDATEDATE DATE,
        VALIDITYTYPE VARCHAR (500),
        INDUSSTDCODE VARCHAR (500),
        STDCODE VARCHAR (500),
        VERSIONCODE VARCHAR (500),
        RANGE VARCHAR (20),
        RANGE_START INTEGER,
        RANGE_END INTEGER,
);


DECLARE @PCIN VARCHAR (500)
DECLARE @PMODNUMBER INTEGER
DECLARE @PMODTITLE VARCHAR (500)
DECLARE @PMPNUMBER VARCHAR (500)
DECLARE @PMPTITLE VARCHAR (500)
DECLARE @PTEAM_DISPLAY VARCHAR (500)
DECLARE @PCATEGORY VARCHAR (500)
DECLARE @PCONFIGSETNAME VARCHAR (500)
DECLARE @PVALIDITYUPDATEDATE DATE
DECLARE @PVALIDITYTYPE VARCHAR (500)
DECLARE @PINDUSSTDCODE VARCHAR (500)
DECLARE @PSTDCODE VARCHAR (500)
DECLARE @PVERSIONCODE VARCHAR (500)
DECLARE @PRANGE NVARCHAR(max)

DECLARE SPLIT_RANGE CURSOR LOCAL FAST_FORWARD FOR 
        SELECT
                CIN, MODNUMBER, MODTITLE, MPNUMBER, MPTITLE, TEAM_DISPLAY, CATEGORY, CONFIGSETNAME, 
                VALIDITYUPDATEDATE, VALIDITYTYPE, INDUSSTDCODE, STDCODE, VERSIONCODE, RANGE
        FROM [dbo].[O_CIN_TEMP]

OPEN SPLIT_RANGE
FETCH NEXT FROM SPLIT_RANGE 
INTO @PCIN, @PMODNUMBER, @PMODTITLE, @PMPNUMBER, @PMPTITLE, @PTEAM_DISPLAY, @PCATEGORY, @PCONFIGSETNAME, 
     @PVALIDITYUPDATEDATE, @PVALIDITYTYPE, @PINDUSSTDCODE, @PSTDCODE, @PVERSIONCODE, @PRANGE
 
WHILE @@FETCH_STATUS = 0
BEGIN

INSERT INTO O_CIN_NORM_TEMP
        SELECT @PCIN, @PMODNUMBER, @PMODTITLE, @PMPNUMBER, @PMPTITLE, @PTEAM_DISPLAY, @PCATEGORY, @PCONFIGSETNAME, 
                @PVALIDITYUPDATEDATE, @PVALIDITYTYPE, @PINDUSSTDCODE, @PSTDCODE, @PVERSIONCODE, 
                SPL.value, '', '' FROM STRING_SPLIT(@PRANGE,',') AS SPL
 
        FETCH NEXT FROM SPLIT_RANGE 
        INTO 
                @PCIN, @PMODNUMBER, @PMODTITLE, @PMPNUMBER, @PMPTITLE, @PTEAM_DISPLAY, @PCATEGORY, @PCONFIGSETNAME, 
                @PVALIDITYUPDATEDATE, @PVALIDITYTYPE, @PINDUSSTDCODE, @PSTDCODE, @PVERSIONCODE, @PRANGE
END 

INSERT INTO O_CIN
        SELECT CIN, 
        MODNUMBER, MODTITLE, MPNUMBER, MPTITLE, TEAM_DISPLAY, CATEGORY, CONFIGSETNAME, VALIDITYUPDATEDATE DATE, VALIDITYTYPE, INDUSSTDCODE, STDCODE, VERSIONCODE,        
        RANGE,
        CAST(SUBSTRING(RANGE, 1, CHARINDEX('-', RANGE) - 1) as INT) as RSTART,
        CAST(REVERSE( LEFT( REVERSE(RANGE), CHARINDEX('-', REVERSE(RANGE))-1 ) ) AS INT) as REND
        From O_CIN_NORM_TEMP WHERE RANGE like '%-%'

INSERT INTO O_CIN
        SELECT CIN,
        MODNUMBER, MODTITLE, MPNUMBER, MPTITLE, TEAM_DISPLAY, CATEGORY, CONFIGSETNAME, VALIDITYUPDATEDATE, VALIDITYTYPE, INDUSSTDCODE, STDCODE, VERSIONCODE, 
        RANGE, CAST(RANGE as INT), ''
        From O_CIN_NORM_TEMP WHERE RANGE not like '%-%'

DROP TABLE O_CIN_NORM_TEMP;
DROP TABLE O_CIN_TEMP;
GO  

/*dbo.NormalizeOCIN*/

