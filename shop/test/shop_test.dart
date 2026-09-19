import 'package:shop/src/internal.dart';
import 'package:shop/src/constants.dart';
import 'package:test/test.dart';

void main() {
  group('Core Functions Tests', () {
    test('Product should be created with correct properties', () {
      final product = Product(AppConstants.defaultLaptopId, AppConstants.defaultLaptopName, AppConstants.defaultLaptopPrice);
      expect(product.id, AppConstants.defaultLaptopId);
      expect(product.name, AppConstants.defaultLaptopName);
      expect(product.price, AppConstants.defaultLaptopPrice);
    });

    test('calculateSubtotal should sum all cart items', () {
      final cart = [
        Product(AppConstants.defaultLaptopId, AppConstants.defaultLaptopName, AppConstants.defaultLaptopPrice),
        Product(AppConstants.defaultSmartphoneId, AppConstants.defaultSmartphoneName, AppConstants.defaultSmartphonePrice),
        Product(AppConstants.defaultHeadphonesId, AppConstants.defaultHeadphonesName, AppConstants.defaultHeadphonesPrice),
      ];
      final expected = AppConstants.defaultLaptopPrice + AppConstants.defaultSmartphonePrice + AppConstants.defaultHeadphonesPrice;
      expect(calculateSubtotal(cart), closeTo(expected, 0.01));
    });

    test('getDiscountRate should return correct rates', () {
      expect(getDiscountRate(0), AppConstants.noDiscountRate);
      expect(getDiscountRate(2), AppConstants.discountTier2Rate);
      expect(getDiscountRate(4), AppConstants.discountTier4Rate);
      expect(getDiscountRate(10), AppConstants.discountTier4Rate);
    });

    test('calculateDiscountAmount should compute discount correctly', () {
      expect(calculateDiscountAmount(100.0, 0.0), 0.0);
      expect(calculateDiscountAmount(100.0, 0.10), closeTo(10.0, 0.01));
      expect(calculateDiscountAmount(100.0, 0.20), closeTo(20.0, 0.01));
    });

    test('calculateFinalTotal should subtract discount from subtotal', () {
      expect(calculateFinalTotal(100.0, 0.0), 100.0);
      expect(calculateFinalTotal(100.0, 10.0), 90.0);
      expect(calculateFinalTotal(999.99, 99.99), closeTo(900.0, 0.01));
    });

    test('findProductById should locate products correctly', () {
      final catalog = [
        Product(AppConstants.defaultLaptopId, AppConstants.defaultLaptopName, AppConstants.defaultLaptopPrice),
        Product(AppConstants.defaultSmartphoneId, AppConstants.defaultSmartphoneName, AppConstants.defaultSmartphonePrice),
        Product(AppConstants.defaultHeadphonesId, AppConstants.defaultHeadphonesName, AppConstants.defaultHeadphonesPrice),
      ];
      expect(findProductById(catalog, AppConstants.defaultLaptopId)?.name, AppConstants.defaultLaptopName);
      expect(findProductById(catalog, AppConstants.defaultHeadphonesId)?.name, AppConstants.defaultHeadphonesName);
      expect(findProductById(catalog, 5), isNull);
      expect(findProductById(catalog, 0), isNull);
    });

    test('validateProductId should accept valid IDs and reject invalid ones', () {
      expect(validateProductId('1', 4), 1);
      expect(validateProductId('4', 4), 4);
      expect(validateProductId('0', 4), isNull);
      expect(validateProductId('5', 4), isNull);
      expect(validateProductId('abc', 4), isNull);
      expect(validateProductId(null, 4), isNull);
    });
  });

  group('Integration Tests', () {
    test('should calculate 2-item purchase correctly', () {
      final cart = [
        Product(AppConstants.defaultLaptopId, AppConstants.defaultLaptopName, AppConstants.defaultLaptopPrice),
        Product(AppConstants.defaultSmartphoneId, AppConstants.defaultSmartphoneName, AppConstants.defaultSmartphonePrice),
      ];
      final subtotal = calculateSubtotal(cart);
      final discountRate = getDiscountRate(cart.length);
      final discountAmount = calculateDiscountAmount(subtotal, discountRate);
      final finalTotal = calculateFinalTotal(subtotal, discountAmount);

      expect(subtotal, closeTo(1499.49, 0.01));
      expect(discountRate, AppConstants.discountTier2Rate);
      expect(finalTotal, closeTo(1349.54, 0.01));
    });

    test('should calculate 4-item purchase with 20% discount', () {
      final catalog = [
        Product(AppConstants.defaultLaptopId, AppConstants.defaultLaptopName, AppConstants.defaultLaptopPrice),
        Product(AppConstants.defaultSmartphoneId, AppConstants.defaultSmartphoneName, AppConstants.defaultSmartphonePrice),
        Product(AppConstants.defaultHeadphonesId, AppConstants.defaultHeadphonesName, AppConstants.defaultHeadphonesPrice),
        Product(AppConstants.defaultMouseId, AppConstants.defaultMouseName, AppConstants.defaultMousePrice),
      ];
      final subtotal = calculateSubtotal(catalog);
      final discountRate = getDiscountRate(catalog.length);
      final discountAmount = calculateDiscountAmount(subtotal, discountRate);
      final finalTotal = calculateFinalTotal(subtotal, discountAmount);

      expect(subtotal, closeTo(1614.39, 0.01));
      expect(discountRate, AppConstants.discountTier4Rate);
      expect(finalTotal, closeTo(1291.51, 0.01));
    });
  });
}
