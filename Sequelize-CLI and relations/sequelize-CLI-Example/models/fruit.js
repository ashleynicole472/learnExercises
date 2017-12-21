'use strict';
module.exports = (sequelize, DataTypes) => {
  var Fruit = sequelize.define('Fruit', {
      name: DataTypes.STRING,
      calories: DataTypes.INTEGER,
      description: DataTypes.STRING,
      flavor: DataTypes.STRING,
      color: DataTypes.STRING,
      size: DataTypes.STRING
}, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return Fruit;
};
