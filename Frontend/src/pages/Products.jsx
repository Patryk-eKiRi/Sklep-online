import { useEffect, useState } from "react";
import { getProducts } from "../services/productService";
import { Link } from "react-router-dom";

export default function Products() {
  const [products, setProducts] = useState([]);
  const [filteredProducts, setFilteredProducts] = useState([]);

  const [searchText, setSearchText] = useState("");
  const [sortOrder, setSortOrder] = useState("asc");
  const [genderFilter, setGenderFilter] = useState("all");
  const [categoryFilter, setCategoryFilter] = useState("all");

  useEffect(() => {
    getProducts().then(data => {
      setProducts(data);
      setFilteredProducts(data);
    });
  }, []);

  useEffect(() => {
    let result = products
      .filter(p =>
        p.name.toLowerCase().includes(searchText.toLowerCase())
      )
      .filter(p => {
        if (genderFilter === "all") return true;
        return p.name.toLowerCase().includes(genderFilter === "m" ? "męskie" : "damskie");
      })
      .filter(p => {
        if (categoryFilter === "all") return true;

        const snowboard = [74,75,76,87,88,89];
        const narty = [77,78,79,90,91,92];
        const odziez = [70,71,72,73,83,84,85,86];
        const akcesoria = [80,81,82,93,94,95];

        if (categoryFilter === "snowboard") {
          return snowboard.includes(p.category_id);
        }

        if (categoryFilter === "narty") {
          return narty.includes(p.category_id);
        }

        if (categoryFilter === "odziez") {
          return odziez.includes(p.category_id);
        }

        if (categoryFilter === "akcesoria") {
          return akcesoria.includes(p.category_id);
        }

        return true;
      });

    result.sort((a, b) =>
      sortOrder === "asc" ? a.price - b.price : b.price - a.price
    );

    setFilteredProducts(result);
  }, [products, searchText, sortOrder, genderFilter, categoryFilter]);

  return (
    <div>
      <h2>Produkty</h2>

      <div className="filters">
        <input
          type="text"
          placeholder="Szukaj..."
          value={searchText}
          onChange={e => setSearchText(e.target.value)}
        />

        <select onChange={e => setGenderFilter(e.target.value)}>
          <option value="all">Wszystkie</option>
          <option value="m">Męskie</option>
          <option value="f">Damskie</option>
        </select>

        <select onChange={e => setCategoryFilter(e.target.value)}>
          <option value="all">Kategorie</option>
          <option value="snowboard">Snowboard</option>
          <option value="narty">Narty</option>
          <option value="odziez">Odzież</option>
          <option value="akcesoria">Akcesoria</option>
        </select>

        <select onChange={e => setSortOrder(e.target.value)}>
          <option value="asc">Cena rosnąco</option>
          <option value="desc">Cena malejąco</option>
        </select>
      </div>

      <div className="products">
        {filteredProducts.map(p => (
          <div className="product" key={p.id}>
            <h3>{p.name}</h3>

            <img
              className="product-image"
              src={`http://localhost/images/${p.image_url}`}
              alt={p.name}
            />

            <strong>{p.price} zł</strong>

            <Link to={`/products/${p.id}`}>Szczegóły</Link>
          </div>
        ))}
      </div>
    </div>
  );
}