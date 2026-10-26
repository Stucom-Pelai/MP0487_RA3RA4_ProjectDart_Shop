# Shop Application

A command-line shop application with cart functionality and an advanced discount system. This Dart application demonstrates interactive CLI development, collection management, and test-driven development practices.

## Project Focus

This project provides:
- **Interactive Shopping Experience**: Browse products, add/remove items from cart
- **Discount System**: Apply percentage-based discounts to cart totals
- **Cart Management**: View, update, and calculate totals with applied discounts
- **Command-line Interface**: User-friendly interactive menu for shopping operations

## How to Run the Project Locally

### 1. Get Dependencies
First, fetch all project dependencies:

```bash
dart pub get
```

### 2. Run the Application
Execute the main application with:

```bash
dart run bin/main.dart
```

Or alternatively:

```bash
dart run
```

The application will start an interactive command-line menu where you can:
- View available products in the catalog
- Add products to your shopping cart
- Remove items from your cart
- View cart contents and total price
- Apply discount codes
- Checkout

## How to Launch Tests Locally

### Run All Tests
Execute the complete test suite:

```bash
dart test
```

### Run Tests with Verbose Output
For detailed test execution information:

```bash
dart test -v
```

### Run Specific Test File
To run only a specific test file:

```bash
dart test test/shop_test.dart
```

## Project Structure

```
shop/
├── bin/
│   └── main.dart           # Application entry point
├── lib/
│   └── src/
│       ├── constants.dart  # Application constants
│       ├── internal.dart   # Core business logic and models
├── test/
│   └── shop_test.dart      # Unit tests
├── pubspec.yaml            # Project dependencies and configuration
├── analysis_options.yaml   # Dart analysis rules
└── README.md               # This file
```

## Dependencies

- **lints**: ^6.0.0 - Dart linting rules for code quality
- **test**: ^1.25.6 - Testing framework for Dart

