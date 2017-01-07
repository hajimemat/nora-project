import React from 'react'
import ReactDOM from 'react-dom'
import { Provider, connect } from 'react-redux';


//import * as SamuraiMap from './SamuraiMap/Container'
import configureStore from "./react/configureStore";


const store = configureStore({
'reducer': {
}
});

class Hoge extends React.Component {
    render(){
        alert (111)
        return <h2>hoge</h2>;
    }
}

// export const hoge = connect(state => {
//     return {}
// }, dispatcher => {
//     return {
//     }
// })(Hoge);

const Hohoho = connect(state => {
  return {
  }
}, dispatch => {
  return {
  }
})(Hoge)


ReactDOM.render(
  <Provider store={store}>
      <Hohoho />
  </Provider>
  , document.getElementById('hoge')
)

