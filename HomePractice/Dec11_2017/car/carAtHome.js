class Car{
  constructor(wheels, model, modelYear, lightStatus, turnRightSignal, turnleftSignal, speedOfCar){
      this.wheels= 4,
      this.model = model,
      this.modelYear = 2017,
      this.lightStatus = "Off",
      this.turnRightSignal = "Off",
      this.turnleftSignal = "Off",
      this.speedOfCar = 0;
    }
    lightOn(){
      this.lightStatus = true;
      console.log("Lights on")
    }
    lightOff(){
      this.lightStatus = false;
      console.log("Lights off")
    }
    turnRight(){
      this.turnSignal = true;
      console.log("blinker Right")
    }
    turnLeft(){
      this.turnleftSignal = true;
      console.log("Binker Left")
    }
    speed(){
      this.speedOfCar = 0;
    }

  }

class Tesla extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar += 10;
//make speed increase for teslaSpeed
  }
  deaccelerate(){
    this.speedOfCar -= 7;
  }
}


class Toyota extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar += 7;
  }
  deaccelerate(){
    this.speedOfCar -= 5;
    // document.getElementById("toyotaSpeed").innerHTML = this.speedOfCar + "km/h";
  }
}

class Tata extends Car{
  constructor(){
    super();
  }
  accelerate(){
    this.speedOfCar += 2;
    // document.getElementById("tataSpeed").innerHTML = this.speedOfCar + "km/h";
  }
  deaccelerate(){
    this.speedOfCar -= 1.25;
    // document.getElementById("tataSpeed").innerHTML = this.speedOfCar + "km/h"
  }
}

var myTesla = new Tesla;
// Story: As a programmer, I can make a Tata car.

var myTata = new Tata;

// Story: As a programmer, I can make a Toyota car.

var myToyota = new Toyota

function teslaSpeedUp(){
  myTesla.accelerate()
    document.getElementById("teslaSpeed").innerHTML = myTesla.speedOfCar + "km/h";
}

function teslaSlowDown(){
  myTesla.deaccelerate();
    document.getElementById("teslaSpeed").innerHTML = myTesla.speedOfCar + "km/h";
}

function toyotaSpeedUp(){
  myToyota.accelerate();
      document.getElementById("toyotaSpeed").innerHTML = myToyota.speedOfCar + "km/h";
}

function toyotaSlowDown(){
  myToyota.deaccelerate();
      document.getElementById("toyotaSpeed").innerHTML = myToyota.speedOfCar + "km/h";
}

function tataSpeedUp(){
  myTata.accelerate();
      document.getElementById("tataSpeed").innerHTML = myTata.speedOfCar + "km/h";
}

function tataSlowDown(){
  myTata.deaccelerate();
      document.getElementById("tataSpeed").innerHTML = myTata.speedOfCar + "km/h";

}
