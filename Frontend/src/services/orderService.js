export async function createOrder(data) {
  const res = await fetch("http://localhost/api/create_order.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(data)
  });

  return res.json();
}