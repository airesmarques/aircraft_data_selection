  /* STEP 1  Select CA Number from Jaguar into CACODE */
  /*         SELECT ADAPCI with CACODE from Jaguar */ 
  /* JAGUAR */



IF OBJECT_ID ( 'dbo.Step1' ) IS NOT NULL   
    DROP PROCEDURE dbo.Step1;  
GO  
CREATE PROCEDURE dbo.Step1
WITH EXECUTE AS CALLER  
AS  
  /* Get the table ready to collect selected ADAPCINUMBER rows */

    DROP TABLE IF EXISTS SELECTED_ADAPCINUMBER;
    CREATE TABLE SELECTED_ADAPCINUMBER(ADAPCINUMBER VARCHAR(18), CACCCODE VARCHAR(8));


  DECLARE @V_CACODE VARCHAR(20) = (SELECT TOP 1 CICO_CACODE FROM CONFIG);

INSERT INTO SELECTED_ADAPCINUMBER
      SELECT DISTINCT ADAPCINUMBER, CACCCODE from R_CACODE_ADAPCI 
      WHERE R_CACODE_ADAPCI.CACCCODE=@V_CACODE and 
            ADAPCINUMBER NOT IN (SELECT ADAPCINUMBER from SELECTED_ADAPCINUMBER where SELECTED_ADAPCINUMBER.ADAPCINUMBER=R_CACODE_ADAPCI.ADAPCINUMBER); 

/*  INSERT INTO SELECTED_ADAPCINUMBER
      SELECT  ADAPCINUMBER58, CACCCODE from L_REL 
      WHERE L_REL.CACCCODE=@V_CACODE and 
            ADAPCINUMBER58 NOT IN (SELECT ADAPCINUMBER from SELECTED_ADAPCINUMBER where SELECTED_ADAPCINUMBER.ADAPCINUMBER=L_REL.ADAPCINUMBER58); */


GO  

dbo.Step1

SELECT * from SELECTED_ADAPCINUMBER;