'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Leitura = sequelize.define('Leitura',{	
			
		temperatura: {
			field: 'registro',
			type: DataTypes.DATE,
			allowNull: false
		},
		umidade: {
			field: 'luminosidade',
			type: DataTypes.REAL,
			allowNull: false
		},
		momento: {
			field: 'fk_sensor_id',
			type: DataTypes.INTEGER, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		momento_grafico: {
	 		type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select
	 		allowNull: true
		},
	
		tableName: 'tb_registro', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Leitura;
};
