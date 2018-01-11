import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './Header.js'
import GreetingInput from './GreetingInput.js'
import GoodRobot from './GoodRobot.js'
import BadRobot from './BadRobot.js'
import KanyeRobot from './KanyeRobot.js'

class App extends Component {
  constructor(props){
    super(props)
    this.state = {
      greeting: 'testing'
    }
  }

  updateGreeting(greeting){
    this.setState({greeting: greeting})
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Robo Active Listening</h1>
        </header>
          <div>
            <Header greeting={this.state.greeting} />
          </div>
          <div>
          <GreetingInput greeting={this.state.greeting} updateGreeting={this.updateGreeting.bind(this)} />
          </div>
          <div>
            <GoodRobot greeting={this.state.greeting} />
          </div>
          <div>
            <BadRobot greeting={this.state.greeting} />
          </div>
          <div>
            <KanyeRobot greeting={this.state.greeting} />
          </div>
      </div>
    );
  }
}

export default App;
