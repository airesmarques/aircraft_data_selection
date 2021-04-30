/* step 10 -  Select DASSY */
/* 


*/

IF OBJECT_ID ( 'dbo.Step10' ) IS NOT NULL   
    DROP PROCEDURE dbo.Step10;  
GO  
CREATE PROCEDURE dbo.Step10
WITH EXECUTE AS CALLER  
AS  

DROP TABLE IF EXISTS SELECTED_ADAPDS_DASSY;
CREATE TABLE SELECTED_ADAPDS_DASSY(
        ADAPDSISSUEINDEX VARCHAR(3),
        ADAPDSNUMBER VARCHAR(20),
        ALTERNCODE VARCHAR(5),
        CDATE DATE,
        DASSYISSUEINDEX VARCHAR(3),
        DASSYNUMBER VARCHAR(20),
        ITEMNUMBER INTEGER,
        ITEMNUMBERZONE VARCHAR(5),
        QUANTITY INTEGER,
        UDATE VARCHAR(20),
        UNIT VARCHAR(3)
);


INSERT INTO SELECTED_ADAPDS_DASSY
    SELECT 
        R_ADAPDS_DASSY.ADAPDSISSUEINDEX,
        R_ADAPDS_DASSY.ADAPDSNUMBER,
        R_ADAPDS_DASSY.ALTERNCODE,
        R_ADAPDS_DASSY.CDATE,
        R_ADAPDS_DASSY.DASSYISSUEINDEX,
        R_ADAPDS_DASSY.DASSYNUMBER,
        R_ADAPDS_DASSY.ITEMNUMBER,
        R_ADAPDS_DASSY.ITEMNUMBERZONE,
        R_ADAPDS_DASSY.QUANTITY,
        R_ADAPDS_DASSY.UDATE,
        R_ADAPDS_DASSY.UNIT

    FROM R_ADAPDS_DASSY JOIN SELECTED_ADAPDS 
        on  SELECTED_ADAPDS.ADAPDSNUMBER=R_ADAPDS_DASSY.ADAPDSNUMBER AND 
            SELECTED_ADAPDS.ADAPDSISSUEINDEX=R_ADAPDS_DASSY.ADAPDSISSUEINDEX

DROP TABLE IF EXISTS SELECTED_O_DASSY;
select  BESTMATURITYWEIGHT,  
        BOUGHTOUTINDICATOR,
        CANCELLATION,
        O_DASSY.DASSYISSUEINDEX,
        O_DASSY.DASSYNUMBER,
        DIRECTLINKTOEQ,
        DOMESTICTITLE,
        ENGLISHTITLE,
        GEOGRAPHICALID,
        IDENTNUMBER,
        INTERCHANGEABILITYCODE,
        LOCK,
        LOGISTICCODE,
        MANUFACTURINGCODE,
        MANUFACTURINGRESPONSIBLE,
        MANUFINDEX, 
        MARKING,
        NATCO,
        ORDINALNUMBER,
        PRODUCTIONTYPE,
        SPAREITEM,
        STATE

 INTO SELECTED_O_DASSY
        from O_DASSY join SELECTED_ADAPDS_DASSY 
        on O_DASSY.DASSYNUMBER=SELECTED_ADAPDS_DASSY.DASSYNUMBER AND
           O_DASSY.DASSYISSUEINDEX=SELECTED_ADAPDS_DASSY.DASSYISSUEINDEX

GO

Step10

select * from SELECTED_O_DASSY;

