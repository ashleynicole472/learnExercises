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
      this.lightStatus = true;
      console.log("on")
    }
    lightOff(){
      this.lightStatus = false;
      console.log("off")
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

class Tesla extends Car{
  constructor(){
    super();
    this.model= "Tesla"
    this.modelYear="2017"
  }
  accelerate(){
    this.speedOfCar =+ 10;
    console.log("GOO")
}
  deaccelerate(){
    this.speedOfCar -= 7;
    console.log("STOP")
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

var myTesla = new Tesla(4, "Tesla");

var myTatas = new Tatas(4, "Tatas");

var myToyota = new Toyota(4, "Toyota");
