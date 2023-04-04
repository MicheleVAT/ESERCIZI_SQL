create table cliente(
	cod_cli varchar(10) not null primary key,
	p_iva varchar(50),
	cod_fis varchar(50),
	rag_soc varchar(50),
	indirizzo varchar(100),
	cap varchar(5),
	comune varchar(100),
	prov varchar(2),
	cod_esenzione varchar(100),
	pagamento varchar(100),
	data_ins date default sysdate,
	data_upd date,
	deleted char(1)
);

create table prodotto(
	cod_prod varchar(10) not null primary key,
	descr varchar(500),
	um enum ("PZ","KG","LT") not null,
	prezzo float,
	sconto float
);

create table dati_trasporto(
	id_trasp int not null auto_increment primary key,
	spese_varie float,
	numero_colli int,
	spese_trasp float,
	causale_trasp varchar(500),
	cura_trasp varchar(100),
	data_ora_trasp datetime,
	aspetto_beni varchar(100)
);

create table fattura(
	cod_fatt varchar(10) not null primary key,
	data_fatt date,
	cod_cli varchar(10) not null,
	sconto float,
	id_trasp int not null,
	foreign key(cod_cli) references cliente(cod_cli),
	foreign key(id_trasp) references dati_trasporto(id_trasp)
);

create table fatt_prod(
	cod_fatt varchar(10),
	cod_prod varchar(10),
	qt float,
	iva float,
	foreign key(cod_fatt) references fattura(cod_fatt),
	foreign key(cod_prod) references prodotto(cod_prod)
);
