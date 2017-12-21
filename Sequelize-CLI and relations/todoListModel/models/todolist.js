'use strict';
module.exports = (sequelize, DataTypes) => {
  var ToDoList = sequelize.define('ToDoList', {
    status: DataTypes.BOOLEAN,
    description: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return ToDoList;
};