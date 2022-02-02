import React, { useState } from "react";

const Card = ({ item }) => {
  return (
    <li>
      <div>{item.attributes.name}</div>
    </li>
  );
};

export default Card;
