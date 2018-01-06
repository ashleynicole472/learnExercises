'use strict';
module.exports = (sequelize, DataTypes) => {
  var Word = sequelize.define('Word', {
    word: DataTypes.STRING,
    type: DataTypes.STRING,
    definition: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return Word;
};