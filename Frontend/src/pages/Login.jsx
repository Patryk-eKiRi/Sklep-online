import { useState } from "react";
import { login } from "../services/authService";

export default function Login() {
  const [form, setForm] = useState({
    email: "",
    password: ""
  });

  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    const res = await login(form);

    if (res.status === "ok") {
      localStorage.setItem("user", JSON.stringify(res.user));
      setMessage("Zalogowano ✅");

      
      window.location.reload();
    } else {
      setMessage("Błędne dane ❌");
    }
  };

  return (
    <div className="form">
      <h2>Logowanie</h2>

      {message && <p>{message}</p>}

      <form onSubmit={handleSubmit}>
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

        <button>Zaloguj</button>
      </form>
    </div>
  );
}