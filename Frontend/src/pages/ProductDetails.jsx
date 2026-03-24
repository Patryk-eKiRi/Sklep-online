import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getProduct } from "../services/productService";

export default function ProductDetails() {
  const { id } = useParams();
  const [product, setProduct] = useState(null);

  useEffect(() => {
    getProduct(id)
      .then(data => setProduct(data))
      .catch(err => console.error(err));
  }, [id]);

  const addToCart = (product) => {
    const cart = JSON.parse(localStorage.getItem("cart") || "[]");
    cart.push(product);
    localStorage.setItem("cart", JSON.stringify(cart));

    window.dispatchEvent(new Event("storage"));

    alert("Dodano do koszyka 🛒");
  };

  if (!product) return <p>Ładowanie...</p>;

  return (
    <div>
      <h2>{product.name}</h2>
      <p>{product.description}</p>
      <strong>{product.price} zł</strong>

      <br /><br />

      <button onClick={() => addToCart(product)}>
        Dodaj do koszyka
      </button>
    </div>
  );
}