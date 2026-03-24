export async function getProducts() {
  const res = await fetch("http://localhost/api/products_all.php");
  const data = await res.json();

  return data.map(p => ({
    ...p,
    price: Number(p.price),
    category_id: Number(p.category_id)
  }));
}

export async function getProduct(id) {
  const res = await fetch("http://localhost/api/products_all.php");
  const data = await res.json();

  const product = data.find(p => Number(p.id) === Number(id));

  return {
    ...product,
    price: Number(product.price),
    gender: product.name.toLowerCase().includes("damskie") ? "f" : "m"
  };
}