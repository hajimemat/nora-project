// redux-sagaを使用できるストアを作成する
import { createStore, applyMiddleware } from 'redux'
import createSagaMiddleware from 'redux-saga'

// 開発用のロガー
import logger from 'redux-logger'

// Reducer
import reducer from './reducers.js'

// Saga Tasks
import rootSaga from './sagas'


export default function configureStore(initialState) {
  const sagaMiddleware = createSagaMiddleware()
  const store = createStore(
    reducer,
    initialState,
    applyMiddleware(
      sagaMiddleware, logger()
    )
  )
  //sagaMiddleware.run(rootSaga)
  return store
}
