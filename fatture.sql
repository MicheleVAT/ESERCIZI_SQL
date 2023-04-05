drop table fatt_prod;
drop table prodotto;
drop table fattura;
drop table dati_trasporto;
drop table cliente;

drop sequence seq_cli;
drop sequence seq_prod;
drop sequence seq_dt;
drop sequence seq_fatt;

create sequence seq_cli minvalue 0 start with 0 increment by 1 nocache;
create sequence seq_prod minvalue 0 start with 0 increment by 1 nocache;
create sequence seq_dt minvalue 0 start with 0 increment by 1 nocache;
create sequence seq_fatt minvalue 0 start with 0 increment by 1 nocache;


create table cliente(
    id_cli number(38) not null primary key,
	cod_cli varchar2(10) not null,
	p_iva char(11) not null,
	cod_fis char(11),
	rag_soc varchar2(50) not null,
	indirizzo varchar2(100) not null,
	cap char(5) not null,
	comune varchar2(100) not null,
	prov char(2) not null,
	cod_esenzione varchar2(100),
	pagamento varchar2(100),
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table prodotto(
    id_prod number(38) not null primary key,
	cod_prod varchar2(10) not null,
	descriz varchar2(500) not null,
	um char(2),
	prezzo number(20,2) not null,
    iva number(3) not null,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table dati_trasporto(
	id_trasp number(38) not null primary key,
	spese_varie number(20,2),
	numero_colli number(20),
	spese_trasp number(20,2),
	causale_trasp varchar2(500),
	cura_trasp varchar2(100) not null,
	data_ora_trasp date,
	aspetto_beni varchar2(100),
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table fattura(
    id_fatt number(38) not null primary key,
	cod_fatt varchar2(10) not null,
	data_fatt date not null,
	id_cli number(38) not null,
	id_trasp number(38) not null,
    imponibile number(20,2) not null,
    imposta number(20,2) not null,
    tot_merce number(20,2) not null,
    tot_doc number(20,2) not null,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N',
	foreign key(id_cli) references cliente(id_cli),
	foreign key(id_trasp) references dati_trasporto(id_trasp)
);

create table fatt_prod(
	id_fatt number(38) not null,
	id_prod number(38) not null,
	qt number(20,3) not null,
    sconto number(20,2),
	iva_app number(3) not null,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N',
    primary key(id_fatt,id_prod),
	foreign key(id_fatt) references fattura(id_fatt),
	foreign key(id_prod) references prodotto(id_prod)
);

