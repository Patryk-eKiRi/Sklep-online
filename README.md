# Sklep-online
Online winter sports shop built with React, PHP and MySQL – includes cart, orders, authentication and admin panel.

Aplikacja typu full-stack przedstawiająca sklep internetowy ze sprzętem zimowym (snowboard, narty, odzież).
Projekt został zbudowany w oparciu o React (frontend) oraz PHP + MySQL (backend API).

Funkcjonalności
 Użytkownik
rejestracja i logowanie
przeglądanie produktów
filtrowanie po kategoriach
dodawanie do koszyka
usuwanie z koszyka
składanie zamówień
 System zamówień
zapis zamówień w bazie danych
historia zamówień (admin)
 Admin
dostęp do panelu admina
podgląd zamówień użytkowników
 Technologie
Frontend: React (Vite)
Backend: PHP (REST API)
Baza danych: MySQL (XAMPP)
Stylowanie: CSS

Instalacja i uruchomienie
1. Backend (XAMPP)

skopiuj folder backend do:

xampp/htdocs/api
uruchom Apache i MySQL
2. Baza danych
otwórz phpMyAdmin
utwórz bazę skidb

zaimportuj plik:

database/skidb.sql
3. Frontend
cd frontend
npm install
npm run dev

Konto testowe

Admin:

email: admin@example.com
hasło: admin
