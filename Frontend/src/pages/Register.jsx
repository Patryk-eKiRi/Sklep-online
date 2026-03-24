import { useState } from "react";
import { register } from "../services/authService";

export default function Register() {
  const [form, setForm] = useState({
    first_name: "",
    last_name: "",
    email: "",
    password: ""
  });

  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    const res = await register(form);

    if (res.status === "ok") {
      setMessage("Zarejestrowano pomyślnie ✅");

      
      setForm({
        first_name: "",
        last_name: "",
        email: "",
        password: ""
      });
    } else {
      setMessage("Błąd ❌");
    }
  };

  return (
    <div className="form">
      <h2>Rejestracja</h2>

      {message && <p>{message}</p>}

      <form onSubmit={handleSubmit}>
        <input
          placeholder="Imię"
          value={form.first_name}
          onChange={e => setForm({...form, first_name: e.target.value})}
        /><br />

        <input
          placeholder="Nazwisko"
          value={form.last_name}
          onChange={e => setForm({...form, last_name: e.target.value})}
        /><br />

        <input
          placeholder="Email"
          value={form.email}
          onChange={e => setForm({...form, email: e.target.value})}
        /><br />

        <input
          type="password"
          placeholder="Hasło"
          value={form.password}
          onChange={e => setForm({...form, password: e.target.value})}
        /><br /><br />

        <button>Zarejestruj</button>
      </form>
    </div>
  );
}