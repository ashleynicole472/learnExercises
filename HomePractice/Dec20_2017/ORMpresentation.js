yarn int starts a new node project, walks us through the process of naming and setting up the package.JSON
yarn add sequelize pg@6.1.5 adds dependancies to our app, it will change the package.json and add dependencies in the json package.
    Also our node moduels will be updated adding a memo saying what the new dependancies are being added.

$ mkdir models
$ cd models
new Sequelize('database-name', 'username', 'password', {options})
^ creating a new class, using this because sqliz dependancie is within our program.
