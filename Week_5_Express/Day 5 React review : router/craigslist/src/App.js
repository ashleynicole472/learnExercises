import React, { Component } from 'react'
import {BrowserRouter as Router, Route} from 'react-router-dom'
import ApartmentIndex from './ApartmentIndex'
import ApartmentDetail from './ApartmentDetail'
import Apartments from './store/Apartments'
import Header from './Header'

class App extends Component {
  render() {
    return (
    <Router>
        <div>
            <Header />
            <Route exact path="/" component={ApartmentIndex} />
            <Route path='/Apartments/:id' component={ApartmentDetail} />
        </div>
    </Router>
    );
  }
}

export default App;
