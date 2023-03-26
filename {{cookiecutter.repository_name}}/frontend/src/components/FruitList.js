import { useState } from 'react';

export default function FruitList() {
  const [list, setList] = useState([]);

  const handleSubmit = (event) => {
    event.preventDefault();
    
    fetch('http://127.0.0.1:{{ cookiecutter.backend_port }}/fruit/')
      .then((response) => response.json())
      .then((data) => { 
        console.log(data);
        setList(data); 
      })
      .catch((err) => { console.log(err.message); });
  }

  return (
    <div id="fruitlist">
      <b>Get all fruit:</b>
      <form onSubmit={handleSubmit}>
        <input type="submit" />
      </form>
      {
        list.map(function(fruit, idx){
          const key = fruit.name;
          return (
            <p key={key}>name={fruit.name}, amount={fruit.amount}</p>
          );
        })
      }
    </div>
  );
}
