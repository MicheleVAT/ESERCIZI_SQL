CREATE OR REPLACE PACKAGE proc_fatture AS
    PROCEDURE upload_fatture(max_num INTEGER,debug_on BOOLEAN);
END proc_fatture;
/
CREATE OR REPLACE PACKAGE BODY proc_fatture AS
    PROCEDURE upload_fatture (max_num INTEGER,debug_on BOOLEAN) AS
        CURSOR crs_cli IS
            SELECT id_cli FROM cliente;
        rnd_int INTEGER;
        cod_fatt VARCHAR2(10);
        data_fatt DATE;
        imponibile number(20,2);
        imposta number(20,2);
        tot_merce number(20,2);
        tot_doc number(20,2);
        id_trasp integer;
    
    BEGIN
        IF debug_on = True THEN
            dbms_output.put_line('INIZIO proc_fatture');
        END IF;
        FOR crs_val IN crs_cli LOOP
            IF debug_on = True THEN
                dbms_output.put_line('INIZIO ITERAZIONE');
            END IF;
            rnd_int := dbms_random.value(1,max_num);
            cod_fatt := my_random.random_string('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',10);
            data_fatt := my_random.random_date(TO_DATE('01-01-2019','DD-MM-YYYY'),TO_DATE('31-12-2022','DD-MM-YYYY'));
            IF debug_on = True THEN
                dbms_output.put_line('RANDOM OK');
            END IF;
            id_trasp := seq_dt.nextval();
            INSERT INTO dati_trasporto(
                    id_trasp,
                    cura_trasp
            )
            VALUES (
                id_trasp,
                'Prova Cura Trasp'
            );
             
             imponibile := dbms_random.value(1,100); --TODO cambiare
             imposta := dbms_random.value(1,100); --TODO caambiare
        COMMIT;
            INSERT INTO fattura(id_fatt,cod_fatt,data_fatt,id_cli,id_trasp,imponibile,imposta,tot_merce,tot_doc)
        VALUES(
            seq_fatt.nextval,
            cod_fatt,
            data_fatt,
            crs_val.id_cli,
            id_trasp,
            imponibile, --TODO,
            imposta, --TODO,
            NULL,
            NULL
            );
        COMMIT;
        END LOOP;
    END upload_fatture;
END proc_fatture;