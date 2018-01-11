// Story: As a programmer, I can make a car.
// Hint: Create a class called Car, and create a variable called myCar which contains an object of class Car.
class Car{
    constructor(){
    }
}
var myCar = new Car()
// Story: As a programmer, I can tell how many wheels a car has; default is four.
class Car{
    constructor(){
        this.wheels = 4
        this.model = "model"
    }

}
// Story: As a programmer, I can make a Tesla car.
// Hint: Create an variable called myTesla which is of class Tesla which inherits from class Car.
class Tesla extends Car{
    constructor(){
        super()
        this.make = "Tesla"
    }
}
var myTesla = new Tesla()
myTesla.make
myTesla.model = "Model S"
myTesla.year = 2018
// Story: As a programmer, I can make a Tata car.
class Tata extends Car {
    constructor(){
        super()
        this.color = "blue"
    }
}

var myTata = new Tata()
myTata.color

var
// Story: As a programmer, I can make a Toyota car.
class Toyota extends Car{

}
// Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
// Hint: Make model year part of the initialization.
class Car{
    constructor(){
        this.wheels = 4
        this.year = 1111
    }
}
// Story: As a programmer, I can turn on and off the lights on a given Car.
// Hint: Create method(s) to allow programmer to turn lights on and off. Which class are the methods in?
class Car{
    constructor(){
        this.wheels = 4
        this.model = "model"
        this.year = 1111
        this.lights = false
        this.signal = "off"
        this.sigleft = false
        this.sigright = "right signal"
    }
    // Story: As a programmer, I can determine if the lights are on or off. Lights start in the off position.
    headLights(){
        if(this.lights === false){
            return "Off"
        } else {
            return "Lights on."
        }
    }
    changeHeadlights(){
        if(this.lights){
            this.lights = false;
        } else {
            this.lights = true;
        }
    }
    // Story: As a programmer, I can signal left and right. Turn signals starts off.
    // if turn signal is off - signal === "off"
    //
    //
    turnSignal(){
        if(this.signal == "off"){
             return this.signal = "left";
        }
        else if (this.sigleft){
            return this.sigleft = "Left or turn off?";
        }
        else if (this.sigright){
            return this.sigright = "Right or turn off?"
        }
    }
}

// Story: As a programmer, I can determine the speed of a car. Speed starts at 0 km/h.
//
// Story: As a programmer, I can speed my Teslas up by 10 per acceleration.
//
// Story: As a programmer, I can slow my Teslas down by 7 per braking.
//
// Story: As a programmer, I can speed my Tatas up by 2 per acceleration.
//
// Story: As a programmer, I can slow my Tatas down by 1.25 per braking.
//
// Story: As a programmer, I can speed my Toyotas up by 7 per acceleration.
//
// Story: As a programmer, I can slow my Toyotas down by 5 per braking.
//
// Story: As a programmer, I can call upon a car to tell me all it's information.
// Hint: Implement carInfo method on one or more classes. You can call a super class's carInfo with super.
//
// Story: As a programmer, I can keep a collection of two of each kind of vehicle, all from different years.
// Hint: Create two of each vehicles, all from different model years, and put them into an Array.
//
// Story: As a programmer, I can sort my collection of cars based on model year.
//
// Story: As a programmer, I can sort my collection of cars based on model.
// Hint: Sort based on class name.
//
// Story: As a programmer, I can sort my collection of cars based on model and then year.
