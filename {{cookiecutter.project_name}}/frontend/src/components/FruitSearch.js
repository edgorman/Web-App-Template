import { useState } from 'react';

export default function FruitSearch() {
  const [result, setResult] = useState({});

  const handleSubmit = (event) => {
    event.preventDefault();
    
    fetch('http://127.0.0.1:5000/fruit/' + event.target.name.value)
      .then((response) => response.json())
      .then((data) => { 
        console.log(data);
        setResult(data);
      })
      .catch((err) => { console.log(err.message); });
  }

  return (
    <div id="fruitsearch">
      <b>Search for a fruit by name:</b>
      <form onSubmit={handleSubmit}>
        <input type="text" placeholder="apple" name="name" />
        <input type="submit" />
      </form>
      {
        Object.keys(result).length === 0 ? '' : <p>name={result.name}, amount={result.amount}</p>
      }
    </div>
  );
}
