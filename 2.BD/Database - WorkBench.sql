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
	-- registro datetime primary key,
	luminosidade double(10,2)
	-- fk_setor_id int,
		-- foreign key (fk_setor_id) references tb_setor (setor_id)
)  auto_increment = 10000;

-- ------------------------------------------------------------- INSERTS ------------------------------------------------------------- --

insert into tb_cliente values
(null,'Renato','renato@grandcru.com.br','Grand Cru','05.089.637/0001-10','(11)4756-9988','','Vinícola'),
(null,'Mariana','mariana@mercedes.com.br','Mercedes-Benz','59.104.273/0001-29','(11)5563-3466','','Concessionária'),
(null,'Silvana','silvana@carrefour.com.br','Carrefour','45.543.915/0001-81','(11)4756-9988','','Hipermercado'),
(null,'Renato','camila@expo.com.br','Centro de Exposiçoes Imigrantes','87.848.180/0001-44','(11)2105-3122','','Centro de Exposição')
;
select * from tb_cliente;

insert into tb_estabelecimento values
(null, 'José Fabiano',0001,'02345-574','884','bloco B'),
(null,'Cristiano Augusto',0002, '02364-528','182','Prédio A'),
(null, 'Sarah Alvez',0003, '25245-783','1001',''),
(null, 'Marta Cristo',0004, '28455-285','224','');

select * from tb_estabelecimento; 

insert into tb_acesso values 
(null,'josefabiano@gmail.com','12345678',10),
(null,'Cristianoaugusto@gmail.com','87654321',11),
(null,'sarahalvez@gmail.com','53426sah',12),
(null,'martacristo@gmail.com','982675gab',13);
select * from tb_acesso;

insert into tb_setor values
(null,'Tintos', '500',10),
(null, 'Brancos','500',10),
(null, 'Tintos','700',10),
(null,'Brancos','600',10),
(null,'Espumantes','600',10),
(null,'Esportivo','1000',11),
(null,'SUV','1000',11),
(null,'Sedan','1000',11),
(null,'Cosmético','1000',12),
(null,'Leite','1000',12),
(null,'Agrário','1000',13);

select * from tb_setor; 

insert into tb_sensor values
(null, 100),
(null, 101),
(null, 102),
(null, 103),
(null, 104),
(null, 105),
(null, 106),
(null, 107),
(null, 108),
(null, 109),
(null, 110);

select * from tb_sensor; 

insert into tb_registro values
('2020-03-20 08:00:00', 500,100),
('2020-03-20 08:30:00', 450,101),
('2020-03-20 09:30:00', 450,102),
('2020-03-25 10:00:00', 450,103),
('2020-03-25 10:30:00', 450,104),
('2020-03-20 11:00:00', 400,105),
('2020-03-20 11:30:00', 450,106),
('2020-03-20 12:00:00', 450,107),
('2020-03-25 12:30:00', 450,108),
('2020-03-25 13:00:00', 450,109),
('2020-03-25 13:30:00', 450,110);

select * from tb_registro;


