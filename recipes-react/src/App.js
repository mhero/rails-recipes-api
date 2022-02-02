import "./App.css";
import React, { useState } from "react";
import Card from "./Card";
const axios = require("axios").default;

function App() {
  const [recipes, setRecipes] = useState(null);
  const [error, setError] = useState(null);

  const clear = () => {
    setRecipes(null);
    setError(null);
  };

  const updateError = (error) => {
    clear();
    if (error.response != null && error.response.status === 404) {
      setError({
        status: 404,
        message: "Can not load recipes, please try again in some minutes",
      });
    } else {
      setError({
        status: 500,
        message: "Error in server, please try again in some minutes",
      });
    }
  };

  const nothingFound = () => {
    setError({
      status: 404,
      message: "Can not found recipes, please try again with another query",
    });
  };

  const getRecipes = (input) => {
    clear();
    if (input.length < 4) {
      return;
    }

    axios
      .get(`${process.env.REACT_APP_API_URL}/searches?keyword=${input}`)
      .then((response) => {
        clear();
        if (response.data.length === 0) {
          nothingFound();
        } else {
          setRecipes(response.data.data);
        }
      })
      .catch((error) => {
        updateError(error);
      });
  };

  const handleChange = (event) => {
    getRecipes(event.target.value);
  };

  return (
    <div className="App">
      <label>
        Input a keyword to search for recipe:
        <input type="text" onChange={handleChange} />
      </label>
      <ul>
        {recipes &&
          recipes.map((item) => {
            return <Card key={item.id} item={item} />;
          })}
      </ul>
      <div>{error && error.message}</div>
    </div>
  );
}

export default App;
