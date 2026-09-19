import 'dart:io'; // Required to capture user keyboard input via stdin
import 'package:shop/src/internal.dart';
import 'package:shop/src/constants.dart';

void main() {
  // 1. Types & Collections
  List<Product> catalog = [
    Product(
      AppConstants.defaultLaptopId,
      AppConstants.defaultLaptopName,
      AppConstants.defaultLaptopPrice,
    ),
    Product(
      AppConstants.defaultSmartphoneId,
      AppConstants.defaultSmartphoneName,
      AppConstants.defaultSmartphonePrice,
    ),
    Product(
      AppConstants.defaultHeadphonesId,
      AppConstants.defaultHeadphonesName,
      AppConstants.defaultHeadphonesPrice,
    ),
    Product(
      AppConstants.defaultMouseId,
      AppConstants.defaultMouseName,
      AppConstants.defaultMousePrice,
    ),
  ];
  List<Product> cart = [];
  bool isRunning = true;

  print(AppConstants.welcomeMessage);

  // 2. Loops: An infinite while loop to keep the menu active until explicitly exited
  while (isRunning) {
    print('\n${AppConstants.mainMenuTitle}');
    print(AppConstants.menuOption1);
    print(AppConstants.menuOption2);
    print(AppConstants.menuOption3);
    print(AppConstants.menuOption4);
    print(AppConstants.menuOption5);
    stdout.write(AppConstants.menuPrompt);

    // Read the user's choice from the console
    String? input = stdin.readLineSync();

    // 3. Conditionals: Switch statement handles menu navigation based on user choice
    switch (input) {
      case '1':
        viewCatalog(catalog);
        break;

      case '2':
        addItemToCart(catalog, cart);
        break;

      case '3':
        viewCart(cart);
        break;

      case '4':
        isRunning = !checkout(cart);
        break;

      case '5':
        print(AppConstants.sessionCancelledMessage);
        isRunning = false; // Breaks the while loop
        break;

      default:
        // Handles any unexpected menu choices
        print(AppConstants.invalidMenuChoiceError);
    }
  }
}

// Menu option methods
void viewCatalog(List<Product> catalog) {
  print('\n${AppConstants.catalogTitle}');
  // Loops: 'for-in' loop to print products
  for (var product in catalog) {
    print(product);
  }
  print(AppConstants.catalogSeparator);
}

void addItemToCart(List<Product> catalog, List<Product> cart) {
  stdout.write(AppConstants.enterProductIdPrompt);
  String? idInput = stdin.readLineSync();

  // Use the refactored validation function
  int? chosenId = validateProductId(idInput, catalog.length);

  if (chosenId != null) {
    Product? selectedProduct = findProductById(catalog, chosenId);
    if (selectedProduct != null) {
      cart.add(selectedProduct); // Adding item to list
      print(
        AppConstants.addToCartSuccess.replaceFirst('{0}', selectedProduct.name),
      );
    }
  } else {
    print(AppConstants.invalidProductIdError);
  }
}

void viewCart(List<Product> cart) {
  print('\n${AppConstants.cartTitle}');
  // Conditionals: if-else to handle empty vs filled lists
  if (cart.isEmpty) {
    print(AppConstants.emptyCartMessage);
  } else {
    for (var item in cart) {
      print('- ${item.name}: \$${item.price}');
    }
    print('${AppConstants.totalItemsLabel}${cart.length}');
  }
  print(AppConstants.cartSeparator);
}

bool checkout(List<Product> cart) {
  print('\n${AppConstants.checkoutTitle}');
  if (cart.isEmpty) {
    print(AppConstants.emptyCheckoutMessage);
  } else {
    // Use refactored calculation methods
    double subtotal = calculateSubtotal(cart);
    double discountRate = getDiscountRate(cart.length);
    double discountAmount = calculateDiscountAmount(subtotal, discountRate);
    double finalTotal = calculateFinalTotal(subtotal, discountAmount);

    print('${AppConstants.subtotalLabel}$subtotal');
    print(
      '${AppConstants.discountLabel.replaceFirst('{0}', '${discountRate * 100}')}${discountAmount.toStringAsFixed(AppConstants.priceDecimalPlaces)}',
    );
    print(
      '${AppConstants.finalTotalLabel}${finalTotal.toStringAsFixed(AppConstants.priceDecimalPlaces)}',
    );
    print(AppConstants.thankYouMessage);
  }
  return true; // Signals to exit the program
}
