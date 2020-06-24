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
		email: {
			field: 'acesso_email',
			type: DataTypes.STRING,
			allowNull: false
		},
		
		senha: {
			field: 'acesso_senha',
			type: DataTypes.STRING,
			allowNull: false
		}
	}, 
	{
		tableName: 'tb_acesso', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Usuario;
};
