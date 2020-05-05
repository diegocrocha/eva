create database EVA;
use EVA;
create table Cliente_Matriz(
	id_Cliente int primary key auto_increment,
	CNPJ_Cliente char (18),
	categoria_Estab varchar (30),
	nome_Cliente varchar (40),
	contato_Cliente varchar (40),
	telefone_Cliente varchar (14),
	email_Cliente varchar (30)
);

create table Estabelecimento(
	id_Estab int primary key auto_increment,
	responsável varchar (20),
	fk_idCliente int,
	foreign key (fk_idCliente) references Cliente_Matriz (id_Cliente)
) auto_increment = 10;

create table Acesso(
	id_Acesso int primary key auto_increment,
	email varchar (30),
	senha varchar (10),
	fk_id_Estab int,
	foreign key (fk_id_Estab) references Estabelecimento (id_Estab)
) auto_increment=300;

create table Endereço(
	idEndereço int primary key auto_increment,
	CEP char (9),
	numero varchar (4),
	complemento varchar (30),
	fk_id_Estab int,
	foreign key (fk_id_Estab) references Estabelecimento(id_Estab),
	fk_id_Cliente int,
	foreign key  (fk_id_Cliente) references Cliente_Matriz(id_Cliente)
);

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
(0001,'05.089.637/0001-10','Vinícola','Grand Cru', 'Renato', '(11)4756-9988', 'renato@grandcru.com.br'),
(0002,'59.104.273/0001-29', 'Concessionária', 'Mercedes-Benz', 'Mariana', '(11)5563-3466', 'mariana@mercedes.com'),
(0003, '45.543.915/0001-81', 'Hipermercado', 'Carrefour', 'Silvana','(11)5478-5426', 'silvana@carrefour.com.br'),
(0004, '87.848.180/0001-44', 'Centro de Exposiçoes', 'Centro de Exposiçoes Imigrantes' ,'Camila', '(11)2105-3122', 'camila@expo.com.br');
select * from Cliente_Matriz;

insert into Estabelecimento values
(null, 'José Fabiano',0001),
(null,'Cristiano Augusto',0002),
(null, 'Sarah Alvez',0003),
(null, 'Marta Cristo',0004);

select * from Estabelecimento; 

insert into Acesso values 
(null,'josefabiano@gmail.com','12345678',10),
(null,'Cristianoaugusto@gmail.com','87654321',11),
(null,'sarahalvez@gmail.com','53426sah',12),
(null,'martacristo@gmail.com','982675gab',13);
select * from Acesso;

insert into Endereço values
(null, '02345-574','884','Loja',10,0001),
(null, '02248-324','562','Loja',11,0002),
(null, '03355-780','213','Mercado',12,0003),
(null, '09756-321','52','Centro de exposição',13,0004);

select * from Endereço;

insert into Setor values
(null,'Tintos', '500', '3',10),
(null, 'Brancos','500', '3',10),
(null, 'Tin	tos','700', '3',10),
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


