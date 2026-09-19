/// App constants for hardcoded strings and values
class AppConstants {
  // ===== Welcome & Main Menu Messages =====
  static const String welcomeMessage = '=== Welcome to the MarkMedia Shop ===';
  static const String mainMenuTitle = '--- MAIN MENU ---';
  static const String menuOption1 = '1. View Product Catalog';
  static const String menuOption2 = '2. Add Item to Cart';
  static const String menuOption3 = '3. View Current Cart';
  static const String menuOption4 = '4. Checkout & Exit';
  static const String menuOption5 = '5. Cancel & Exit';
  static const String menuPrompt = 'Please select an option (1-5): ';

  // ===== Catalog Messages =====
  static const String catalogTitle = '--- Available Products ---';
  static const String catalogSeparator = '---------------------------';

  // ===== Cart Messages =====
  static const String cartTitle = '--- Your Cart ---';
  static const String emptyCartMessage = '(Your cart is currently empty)';
  static const String cartSeparator = '-----------------';
  static const String enterProductIdPrompt = 'Enter the Product ID you want to add: ';

  // ===== Success & Error Messages =====
  static const String addToCartSuccess = '--> [Success] Added {0} to your cart.';
  static const String invalidProductIdError = '--> [Error] Invalid Product ID. Please try again.';
  static const String invalidMenuChoiceError = '--> [Error] Invalid choice. Please enter a number between 1 and 5.';
  static const String sessionCancelledMessage = '\nSession cancelled. Goodbye!';

  // ===== Checkout Messages =====
  static const String checkoutTitle = '--- Final Checkout ---';
  static const String emptyCheckoutMessage = 'Your cart is empty. Nothing to charge.';
  static const String subtotalLabel = 'Subtotal: \$';
  static const String discountLabel = 'Discount ({0}%): -\$';
  static const String finalTotalLabel = 'Final Total: \$';
  static const String thankYouMessage = 'Thank you for your purchase!';

  // ===== Cart & Inventory Metrics =====
  static const String totalItemsLabel = 'Total items: ';

  // ===== Product Messages =====
  static const String productFormat = '#';

  // ===== Default Products Catalog =====
  static const int defaultLaptopId = 1;
  static const String defaultLaptopName = 'Laptop';
  static const double defaultLaptopPrice = 999.99;

  static const int defaultSmartphoneId = 2;
  static const String defaultSmartphoneName = 'Smartphone';
  static const double defaultSmartphonePrice = 499.50;

  static const int defaultHeadphonesId = 3;
  static const String defaultHeadphonesName = 'Headphones';
  static const double defaultHeadphonesPrice = 89.90;

  static const int defaultMouseId = 4;
  static const String defaultMouseName = 'Mouse';
  static const double defaultMousePrice = 25.00;

  // ===== Discount Tiers =====
  static const int discountTier2ItemsThreshold = 2;
  static const double discountTier2Rate = 0.10;

  static const int discountTier4ItemsThreshold = 4;
  static const double discountTier4Rate = 0.20;

  static const double noDiscountRate = 0.0;

  // ===== Decimal Precision =====
  static const int priceDecimalPlaces = 2;
}
