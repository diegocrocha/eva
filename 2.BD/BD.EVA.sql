create database grupo_EVA;
use grupo_EVA;
create table Cliente_Matriz(
id_Cliente int primary key auto_increment,
CNPJ_Cliente char (18),
categoria_Estab varchar (30),
nome_Cliente varchar (40),
endereco_Cliente varchar (80),
cidade_Cliente varchar (30),
estado_Cliente char (2),
contato_Cliente varchar (40),
telefone_Cliente varchar (14),
email_Cliente varchar (30)
);

insert into Cliente_Matriz values
(0001,'05.089.637/0001-10','Vinícola','Grand Cru', 'Avenida Aruana, 884','São Paulo', 'SP', 'Renato', '(11)4756-9988', 'renato@grandcru.com.br'),
(0002,'59.104.273/0001-29', 'Concessionária', 'Mercedes-Benz', 'Av. Alfred Jurzykowski, 562','São Bernado do Campo', 'SP', 'Mariana', '(11)5563-3466', 'mariana@mercedes.com'),
(0003, '45.543.915/0001-81', 'Hipermercado', 'Carrefour', 'George Eastman, 213','São Paulo', 'SP', 'Silvana','(11)5478-5426', 'silvana@carrefour.com.br'),
(0004, '87.848.180/0001-44', 'Centro de Exposiçoes', 'Centro de Exposiçoes Imigrantes','1,5, Rod. dos Imigrantes','São Paulo', 'SP','Camila', '(11)2105-3122', 'camila@expo.com.br');
select * from Cliente_Matriz;

create table Estabelecimento(
id_Estab int primary key auto_increment,
endereco_Estab varchar (80),
cidade_Estab varchar (30),
estado_Estab char (2),
contato_Estab varchar(40),
telefone_Estab varchar (14),
email_Estab varchar (50),
login_Estab varchar (20),
senha_Estab varchar (20),
fk_Cliente int,
foreign key (fk_Cliente) references Cliente_Matriz(id_Cliente)
) auto_increment = 10;

insert into Estabelecimento values
(null, 'Alameda Nhambiquaras, 614', 'São Paulo','SP', 'Juliana', '(11)3624-5819', 'juliana.almeida@grandcru.com.br','juliana.almeida', '12345', 1);
insert into Estabelecimento values
(null, 'Rua Cotoxó, 493','São Paulo','SP', 'Carlos', '(11)3853-3933', 'carlos.soares@grandcru.com.br','carlos.soares', '67891', 1);
insert into Estabelecimento values
(null, 'R. Treze de Maio, 1947','São Paulo','SP', 'Jorge', '(11)3287-5487', 'jorge.tavares@grandcru.com.br','jorge.tavares', '13579', 1);
insert into Estabelecimento values
(null,'Av. Hélio Pellegrino, 35', 'São Paulo','SP', 'Lucas', '(11)4385-6286', 'lucas.ambrosio@mercedes.com','lucas.ambrosio', '91827', 2);
insert into Estabelecimento values
(null,' R. Eduardo Froner, 1070', 'Guarulhos', 'SP', 'Patricia', '(11)2436-4920', 'patricia.souza@mercedes.com', 'patricia.souza','123123', 2);
insert into Estabelecimento values
(null,' Av. Luís Carlos Prestes, 350', 'Rio de Janeiro', 'RJ', 'Pamela', '(11)2411-4720', 'pamela.silva@carrefour.com.br', 'pamela.silva','123123',3);
insert into Estabelecimento values
(null,'1,5, Rod. dos Imigrantes', 'São Paulo','SP', 'Adriana', '(11)98493-9843', 'adriana.vieira@expo.com.br','adriana.vieira','321312', 4);

select * from Estabelecimento;

create table Setor(
id_Setor_loja int primary key auto_increment,
nome_Setor varchar (30),
fk_Estab int,
foreign key (fk_Estab) references Estabelecimento (id_Estab)
) auto_increment = 100;

insert into Setor values
(100, 'Tintos', 10),
(101, 'Brancos', 10),
(102, 'Tintos', 11),
(103, 'Brancos', 11),
(104, 'Espumantes', 12),
(105, 'Esportivo', 13),
(106, 'SUV', 13),
(107, 'Sedan', 14),
(108, 'Cosmético', 15),
(109, 'Leite', 15),
(110, 'Agrário', 16);
select * from Setor;

create table Sensor(
id_Sensor int primary Key auto_increment,
faixa_luzpadrão_Setor int,
frequencia_solicitada_Setor int,
fk_Setor int,
foreign Key (fk_Setor) references Setor (id_Setor_loja)
) auto_increment = 1000;

insert into Sensor values
(1000, '500', '3' , 100),
(1001, '500', '3' , 101),
(1002, '700', '3' , 102),
(1003,'600', '3' , 103),
(1004,'600', '3' , 104),
(1005,'1000', '5' , 105),
(1006,'1000', '5' , 106),
(1007,'1000', '5' , 107),
(1008,'1000', '2' , 108),
(1009,'1000', '2' , 109),
(1010,'1000', '5' , 110);
select * from Sensor;

create table Registro (
fk_Sensor int,
foreign key (fk_Sensor) references Sensor (id_Sensor),
id_Registro int auto_increment,
primary key (id_Registro, fk_Sensor),
dia_Registro date,
hora_Registro time,
luz_Registrada int
)  auto_increment = 10000;

insert into Registro values
( 1000,10000,'2020-03-20', '08:00', 500),
(1000,10001,'2020-03-20', '08:30', 450),
(1000,10002,'2020-03-20', '09:30', 450),
(1001,10003,'2020-03-25', '10:30', 450),
(1001,10004,'2020-03-25', '10:30', 450);
select * from Registro;
