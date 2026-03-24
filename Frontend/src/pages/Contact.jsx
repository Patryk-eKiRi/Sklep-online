import doradca from "../assets/doradca.jpg";
import tlo from "../assets/tlo.jpg";
export default function Contact() {
  return (
    <div
  className="kontakt-page"
  style={{
    backgroundImage: `url(${tlo})`,
    backgroundSize: "cover",
    backgroundPosition: "center"
  }}
>
      <section className="advisor">
        <h2>Doradca sprzętowy</h2>
        <div className="advisor-profile">
          <img src={doradca} alt="Doradca" className="advisor-photo" />
          <div className="advisor-info">
            <p><strong>Imie Nazwisko</strong></p>
            <p>Tel: +48 987 654 321</p>
            <p>Specjalista od nart i snowboardu</p>
            <p>Fan gór i zimy ❄️</p>
          </div>
        </div>
      </section>

      <section className="contact-info">
        <h2>Kontakt ze sklepem</h2>
        <p>Tel: +48 123 456 789</p>
        <p>Email: MabynPopyn@gmail.com</p>
        <p>Adres: Legionowo, ul. Skarpetki 12</p>

        <h2>Kontakt z właścicielem</h2>
        <p>Email: MabynPopynAdmin@gmail.com</p>
      </section>
    </div>
  );
}