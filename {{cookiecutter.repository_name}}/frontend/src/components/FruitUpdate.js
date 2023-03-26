
export default function FruitUpdate() {
  const handleSubmit = (event) => {
    event.preventDefault();
    const fruit = {
      name: event.target.name.value,
      amount: parseInt(event.target.amount.value)
    }

    fetch(
      'http://127.0.0.1:{{ cookiecutter.backend_port }}/fruit/update', 
      {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(fruit)
      }
    )
      .then((response) => response.json())
      .then((data) => { console.log(data); })
      .catch((err) => { console.log(err.message); });
  }

  return (
    <div id="fruitupdate">
      <b>Update an existing fruit:</b>
      <form onSubmit={handleSubmit}>
        <input type="text" placeholder="apple" name="name" />
        <input type="number" defaultValue="1" name="amount" />
        <input type="submit" />
      </form>
    </div>
  );
}
