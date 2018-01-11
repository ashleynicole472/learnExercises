'use strict';
module.exports = (sequelize, DataTypes) => {
  var Phone = sequelize.define('Phone', {
    number: DataTypes.STRING,
    description: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        Phone.belongsTo(models.Contact,{
          foreignKey: 'contactId',
          onDelete: 'CASCADE'
        })
      }
    }
  });
  return Phone;
};
