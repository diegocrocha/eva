create database EVA;
use EVA;
create table Cliente_Matriz(
	id_Cliente int primary key auto_increment,
	cliente_representante varchar(40),
	representante_email varchar(100),
	empresa varchar(40),
	CNPJ char (18),
	cliente_tel1 char(13),
	cliente_tel2 char(13),
	categoria varchar(40)
)auto_increment = 0001;

create table Estabelecimento(
	id_Estab int primary key auto_increment,
	responsável varchar (20),
	fk_idCliente int,
	CEP char (9),
	numero varchar (4),
	complemento varchar (20),
	foreign key (fk_idCliente) references Cliente_Matriz (id_Cliente)
) auto_increment = 10;

create table Acesso(
	id_Acesso int primary key auto_increment,
	email varchar (30),
	senha varchar (10),
	fk_id_Estab int,
	foreign key (fk_id_Estab) references Estabelecimento (id_Estab)
) auto_increment=300;

create table Setor(
	id_Setor_Estab int primary key auto_increment,
	nome_Setor varchar (30),
	frequência_setor  varchar (30),
	faixa_luzpadrão_setor varchar (30),
	fk_id_Estab int,
	foreign key (fk_id_Estab) references Estabelecimento (id_Estab)
) auto_increment = 100;

create table Sensor(
	idSensor  int primary key auto_increment,
	fk_id_Setor_Estab int,
	foreign key (fk_id_Setor_Estab) references Setor (id_Setor_Estab)
) auto_increment = 100;

create table DadosSensor(
	id_dados int primary key auto_increment,
	dataH_Registro datetime,
	luminosidade_Registrada int,
	fk_idSensor int,
	foreign key (fk_idSensor) references Sensor (idSensor)
)  auto_increment = 10000;

insert into Cliente_Matriz values
(null,'Renato','renato@grandcru.com.br','Grand Cru','05.089.637/0001-10','(11)4756-9988','','Vinícola'),
(null,'Mariana','mariana@mercedes.com.br','Mercedes-Benz','59.104.273/0001-29','(11)5563-3466','','Concessionária'),
(null,'Silvana','silvana@carrefour.com.br','Carrefour','45.543.915/0001-81','(11)4756-9988','','Hipermercado'),
(null,'Renato','camila@expo.com.br','Centro de Exposiçoes Imigrantes','87.848.180/0001-44','(11)2105-3122','','Centro de Exposição')
;
select * from Cliente_Matriz;

insert into Estabelecimento values
(null, 'José Fabiano',0001,'02345-574','884','bloco B'),
(null,'Cristiano Augusto',0002, '02364-528','182','Prédio A'),
(null, 'Sarah Alvez',0003, '25245-783','1001',''),
(null, 'Marta Cristo',0004, '28455-285','224','');

select * from Estabelecimento; 

insert into Acesso values 
(null,'josefabiano@gmail.com','12345678',10),
(null,'Cristianoaugusto@gmail.com','87654321',11),
(null,'sarahalvez@gmail.com','53426sah',12),
(null,'martacristo@gmail.com','982675gab',13);
select * from Acesso;

insert into Setor values
(null,'Tintos', '500', '3',10),
(null, 'Brancos','500', '3',10),
(null, 'Tintos','700', '3',10),
(null,'Brancos','600', '3',10),
(null,'Espumantes','600', '3',10),
(null,'Esportivo','1000', '5',11),
(null,'SUV','1000', '5',11),
(null,'Sedan','1000', '5',11),
(null,'Cosmético','1000', '2',12),
(null,'Leite','1000', '2',12),
(null,'Agrário','1000', '5',13);

select * from Setor; 

insert into Sensor values
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

select * from Sensor; 

insert into DadosSensor values
(null,'2020-03-20 08:00:00', 500,100),
(null,'2020-03-20 08:30:00', 450,101),
(null,'2020-03-20 09:30:00', 450,102),
(null,'2020-03-25 10:00:00', 450,103),
(null,'2020-03-25 10:30:00', 450,104),
(null,'2020-03-20 11:00:00', 400,105),
(null,'2020-03-20 11:30:00', 450,106),
(null,'2020-03-20 12:00:00', 450,107),
(null,'2020-03-25 12:30:00', 450,108),
(null,'2020-03-25 13:00:00', 450,109),
(null,'2020-03-25 13:30:00', 450,110);

select * from DadosSensor;


