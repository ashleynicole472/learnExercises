import React, { Component } from 'react';
import {BrowserRouter as Router, Route, Redirect} from 'react-router-dom'
import {
    Button,
    Grid,
    Row,
    Col,
} from 'react-bootstrap'
import Header from '../Header.js'
import Morris from '../Images/Morris.jpg'

class ProfilePage extends Component{
    constructor(props){
        super(props)
        this.state = {
            apiUrl: "http://localhost:3000",
            cat: [],
            showcats: "/cats",
            makecats: "/",
            navbaraddcat: "Add a Cat",
            navbarallcats: "All the Cats",
            showmecats: "Show me the Cats",
            profile: "Profile"
        }
    }
componentWillMount(){
    const id = this.props.match.params.id
    console.log(`${this.state.apiUrl}/cats/${id}`)
  fetch(`${this.state.apiUrl}/cats/${id}`)
  .then((rawResponse) =>{
    return rawResponse.json()
  })
  .then((parsedResponse)=>{
    this.setState({cat: parsedResponse.cat})
  })
}

    render(){
        return(
            <div>
                <Header linked={this.state.showcats} navbartitle={this.state.profile}
                linkname={this.state.showmecats}/>
                <div className = "container">
                    <img src="#" />
                    <h3>Name: {this.state.cat.name}</h3>
                    <h2>City: {this.state.cat.city}</h2>
                    <h2>Age: {this.state.cat.age}</h2>
                    <p>Enjoys: {this.state.cat.enjoys}</p>
                </div>
            </div>
        );
    }
}

export default ProfilePage;
