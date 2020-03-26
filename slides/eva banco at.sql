create database eva;

use eva;


create table empresa(
cnpj varchar(14) primary key,
empresa_nome varchar(40) not null,
email varchar(50),
senha varchar(40) not null,
telefone varchar(13)
);


create table usuario(
id_usuario int primary key auto_increment,
nome_user varchar(40) not null,
cpf varchar(11) not null,
fkcnpj varchar(14),

foreign key (fkcnpj)
references empresa(cnpj)
);

create table mensal(
idmensal int primary key auto_increment,
fkcnpj varchar(14),
valor_kwh float,
gastos float,
economia float, 
fkDados int,

foreign key (fkcnpj)
references empresa(cnpj),
foreign key (fkDados)
references dados(idDados)
);

create table dados(
idDados int primary key auto_increment,
intensidade float not null,
horas time,
lumens float not null,
dia date,
fkidsensor int,
fkcnpj varchar(14),

foreign key (fkidsensor)
references sensores(idsensor),
foreign key (fkcnpj)
references empresa(cnpj)
);

create table sensores(
idsensor int primary key auto_increment,
area_sensor varchar(10) not null,
fkcnpj varchar(14),

foreign key(fkcnpj)
references empresa(cnpj)
);

select * from empresa;

insert into empresa values('92864872000116', 'Carrefour', 'carrefour@administraçao.com.br', 'carrefouradm', '(11)5678-9876');
insert into empresa values('96239176000170', 'Extra', 'extra@administraçao.com.br', 'extrasuporte', '(11)7654-9812');
insert into empresa values('09592804000100', 'Pão de Açucar', 'paodeaçucar@geral.com.br', 'paoacucar123', '(21)6578-3489');
select * from empresa;
delete from empresa where cnpj = '96239176000170';

insert into usuario values(null, 'Marcelo Whitehead', '44039080805', '09592804000100');
insert into usuario values(null, 'Milene Oliveira', '46037862803', '96239176000170');
insert into usuario values(null, 'Yuri Vedovate', '45056764802', '92864872000116');
insert into usuario values(null, 'Victor Samir', '65076865201', '09592804000100');
select * from usuario;
select empresa.*, id_usuario, nome_user from empresa, usuario where fkcnpj = cnpj;

insert into sensores values(null, 'Hortifruti', '09592804000100');
insert into sensores values(null, 'Bebidas', '09592804000100');
insert into sensores values(null, 'Carnes', '96239176000170');
insert into sensores values(null, 'Limpeza', '96239176000170');
select empresa.*, idsensor, area_sensor from empresa, sensores where fkcnpj = cnpj;


drop database eva;
