import React from "react";
import "./Card.css";

const RECIPE_PLACEHOLDER = "https://i.imgur.com/AdAeMRi.jpeg";

const Card = ({ item, ingredients }) => {
  return (
    <div className="card">
      <div className="card-image">
        <img src={item.image_url || RECIPE_PLACEHOLDER} alt="Smartphone" />
      </div>
      <h2 className="card-title">{item.attributes.name}</h2>
      <div className="card-ingredients">
        <ul className="ingredients">
          {ingredients &&
            ingredients.map((ingredient) => {
              return <li>{ingredient.attributes.description}</li>;
            })}
        </ul>
      </div>
      <div className="card-cta">
        <a>Read more</a>
      </div>
    </div>
  );
};

export default Card;
