import { Link } from "react-router-dom";

export default function Header() {
  const user = JSON.parse(localStorage.getItem("user"));

  const handleLogout = () => {
  localStorage.removeItem("user");
  window.location.href = "/";
};

  return (
    <header className="header">
      <div className="logo">
        <Link to="/" style={{ color: "white", textDecoration: "none" }}>
          Mabyn
        </Link>
      </div>

      <nav className="nav">
        <Link to="/products">Produkty</Link>
        <Link to="/cart">Koszyk</Link>
        <Link to="/contact">Kontakt</Link>

        {user && user.role === "admin" && (
          <Link to="/admin">Admin</Link>
        )}

        {user ? (
          <>
            <span style={{ color: "white", marginLeft: "15px" }}>
              {user.first_name}
            </span>

            <button
              onClick={handleLogout}
              style={{
                marginLeft: "10px",
                padding: "5px 10px",
                cursor: "pointer"
              }}
            >
              Wyloguj
            </button>
          </>
        ) : (
          <>
            <Link to="/login">Login</Link>
            <Link to="/register">Rejestracja</Link>
          </>
        )}
      </nav>
    </header>
  );
}