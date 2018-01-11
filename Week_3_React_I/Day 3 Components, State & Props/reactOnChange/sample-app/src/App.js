import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Robotears from './robotears.js'
import GoodRobot from './goodrobot.js';
import BadRobot from './badrobot.js';
import KanyeRobot from './kanyerobot5000.js'

class App extends Component {
    constructor(props){
        super(props)
        this.state= {
            greeting: ''
        }
    }

    updateGreeting(newinput){
        console.log(newinput.target.value)
        this.setState({greeting: newinput.target.value})
    }

      render() {
        return (
          <div>
            <Robotears />
            <input value={this.state.greeting} onChange={this.updateGreeting.bind(this)} />
            <GoodRobot />I hear you say{this.state.greeting}
            <BadRobot /> blahblahblah
            <KanyeRobot />Im gonna let you finish but Beyonce is {this.state.greeting} !
          </div>
        );
      }
    }

export default App;
    //
    // class App extends Component {
    //     constructor(props){
    //         super(props)
    //         this.state = {
    //             RobotEars: ''
    //         }
    //     }
    //
    //

//
//   render() {
//     return (
//         <div>
//         <h1><u>Robot is listening</u></h1>
//           <div>
//             <Robotears ={this.state.greeting} />
//           </div>
//           <div>
//             <RobotearsInput ={this.state.greeting} updateGreeting={this.updateGreeting.bind(this)} />
//           </div>
//       </div>
//     );
//   }
// }
