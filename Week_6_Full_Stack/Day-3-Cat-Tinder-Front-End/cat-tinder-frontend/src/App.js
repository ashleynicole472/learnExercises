import React, { Component } from 'react';
import {BrowserRouter as Router, Route} from 'react-router-dom'
import {
    Button,
    Grid,
    Row,
    Col,
} from 'react-bootstrap'
import Cats from './pages/Cats.js'
import NewCat from './pages/NewCat.js'


class App extends Component {
    constructor(props){
        super(props)
        this.state = {
            cats: [
            {
                id: 1,
                name: 'Morris',
                city: 'Portland',
                age: 2,
                enjoys: "Long walks on the beach."
            },
            {
                id: 2,
                name: 'Paws',
                city: 'Philadelphia',
                age: 4,
                enjoys: "Snuggling by the fire."
            },
            {
                id: 3,
                name: 'Mr. Meowsalot',
                city:'London',
                age: 12,
                enjoys: "Being in charge."
            }
        ]
    }
}
render() {
    return (
        <Router>
            <div>
                <Route exact path="/" render={props => (
                    <div>
                        <div className="container-fluid">
                          <Row>
                            <Col sm={12}>
                              <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
                                <a className="navbar-brand" href="/">Cat tinder</a>
                                <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
                                    <span className="navbar-toggler-icon"></span>
                                </button>

                                <div className="collapse navbar-collapse" id="navbarColor01">
                                    <ul className="navbar-nav mr-auto">
                                        <li className="nav-item active">
                                          <a className="nav-link">Add a Cat <span className="sr-only">(current)</span></a>
                                        </li>
                                        <li className="nav-item">
                                          <a className="nav-link" href="/cats">Show me the cats</a>
                                        </li>
                                    </ul>
                                </div>
                              </nav>
                            </Col>
                          </Row>
                        </div>

                        <div className = "container">
                            <Row>
                                <Col sm={8}>
                                    <NewCat />
                                </Col>
                            </Row>
                        </div>
                    </div>
                )} />

                <Route exact path="/cats" render={props => (
                    <div>
                        <div className="container-fluid">
                            <Row>
                                <Col sm={12}>
                                    <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
                                        <a className="navbar-brand" href="/">Cat tinder</a>
                                        <Button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
                                        <span className="navbar-toggler-icon"></span>
                                        </Button>
                                            <div className="navbar-collapse collapse" id="navbarColor01">
                                                <ul className="navbar-nav mr-auto">
                                                    <li className="nav-item active">
                                                        <a className="nav-link">All the Cats <span className="sr-only">(current)</span></a>
                                                    </li>
                                                    <li className="nav-item">
                                                        <a className="nav-link" href="/">Add a Cat</a>
                                                    </li>
                                                </ul>
                                            </div>
                                    </nav>
                                </Col>
                            </Row>
                        </div>
                        <div className= "container">
                            <Row>
                                <Col>
                                    <Cats cats={this.state.cats} />
                                    </Col>
                            </Row>
                        </div>
                    </div>
                )} />
            </div>
        </Router>
    );
  }
}

export default App;
