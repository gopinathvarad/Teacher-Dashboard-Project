import HeatMap from './components/HeatMap';
import StudentState from './context/students/studentState';
import ColorsState from './context/colors/colorsState';
import ColorLegend from './components/ColorLegend';
import Header from './components/Header';
import OptionsBar from './components/OptionsBar';
import BarChart from './components/BarChart'
import RadarChart from './components/RadarChart'

function App() {
  return (
    <ColorsState>
      <StudentState>
        <Header />
        <div className="col-container">
          <BarChart />
          <RadarChart />
        </div>
        <OptionsBar />  
        <ColorLegend />
        <HeatMap />
        <>&nbsp;</>
        </StudentState>
      </ColorsState>
  );
}

export default App;
