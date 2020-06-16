create database EVA;
use EVA;

-- ------------------------------------------------------------- CREATE TABLES ------------------------------------------------------------- --

create table tb_cliente(
	cliente_id int primary key auto_increment,
	cliente_rep varchar(40),
	rep_email varchar(100),
	empresa varchar(40),
	cnpj char (18),
	cliente_tel1 char(13),
	cliente_tel2 char(13),
	cliente_cat varchar(40)
);

create table tb_estabelecimento(
	estab_id int primary key auto_increment,
	estab_rep varchar (20),
	fk_cliente_id int,
	cep char (9),
	numero varchar (4),
	comp varchar (20),
		foreign key (fk_cliente_id) references tb_cliente (cliente_id)
) auto_increment = 10;

create table tb_acesso(
	acesso_id int primary key auto_increment,
	acesso_email varchar (30),
	acesso_senha varchar (10),
	fk_estab_id int,
		foreign key (fk_estab_id) references tb_estabelecimento (estab_id)
) auto_increment=300;

create table tb_setor(
	setor_id int primary key auto_increment,
	setor_nome varchar (30),
	setor_lumi varchar (30),
	fk_estab_id int,
		foreign key (fk_estab_id) references tb_estabelecimento(estab_id)
) auto_increment = 100;

create table tb_sensor(
	setor_id  int primary key auto_increment,
	fk_setor_id int,
		foreign key (fk_setor_id) references tb_setor (setor_id)
) auto_increment = 100;

create table tb_registro(
	registro datetime primary key,
	luminosidade double(10,2),
	fk_setor_id int
);

-- ------------------------------------------------------------- INSERTS ------------------------------------------------------------- --



