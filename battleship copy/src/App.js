import React, { Component } from 'react';

const EMPTY = 0
const SHIP = 1
const HIT = 2
const MISS = 3

class Board extends Component {
  constructor(props){
    super(props)
    //Maintain state for the entire game in your main component
    this.state = {
      board: this.getBoard(10),
      shots: 25,
      message: 'Take the shot!!!'
    }

    for(let i = 0;i < 5; i++){
      this.putShip()
    }
  }

  //loop create another for loop to create the <td> tags
  renderRow(rowNumber) {
    const { board } = this.state

    let row = []

    for(let i = 0;i < 10; i++) {
      // create single cell with id of coordinates
      // 0-0   3-5
      let className;

      switch (board[i][rowNumber]) {
        case MISS:
          className = 'miss'
          break;
        case HIT:
          className = 'hit'
          break;
        case SHIP:
          className = 'ship'
          break;
        default:
          className = 'blank'
      }

      row.push(<td
                  id={i + '-' +rowNumber}
                  className={className}
                  onClick={this.handleClick.bind(this)}>
                  </td>)

    }
    return row;
  }

//Use a for loop to append to a table a <tr> tag
  renderRows(){
    let newBoard = []
    for(let i = 0; i < 10; i++) {
      newBoard.push(<tr>{this.renderRow(i)}</tr>)
    }
    console.log(this.state.board);
    return newBoard;
  }
//checks for ship on click, keeps track of shots taken
  handleClick(event) {
    var clickEvent = event.target.id;
    var pos = clickEvent.split("-");
    var x = pos[0];
    var y = pos[1];
    let newBoard = this.state.board;
    let newShots = this.state.shots;
    let newMessage = this.state.message;
    if (newBoard[x][y] === 0) {
      newBoard[x][y] = MISS;
      newShots--;
      newMessage = 'You missed!';
    }else if (newBoard[x][y] === 1) {
      newBoard[x][y] = HIT;
      newShots--;
      newMessage = 'You hit something!'
    }
    this.setState({
      board: newBoard,
      shots: newShots,
      message: newMessage,
    })

    console.log(x + ' ' + y);
    console.log("click")
    console.log(newShots);
  }

  //and places 5 single length ships.
  putShip(){
    let newBoard = this.state.board;
    let a = Math.floor(Math.random() * 10);
    let b = Math.floor(Math.random() * 10);
    if(newBoard[a][b] === 1){
      this.putShip()
    } else{
      newBoard[a][b] = SHIP
      this.setState({board: newBoard});
    }
  }

  getBoard(boardSize) {
    let board = []

    for (let row = 0 ; row < boardSize; row++) {
      board[row] = []
      for (let col = 0 ; col < boardSize; col++) {
        board[row][col] = EMPTY
      }
    }

    // console.log(board);

    return board;
  }
  // renderState(){
  //   this.getBoard();
  //   this.getPos();
  //   this.putShip();
  // }

  render() {
    return (
      <div>
        <table>
          <tbody>
            { this.renderRows() }
          </tbody>
        </table>
        <h1 className = "msg">{this.state.message}</h1>
        <span className = "shotCount">{this.state.shots}</span> shots left
      </div>
    );
  }
}

export default Board;
