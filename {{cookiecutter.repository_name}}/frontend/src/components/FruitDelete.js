
export default function FruitDelete() {
  const handleSubmit = (event) => {
    event.preventDefault();
    
    fetch(
      'http://127.0.0.1:{{ cookiecutter.backend_port }}/fruit/delete', 
      {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: '"' + event.target.name.value + '"'
      }
    )
      .then((response) => response.json())
      .then((data) => { console.log(data); })
      .catch((err) => { console.log(err.message); });
  }

  return (
    <div id="fruitdelete">
      <b>Delete an existing fruit:</b>
      <form onSubmit={handleSubmit}>
        <input type="text" placeholder="apple" name="name" />
        <input type="submit" />
      </form>
    </div>
  );
}
