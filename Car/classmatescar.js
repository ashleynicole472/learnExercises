/* tory: As a programmer, I can make a car.
Hint: Create a class called Car, and create a variable called myCar which contains an object of class Car. */

// Story: As a programmer, I can tell how many wheels a car has; default is four. line 9 object inside variable
//
//

class Car{
  constructor(wheels, model, modelYear, lightStatus, turnRightSignal, turnleftSignal, speedOfCar){
      this.wheels= 4,
      this.model = model,
      this.modelYear = 2017,
      this.lightStatus = "Off",
      this.turnRightSignal = "Off",
      this.turnleftSignal = "Off"
      this.speedOfCar = 0;

    }
    lightOn(){
      this.lightStatus = "On";
    }
    lightOff(){
      this.lightStatus = "Off";
    }
    turnRight(){
      this.turnSignal = true;
    }
    turnLeft(){
      this.turnleftSignal = true;
    }
    speed(){
      this.speedOfCar = 0;
    }

  }


// Story: As a programmer, I can make a Tesla car.
// Hint: Create an variable called myTesla which is of class Tesla which inherits from class Car.
/*
var myCar = new Car{
  super();
}
*/

class Tesla extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar =+ 10;
  }
  deaccelerate(){
    this.speedOfCar -= 7;
  }
}

class Tatas extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar =+ 2;
  }
  deaccelerate(){
    this.speedOfCar -= 1.25;
  }
}


class Toyota extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar =+ 7;
  }
  deaccelerate(){
    this.speedOfCar -= 5;
  }
}

var myTesla = new Car(4, "Tesla");
// Story: As a programmer, I can make a Tata car.

var myTatas = new Car(4, "Tatas");

// Story: As a programmer, I can make a Toyota car.

var myToyota = new Car(4, "Toyota");

// Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
// Hint: Make model year part of the initialization.

// Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
// Hint: Make model year part of the initialization.

// Story: As a programmer, I can turn on and off the lights on a given Car.
// Hint: Create method(s) to allow programmer to turn lights on and off. Which class are the methods in?
//
// Story: As a programmer, I can determine if the lights are on or off. Lights start in the off position.
var carInfo = function() {
  return this.wheels ;
}
