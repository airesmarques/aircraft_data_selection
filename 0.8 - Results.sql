/* RUN STEPS */
Select * from CONFIG

DROP TABLE IF EXISTS SELECTION_REPORT;
CREATE TABLE SELECTION_REPORT(MESSAGE VARCHAR(200), NUMBER_OF_OBJECTS INTEGER);


INSERT INTO SELECTION_REPORT
    Select 'Step 1 - Number of ADAPCINUMBERs Found' as Message, Count(*) as Count  from SELECTED_ADAPCINUMBER
Select 'Step 1 - Number of ADAPCINUMBERs Found' as Message, Count(*) as Count  from SELECTED_ADAPCINUMBER
Select CACCCODE, ADAPCINUMBER from SELECTED_ADAPCINUMBER

INSERT INTO SELECTION_REPORT
    Select 'Step 1B - Number of CINS Found' as Message, Count(*) as Count  from SELECTED_CINS
Select 'Step 1B - Number of CINS Found' as Message, Count(*) as Count  from SELECTED_CINS
Select * from SELECTED_CINS


INSERT INTO SELECTION_REPORT
    Select 'Step 1.C - Number of CINS Found from ADAPCINUMBERs - SELECTED_CINS_ADAPCI' as Message, Count(*) as Count  from SELECTED_CINS_ADAPCI
Select 'Step 1.C - Number of CINS Found from ADAPCINUMBERs - SELECTED_CINS_ADAPCI' as Message, Count(*) as Count  from SELECTED_CINS_ADAPCI
Select * from SELECTED_CINS_ADAPCI


INSERT INTO SELECTION_REPORT
    Select 'Step 5 - Selected SELECTED_CIN_ADAPLONUMBER' as Message, Count(*) as Count  from SELECTED_CIN_ADAPLONUMBER
Select 'Step 5 - Selected SELECTED_CIN_ADAPLONUMBER' as Message, Count(*) as Count  from SELECTED_CIN_ADAPLONUMBER
Select ADAPCINUMBER, ADAPLONUMBER from SELECTED_CIN_ADAPLONUMBER

INSERT INTO SELECTION_REPORT
    Select 'Step 6 - Selected LONUMBER from IX' as Message, Count(*) as Count  from SELECTED_LONUMBER_EFF
Select 'Step 6 - Selected LONUMBER from IX' as Message, Count(*) as Count  from SELECTED_LONUMBER_EFF
SELECT * FROM SELECTED_LONUMBER_EFF

INSERT INTO SELECTION_REPORT
    Select 'Step 7 - Filtered LONUMBER' as Message, Count(*) as Count  from FILTERED_LONUMBER
Select 'Step 7 - Filtered LONUMBER' as Message, Count(*) as Count  from FILTERED_LONUMBER
select * from FILTERED_LONUMBER;

INSERT INTO SELECTION_REPORT
    Select 'Step 8 - Filtered SELECTED_ADAPDS' as Message, Count(*) as Count  from SELECTED_ADAPDS
Select 'Step 8 - Filtered SELECTED_ADAPDS' as Message, Count(*) as Count  from SELECTED_ADAPDS
SELECT * from SELECTED_ADAPDS

INSERT INTO SELECTION_REPORT
    Select 'Step 9 - Selected DRAWINGSET' as Message, Count(*) as Count  from SELECTED_DRAWINGSET
Select 'Step 9 - Selected DRAWINGSET' as Message, Count(*) as Count  from SELECTED_DRAWINGSET
SELECT * from SELECTED_DRAWINGSET

INSERT INTO SELECTION_REPORT
    Select 'Step 9A - Selected DRAWINGS' as Message, Count(*) as Count  from SELECTED_DRAWINGS
Select 'Step 9A - Selected DRAWINGS' as Message, Count(*) as Count  from SELECTED_DRAWINGS
SELECT * from SELECTED_DRAWINGS


/* create new step to get drawing attributes from selected drawings */


INSERT INTO SELECTION_REPORT
    Select 'Step 10 - Selected DASSY' as Message, Count(*) as Count  from SELECTED_O_DASSY
Select 'Step 10 - Selected DASSY' as Message, Count(*) as Count  from SELECTED_O_DASSY
SELECT * from SELECTED_O_DASSY;


INSERT INTO SELECTION_REPORT
    Select 'Step 18 - Selected ADAPDS_ADAPDS2' as Message, Count(*) as Count  from SELECTED_ADAPDS2
Select 'Step 18 - Selected DASSY' as Message, Count(*) as Count  from SELECTED_ADAPDS2
SELECT * from SELECTED_ADAPDS2;

INSERT INTO SELECTION_REPORT
    Select 'Step 18x - Selected ADAPDS_ADAPDS2' as Message, Count(*) as Count  from SELECTED_ADAPDS_DASSY2
Select 'Step 18x - Selected DASSY' as Message, Count(*) as Count  from SELECTED_ADAPDS_DASSY2
SELECT * from SELECTED_ADAPDS_DASSY2;

INSERT INTO SELECTION_REPORT
    Select 'Step 18x - Selected SELECTED_O_DASSY2' as Message, Count(*) as Count  from SELECTED_O_DASSY2
Select 'Step 18x - Selected DASSY' as Message, Count(*) as Count  from SELECTED_O_DASSY2
SELECT * from SELECTED_O_DASSY2;
