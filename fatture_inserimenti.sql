--CLIENTI
insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov,data_ins,data_upd)
values  (seq_cli.nextval,'CLI1','00000000000','00000000000','cliente-1','str. esempio n. 1','00000','ProvaComune','AB',to_date('12-DEC-2010'),to_date('15-NOV-2015'));
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov,data_ins,data_upd)
values  (seq_cli.nextval,'CLI2','00000110000','00000110000','cliente-2','str. esempio2 n. 2','00001','ProvaComune2','CD',to_date('10-MAY-2012'),to_date('15-NOV-2018'));
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov,data_ins)
values  (seq_cli.nextval,'CLI3','00000060800','00000060800','cliente-3','str. esempio3 n. 3','00002','ProvaComune3','EF',to_date('15-APR-2009'));
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov)
values  (seq_cli.nextval,'CLI4','00120000500','00120000500','cliente-4','str. esempio4 n. 4','00003','ProvaComune4','GH');
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov,cod_esenzione,data_ins)
values  (seq_cli.nextval,'CLI5','99800000100','99800000100','cliente-5','str. esempio5 n. 5','00004','ProvaComune5','IL','54321',to_date('15-JAN-2018'));
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov,cod_esenzione,data_ins,data_upd)
values  (seq_cli.nextval,'CLI6','00134000000','00134000000','cliente-6','str. esempio6 n. 6','00005','ProvaComune6','MN','12345',to_date('19-JAN-2016'),to_date('26-JAN-2019'));
commit;

insert into cliente(id_cli,cod_cli,p_iva,cod_fis,rag_soc,indirizzo,cap,comune,prov)
values  (seq_cli.nextval,'CLI7','00967000000','ABCDEF12345','cliente-7','str. esempio n. 7','00006','ProvaComune7','OP');
commit;

--PRODOTTI
insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins, data_upd)
values (seq_prod.nextval,'PROD1','Prodotto 1','PZ',15.20,22,to_date('12-DEC-2001'),to_date('15-JAN-2012'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins)
values (seq_prod.nextval,'PROD2','Prodotto 2','KG',1.20,22,to_date('12-OCT-2012'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins, data_upd)
values (seq_prod.nextval,'PROD3','Prodotto 3','LT',1.18,22,to_date('19-JAN-2019'),to_date('15-MAY-2020'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins, data_upd)
values (seq_prod.nextval,'PROD4','Prodotto 4','KG',123.20,22,to_date('4-JUN-2013'),to_date('26-OCT-2015'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins)
values (seq_prod.nextval,'PROD5','Prodotto 5','PZ',43.81,22,to_date('18-SEP-2017'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins, data_upd)
values (seq_prod.nextval,'PROD6','Prodotto 6','KG',35.98,22,to_date('10-AUG-2019'),to_date('11-OCT-2022'));
commit;

insert into prodotto(id_prod, cod_prod, descriz, um, prezzo, iva, data_ins,deleted)
values (seq_prod.nextval,'PROD7','Prodotto 7','LT',12.21,22,to_date('02-JAN-2019'),'Y');
commit;