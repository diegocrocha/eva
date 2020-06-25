'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Usuario = sequelize.define('Usuario',{
		idUsuario: {
			field: 'acesso_id',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		nome: {
			field: 'acesso_nome',
			type: DataTypes.STRING,
			allowNull: false
		},		
		login: {
			field: 'acesso_email',
			type: DataTypes.STRING,
			allowNull: false
		},
		
		senha: {
			field: 'acesso_senha',
			type: DataTypes.STRING,
			allowNull: false
		},
		telefone: {
			field: 'empresa_tel',
			type: DataTypes.INTEGER,
			primaryKey: true,
		},		
		empresa: {
			field: 'acesso_empresa',
			type: DataTypes.STRING,
			allowNull: false
		},
		
		cnpj: {
			field: 'cnpj',
			type: DataTypes.STRING,
			allowNull: false
		}
		// cep: {
		// 	field: 'acesso_id',
		// 	type: DataTypes.INTEGER,
		// 	primaryKey: true,
		// 	autoIncrement: true
		// },		
		// numero: {
		// 	field: 'acesso_email',
		// 	type: DataTypes.STRING,
		// 	allowNull: false
		// },
		// complemento: {
		// 	field: 'acesso_senha',
		// 	type: DataTypes.STRING,
		// 	allowNull: false
		// }
	}, 
	{
		tableName: 'tb_acesso', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Usuario;
};
