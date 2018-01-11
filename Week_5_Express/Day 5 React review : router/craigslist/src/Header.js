import React, { Component } from 'react'
import {
    Jumbotron
} from 'react-bootstrap'

class Header extends Component {
    render(){
        return(
            <div>
            <Jumbotron  className="jumbo">
        		<h1>Welcome to Apartment Locator!</h1>
        		<p>
        			Find the hottest apartments for rent in your area!
        		</p>
        	</Jumbotron>
            </div>
        )
    }
}

export default Header;
