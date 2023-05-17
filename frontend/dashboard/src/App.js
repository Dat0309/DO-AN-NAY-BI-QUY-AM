import './App.scss';
import { Dashboard, Sidebar, PlantData } from './Components';
import { Routes, Route } from 'react-router-dom'

function App() {
  return (
    <div className="App">
      <div className='AppGlass'>
        <Sidebar />
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/plantdata" element={<PlantData />} />
        </Routes>
      </div>
    </div>
  );
}

export default App;
