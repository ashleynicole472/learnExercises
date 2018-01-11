import React, { Component } from 'react';

class KanyeRobot extends Component {
  render() {
    return (
      <div>
        <h2><u>Kanyebot 5000</u></h2>
        <h3>Im gonna let you finish but Beyonce is {this.props.greeting}!</h3>
      </div>
    );
  }
}

export default KanyeRobot;
