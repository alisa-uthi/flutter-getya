import 'package:getya/models/product.dart';
import 'package:getya/models/user.dart';

class Order {
  User user;
  Map products;
  DateTime orderAt;
  bool isPaid;
  double totalPrice;

  Order({
    this.isPaid,
    this.orderAt,
    this.products,
    this.user,
    this.totalPrice,
  });

  static void addProductToCart(Product product, int quantity) {
    if (tempProductsInOrder.containsKey(product)) {
      tempProductsInOrder[product] += quantity;
    } else {
      tempProductsInOrder[product] = quantity;
    }
  }

  static void createNewOrder(double totalPrice) {
    currentOrder = Order(
      user: currentUser,
      products: tempProductsInOrder,
      orderAt: DateTime.now(),
      isPaid: false,
      totalPrice: totalPrice,
    );
  }

  static void submitOrder() {
    print("submit order and store in database");
  }
}

// For mock up
// Since there is only 1 user and 1 order, we will use this for now
Map tempProductsInOrder = {};

Order currentOrder;
