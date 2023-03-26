import './App.css';
import FruitCreate from './FruitCreate';
import FruitList from './FruitList';
import FruitSearch from './FruitSearch';
import FruitUpdate from './FruitUpdate';
import FruitDelete from './FruitDelete';


export default function App() {
  return (
    <div id="app">
      <h1>Fruit App</h1>
      <FruitCreate></FruitCreate>
      <br/>
      <FruitList></FruitList>
      <br/>
      <FruitSearch></FruitSearch>
      <br/>
      <FruitUpdate></FruitUpdate>
      <br/>
      <FruitDelete></FruitDelete>
    </div>
  );
}
