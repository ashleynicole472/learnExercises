'use strict';
module.exports = (sequelize, DataTypes) => {
  var Squirrels = sequelize.define('Squirrels', {
    name: DataTypes.STRING,
    calories: DataTypes.INTEGER,
    description: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return Squirrels;
};