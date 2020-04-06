create database EVA;

use EVA;

create table dado_empresa ( 
	empresa_id int primary key auto_increment,
    empresa_login varchar(40),
    empresa_email varchar(60),
    empresa_password varchar(16)
    )auto_increment = 1000;

create table dado_funcionario (
		func_id int primary key auto_increment,
		func_login varchar(20),
		func_passwaord varchar(16),
        func_fk_empresa int,
    
			foreign key(func_fk_empresa) references dado_empresa(empresa_id)

)	auto_increment=100;

create table setor (
		setor_id int primary key auto_increment,
		setor_nome varchar(40),
		setor_luz_padrao int,
		setor_fk_empresa int,
        
            foreign key(setor_fk_empresa) references dado_empresa(empresa_id)
)auto_increment = 10;

	create table dispositivo (
		dispo_id int primary key auto_increment,
		dispo_regi datetime,
		dispo_watts int,
		dispo_fk_setor int,
        
			foreign key(dispo_fk_setor) references setor(setor_id)
            
);

	create table registro_dispo (
		regi_id int,
		regi_fk_dispo int,
		regi_dispo datetime,
		regi_watts int,
        primary key (regi_id, regi_fk_dispo),
			
            foreign key(regi_fk_dispo) references dispositivo(dispo_id)

);

-- -- -- -- --
-- Inserts -- --
-- -- -- -- -- -- 

insert into dado_empresa values
	()
;
 

