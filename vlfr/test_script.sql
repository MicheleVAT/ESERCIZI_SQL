set serveroutput on size 30000;
exec proc_fatture.upload_fatture(5,TRUE);

/*  SELECT TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(TO_CHAR(DATE '2000-01-01','J')
                                    ,TO_CHAR(DATE '9999-12-31','J')
                                    )
                    ),'J'
               ) FROM DUAL;*/
