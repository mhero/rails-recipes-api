import React, { useState } from "react";

const Card = ({ item }) => {
  return (
    <li>
      <div>{item.name}</div>
    </li>
  );
};

export default Card;
