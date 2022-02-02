import React, { useState } from "react";

const Card = ({ item, ingredients }) => {
  debugger;
  return (
    <li>
      <div>{item.attributes.name}</div>
      {ingredients &&
        ingredients.map((ingredient) => {
          return <div>{ingredient.attributes.description}</div>;
        })}
    </li>
  );
};

export default Card;
