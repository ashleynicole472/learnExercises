//Story 1
//Create a function that creates car objects which have a make, model year, and color.
//Add a function that returns make, model year, and color as one string and use the method to tell the user the car's information.

var carMaker = {
    modelYear: "2017",
    make: "Toyota",
    color: "White",
    myCar: function (){
        return this.modelYear + " " + this.color + " " + this.make
    }
}
carMaker.myCar();

//Story 2
//The car can accelerate, brake, and tell you its speed.

var carMaker = {
    modelYear: "2017",
    make: "Toyota",
    color: "White",
    myCar: function (){
        return this.modelYear + " " + this.color + " " + this.make;
    },
    speed: 0,
    howFast: function (){
        return this.speed;
    },
    accelerate: function(){
        return this.speed + 10;
    },
    break: function(){
        return this.speed - 7;
}
var getSpeed = carMaker.howFast()

//Story 3
//Create a car object and use a while loop to take its speed up to 50mph.
// Then use a while loop to brake down to 0mph.
// Surprise: it doesnt stop at 0mph, fix that.
//Hint: The loops use a car object, but is not part of the car object.

var carMaker = {
    speed: 0,
    accelerate: function(){
    while (this.speed < 70){
        this.speed += 10;
        console.log(this.speed);
    }
    },
    decelerate: function(){
        while (this.speed > 0){
            this.speed--;
            console.log(this.speed);
        }
    },
}
// Story 4
//Limit the car's maximum speed to 85mph. Try taking it above 80mph and see what happens.
// Hint: What should happen when you call accelerate at 80mph?

var carMaker = {
    speed: 0,
    maxSpeed: 85,
    accelerate: function(){
    while (this.speed < this.maxSpeed){
        if (this.speed < 80){
            this.speed += 10;
        }else if (this.speed === 80){
            this.speed += 5;
            }
        }
    },
    decelerate: function(){
        while (this.speed > 0){
            this.speed--;
            console.log(this.speed);
        }
    },
}
