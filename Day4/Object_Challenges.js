//Story 1
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
