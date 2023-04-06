CREATE OR REPLACE PACKAGE my_random AS
    FUNCTION random_string(p_Characters varchar2, p_length number) return VARCHAR2;
    FUNCTION random_date(start_d VARCHAR2, end_d VARCHAR2) return DATE;
END my_random;
/
CREATE OR REPLACE PACKAGE BODY my_random AS
    FUNCTION random_string(p_Characters varchar2, p_length number)
      RETURN varchar2
      IS
        l_res varchar2(256);
      BEGIN
        SELECT SUBSTR(listagg(substr(p_Characters, level, 1)) within group(order by dbms_random.value), 1, p_length)
        INTO l_res
        FROM dual
        CONNECT BY LEVEL <= length(p_Characters);
        RETURN l_res;
     END random_string;
     
     FUNCTION random_date(start_d VARCHAR2, end_d VARCHAR2)
        RETURN DATE
     IS
        d date;
     BEGIN
            select to_date('2010-01-01', 'yyyy-mm-dd')+trunc(dbms_random.value(1,1000)) into d from dual;
            return d;
     END random_date;
END my_random;