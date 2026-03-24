import { useEffect, useState } from "react";

export default function Admin() {
  const user = JSON.parse(localStorage.getItem("user"));
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    fetch("http://localhost/api/orders.php")
      .then(res => res.json())
      .then(data => setOrders(data));
  }, []);

  if (!user || user.role !== "admin") {
    return <h2 style={{ color: "white" }}>Brak dostępu ❌</h2>;
  }

  return (
    <div style={{ color: "white", padding: "40px" }}>
      <h2>Historia zamówień</h2>

      {orders.map((o, index) => (
        <div key={index} style={{ marginBottom: "10px" }}>
          <strong>Zamówienie #{o.order_id}</strong><br />
          Email: {o.email}<br />
          Produkt: {o.name}<br />
          Cena: {o.price} zł
        </div>
      ))}
    </div>
  );
}