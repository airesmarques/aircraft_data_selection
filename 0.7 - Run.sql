/* RUN STEPS */
IF OBJECT_ID ( 'dbo.Run' ) IS NOT NULL   
    DROP PROCEDURE dbo.Run;  
GO  
CREATE PROCEDURE dbo.Run @DUMMY INTEGER
WITH EXECUTE AS CALLER  
AS  

EXEC ClearSelections;
EXEC Step1;
EXEC Step1B;
EXEC Step1C;
EXEC Step5;
EXEC Step6;
EXEC Step7;
EXEC step8;
EXEC step9;
EXEC step9A;
EXEC step10;

EXEC step18;
EXEC step18x;

GO

dbo.Run 0


