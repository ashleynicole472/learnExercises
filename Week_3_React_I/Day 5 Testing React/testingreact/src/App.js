import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      clickedButton: "Play Game",
      gameWon: false,
    }
  }

  handleClick() {
    const newClickedButton = this.state.gameWon ? "Play Game" : "Excellent!"
    const newGameWon = this.state.gameWon ? false : true
    this.setState({clickedButton: newClickedButton, gameWon: newGameWon})
  }

  render() {
    return (
      <div>
        <button type="button" onClick={this.handleClick.bind(this)}>{this.state.clickedButton}</button>
        <div className="container"></div>
        <span id="result-text">{this.state.gameWon && <h4>Congratulations! You have won a free book about React!</h4>
        }
          </span>
      </div>
    );
  }
}

export default App;
