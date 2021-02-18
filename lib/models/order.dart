import 'package:getya/models/product.dart';
import 'package:getya/models/user.dart';

class Order {
  User user;
  List<Product> products;
  DateTime orderAt;
  bool isPaid;

  Order({
    this.isPaid,
    this.orderAt,
    this.products,
    this.user,
  });

  static void addProductToCart(Product product, int quantity) {
    if (tempProductsInOrder.containsKey(product)) {
      tempProductsInOrder[product] += quantity;
    } else {
      tempProductsInOrder[product] = quantity;
    }
  }
}

// For mock up
// Since there is only 1 user and 1 order, we will use this for now
Map tempProductsInOrder = {};
