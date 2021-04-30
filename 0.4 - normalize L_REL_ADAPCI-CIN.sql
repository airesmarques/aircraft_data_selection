IF OBJECT_ID ( 'dbo.NormalizeR_CIN_ADAPCI' ) IS NOT NULL   
    DROP PROCEDURE dbo.NormalizeR_CIN_ADAPCI;  
GO  
CREATE PROCEDURE dbo.NormalizeR_CIN_ADAPCI
WITH EXECUTE AS CALLER  
AS

DROP TABLE IF EXISTS R_CIN_ADAPCI;

CREATE TABLE R_CIN_ADAPCI(
    CINSTACK VARCHAR(50),
    ADAPCINUMBER VARCHAR(20),
);


DECLARE @V_CINSTACK VARCHAR(8000);
DECLARE @V_ADAPCINUMBER VARCHAR (500);

DECLARE SPLIT_CINSTACK CURSOR LOCAL FAST_FORWARD FOR 
        SELECT
                CINSTACK, ADAPCINUMBER
        FROM R_ADAPCI_CIN_TEMP

OPEN SPLIT_CINSTACK
FETCH NEXT FROM SPLIT_CINSTACK 
INTO @V_CINSTACK, @V_ADAPCINUMBER
 
WHILE @@FETCH_STATUS = 0
BEGIN

    INSERT INTO R_CIN_ADAPCI
            SELECT SPL.value, @V_ADAPCINUMBER FROM STRING_SPLIT(@V_CINSTACK,',') AS SPL 
    
            FETCH NEXT FROM SPLIT_CINSTACK 
            INTO 
                    @V_CINSTACK, @V_ADAPCINUMBER
END 

/* SELECT * FROM R_CIN_ADAPCI; */
DROP TABLE R_CIN_ADAPCI_TEMP;

GO

dbo.NormalizeR_CIN_ADAPCI
