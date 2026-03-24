import { useState } from "react";
import { createOrder } from "../services/orderService";

export default function Cart() {
  const [items, setItems] = useState(
    JSON.parse(localStorage.getItem("cart") || "[]")
  );

  const user = JSON.parse(localStorage.getItem("user"));

 
  const removeItem = (id) => {
    const updated = items.filter(item => item.id !== id);

    setItems(updated);
    localStorage.setItem("cart", JSON.stringify(updated));
  };

 
  const handleOrder = async () => {
    if (!user) {
      alert("Zaloguj się!");
      return;
    }

    const res = await createOrder({
      user_id: user.id,
      items: items
    });

    if (res.status === "ok") {
      alert("Zamówienie złożone ✅");

      localStorage.removeItem("cart");
      setItems([]);
    }
  };

  return (
    <div >
      <h2>Koszyk</h2>

      {items.length === 0 && <p>Koszyk pusty</p>}

      {items.map(item => (
        <div className="cart-item" key={item.id}>
          {item.name} - {item.price} zł

          
          <button
            onClick={() => removeItem(item.id)}
            style={{
              marginLeft: "10px",
              padding: "3px 8px",
              cursor: "pointer"
            }}
          >
            ❌ Usuń
          </button>
        </div>
      ))}

      {items.length > 0 && (
        <button
          onClick={handleOrder}
          style={{
            marginTop: "20px",
            padding: "10px 20px",
            cursor: "pointer"
          }}
        >
          Złóż zamówienie
        </button>
      )}
    </div>
  );
}