CREATE OR REPLACE PACKAGE proc_fatture AS
    PROCEDURE upload_fatture(max_num INTEGER);
    PROCEDURE upload_fatt_prod;
END proc_fatture;
/
CREATE OR REPLACE PACKAGE BODY proc_fatture AS
    PROCEDURE upload_fatture (max_num INTEGER) AS
        CURSOR crs_cli IS
            SELECT id_cli FROM cliente;
        rnd_int INTEGER;
        cod_fatt VARCHAR2(10);
        data_fatt DATE;
        imponibile number(20,2);
        imposta number(20,2);
        tot_merce number(20,2);
        id_trasp integer;
    
    BEGIN
        FOR crs_val IN crs_cli LOOP
            rnd_int := dbms_random.value(1,max_num);
            cod_fatt := my_random.random_string('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',10);
            data_fatt := my_random.random_date(TO_DATE('01-01-2019','DD-MM-YYYY'),TO_DATE('31-12-2022','DD-MM-YYYY'));
            id_trasp := seq_dt.nextval();
            INSERT INTO dati_trasporto(
                    id_trasp,
                    cura_trasp
            )
            VALUES (
                id_trasp,
                'Prova Cura Trasp'
            );
             
             imponibile := dbms_random.value(1,100);
             imposta := dbms_random.value(1,100);
        COMMIT;
            INSERT INTO fattura(id_fatt,cod_fatt,data_fatt,id_cli,id_trasp,imponibile,imposta,tot_merce,tot_doc)
        VALUES(
            seq_fatt.nextval,
            cod_fatt,
            data_fatt,
            crs_val.id_cli,
            id_trasp,
            imponibile,
            imposta,
            NULL,
            NULL
            );
        COMMIT;
        END LOOP;
    END upload_fatture;
    
    PROCEDURE upload_fatt_prod AS
        num_prod INTEGER;
        qt NUMBER(10,2);
        sconto NUMBER(10,2);
        sel_sconto NUMBER(10,2);
        tot_merce NUMBER(20,2);
        spese NUMBER(20,2);
        imp NUMBER(20,2);
        spese_varie NUMBER(20,2);
        spese_trasp NUMBER(20,2);
        CURSOR crs_fatt IS
           SELECT id_fatt,id_trasp FROM fattura;
    BEGIN
        FOR f IN crs_fatt LOOP--PER OGNI FATTURA
            num_prod := dbms_random.value(1,5);
            tot_merce := 0;
            FOR p IN (SELECT id_prod,um,prezzo,iva
                FROM   (
                    SELECT id_prod,um,prezzo,iva
                    FROM   prodotto
                    ORDER BY dbms_random.random)
                WHERE  rownum < num_prod) 
                LOOP--PER OGNI PRODOTTO SELEZIONATO
                    qt := dbms_random.value(1,10);
                    IF p.um = 'PZ' THEN
                        qt := FLOOR(qt);
                    END IF;
                    sel_sconto := dbms_random.value(0,100);
                IF sel_sconto < 10 THEN --10% dei casi
                    sconto := dbms_random.value(1,15);
                ELSE
                    sconto := 0;
                END IF;
                
                
                INSERT INTO fatt_prod(id_fatt,id_prod,qt,sconto,iva_app)
                VALUES(f.id_fatt,p.id_prod,qt,sconto,22);
                COMMIT;
                imp := p.prezzo * qt - sconto;--calcolo imponibile
                tot_merce := tot_merce + imp * p.iva;--applico l' iva
                
            END LOOP;
            --aggiorna totali
            SELECT spese_trasp INTO spese_trasp FROM dati_trasporto WHERE id_trasp=f.id_trasp;
            SELECT spese_varie INTO spese_varie FROM dati_trasporto WHERE id_trasp=f.id_trasp;
            UPDATE fattura
            SET tot_doc=tot_merce + spese_trasp + spese_varie,tot_merce=tot_merce
            WHERE id_fatt = f.id_fatt;
            
        END LOOP;
    END upload_fatt_prod;
END proc_fatture;