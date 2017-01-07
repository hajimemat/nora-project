import React from 'react'
import ReactDOM from 'react-dom'
import { Provider, connect } from 'react-redux';


//import * as SamuraiMap from './SamuraiMap/Container'
import configureStore from "./configureStore";


const store = configureStore({});

class Hoge extends React.Component {
    render() {
        return ('a');
    }
}


const hoge = connect(s => {
    return s;
}, dispatcher => {
    return {
    }
})(Hoge);


ReactDOM.render(
  <Provider store={store}>
      <hoge />
  </Provider>
  , document.getElementById('hoge')
)

