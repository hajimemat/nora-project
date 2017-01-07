import { fork, put, take, call } from 'redux-saga/effects';
import { delay } from 'redux-saga';
// import * as Samurai from './actions';
// import googleMapTask from './saga-tasks/google-map';
// import fetch from 'isomorphic-fetch';
//
//
// function* handleInitialized() {
//   while(true) {
//     const action = yield take(Samurai.INIT);
//
//     const categories = yield call(p => {
//       return fetch('/loadCategories')
//         .then(res => res.json())
//         .then(json => JSON.parse(json));
//     })
//
//     const regions = yield call(p => {
//       return fetch('/loadRegions')
//         .then(res => res.json())
//         .then(json => JSON.parse(json));
//     })
//
//     const dates = yield call(p => {
//       return fetch('/loadDates')
//         .then(res => res.json())
//         .then(json => JSON.parse(json));
//     })
//
//
//     yield put(onInitialize({
//       categories: categories,
//       regions: regions,
//       dates: dates,
//       center: {
//         lat: regions[0].lat,
//         lng: regions[0].lng
//       },
//       zoom: regions[0].zoom
//     }))
//   }
// }
//
// function onInitialize(payload){
//   return {
//     type: Samurai.INITIALIZED,
//     categories: payload.categories,
//     regions: payload.regions,
//     dates: payload.dates,
//     center: payload.center,
//     zoom: payload.zoom
//   }
// }
//
function* handleInitialized() {
  while(true) {
      const action = yield take('init')
  }
}
export default function* rootSaga(){
    yield fork(handleInitialized)
}
