'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
      return queryInterface.bulkInsert('Cats',
        [
          {
            name: 'Morris',
            city: 'Portland',
            age: 4,
            enjoys: "Enjoys long walks from window to food bowl.  Its a tough job out there for a cat.",
            createdAt: new Date(),
            updatedAt: new Date()
          },
          {
            name: 'Tiny',
            city: 'Paris',
            age: 12,
            enjoys: "Enjoys cuddling by the fire.  I'm built for comfort, and I know it.",
            createdAt: new Date(),
            updatedAt: new Date()
          },
          {
            name: 'Mac',
            city: 'San Fran',
            age: 5,
            enjoys: "I enjoy being in charge, neigh,  I demand to be in charge. Whatever the situation, whoever is involved, I'm the boss.  We clear?",
            createdAt: new Date(),
            updatedAt: new Date()
          }
        ]
      )
    },

  down: (queryInterface, Sequelize) => {
        return queryInterface.bulkDelete('Uers', null, {})
  }
};
