ShopLite – Flutter E-Commerce App

ShopLite is a Flutter-based e-commerce application developed as part of a Flutter Development Internship Assignment. It allows users to browse products, search and filter products, view product details, and manage their favourite products.

Features

- Splash screen and login/signup interface
- Product listing with data fetched from REST API
- Product details screen
- Search and category-based filtering
- Add and remove favourite products
- Local persistence of favourite products
- State management using Cubit
- Responsive Flutter UI
- Loading and error states

Technologies Used

- Flutter & Dart – App development
- Flutter Bloc (Cubit) – State management
- Dio – REST API integration
- SharedPreferences – Local data persistence
- DummyJSON API – Product data source

API Used

"DummyJSON Products API" (https://dummyjson.com/products?limit=100)

Project Structure

lib/
├── core/
│   └── constants/
├── models/
├── repositories/
├── cubit/
├── screens/
├── widgets/
├── app.dart
└── main.dart

Getting Started

1. Clone this repository:

git clone YOUR_GITHUB_REPOSITORY_URL

2. Navigate to the project directory:

cd shoplite

3. Install dependencies:

flutter pub get

4. Run the application:

flutter run

Authentication Note

This project currently uses local demo authentication with SharedPreferences. It does not implement production backend authentication.

Developer

Karan Sharma

GitHub: "karansharmaofficial" (https://github.com/karansharmaofficial)

---

Developed using Flutter and Dart.