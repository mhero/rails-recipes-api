import "./App.css";
import React, { useState } from "react";
import Card from "./Card";
const axios = require("axios").default;

function App() {
  const [recipes, setRecipes] = useState(null);
  const [error, setError] = useState(null);
  const [ingredients, setIngredients] = useState([]);
  const [page, setPage] = useState(1);

  const clear = () => {
    setRecipes(null);
    setError(null);
  };

  const MINIMUM_INGREDIENTS_WORD = 4;
  const MAXIMUM_INGREDIENTS_PER_RECIPE = 5;

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
    if (input.length < MINIMUM_INGREDIENTS_WORD) {
      return;
    }

    axios
      .get(
        `${process.env.REACT_APP_API_URL}/searches?keyword=${input}&page=${page}`
      )
      .then((response) => {
        clear();
        if (response.data.data.length === 0) {
          nothingFound();
        } else {
          setRecipes(response.data.data);
          setIngredients(
            response.data.included.filter((el) => (el.type = "ingredient"))
          );
        }
      })
      .catch((error) => {
        updateError(error);
      });
  };

  const handleChange = (event) => {
    getRecipes(event.target.value);
  };

  const getIngredients = (recipe) => {
    const currentRecipeIngredients = recipe.relationships.ingredients.data.map(
      (el) => el.id
    );
    const currentIngredients = ingredients.filter((el) =>
      currentRecipeIngredients.includes(el.id)
    );
    return currentIngredients.slice(0, MAXIMUM_INGREDIENTS_PER_RECIPE);
  };

  return (
    <div className="container">
      <div className="search-container">
        <label>
          Search for recipe
          <input
            type="text"
            onChange={handleChange}
            placeholder="Search a recipe e.g: chocolate"
          />
        </label>
      </div>
      <div className="recipes-container">
        {recipes &&
          recipes.map((item) => {
            return (
              <Card
                key={item.id}
                item={item}
                ingredients={getIngredients(item)}
              />
            );
          })}
      </div>
      <div>{error && error.message}</div>
    </div>
  );
}

export default App;
