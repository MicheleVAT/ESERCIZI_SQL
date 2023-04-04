create table cliente(
	cod_cli varchar(10) not null primary key,
	p_iva varchar(50) not null,
	cod_fis varchar(50) not null,
	rag_soc varchar(50) not null,
	indirizzo varchar(100) not null,
	cap varchar(5) not null,
	comune varchar(100) not null,
	prov varchar(2) not null,
	cod_esenzione varchar(100),
	pagamento varchar(100),
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table prodotto(
	cod_prod varchar(10) not null primary key,
	descr varchar(500) not null,
	um varchar(2),
	prezzo float not null,
	sconto float,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table dati_trasporto(
	id_trasp int not null auto_increment primary key,
	spese_varie float,
	numero_colli int,
	spese_trasp float,
	causale_trasp varchar(500),
	cura_trasp varchar(100) not null,
	data_ora_trasp datetime,
	aspetto_beni varchar(100),
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N'
);

create table fattura(
	cod_fatt varchar(10) not null primary key,
	data_fatt date not null,
	cod_cli varchar(10) not null,
	id_trasp int not null,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N',
	foreign key(cod_cli) references cliente(cod_cli),
	foreign key(id_trasp) references dati_trasporto(id_trasp)
);

create table fatt_prod(
	cod_fatt varchar(10) not null,
	cod_prod varchar(10) not null,
	qt float not null,
	iva float not null,
	data_ins date default sysdate,
	data_upd date,
	deleted char(1) default 'N',
	foreign key(cod_fatt) references fattura(cod_fatt),
	foreign key(cod_prod) references prodotto(cod_prod)
);
