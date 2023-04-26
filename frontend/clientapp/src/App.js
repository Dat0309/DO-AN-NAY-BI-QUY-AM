import Router from './router/Router';
import { RouterProvider } from 'react-router-dom'

import './App.scss';

function App() {
  return (
    <RouterProvider router={Router}></RouterProvider>
  );
}

export default App;
