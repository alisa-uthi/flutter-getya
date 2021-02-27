import 'package:getya/models/product.dart';
import 'package:getya/models/user.dart';

class Order {
  User user;
  Map products;
  DateTime orderAt;
  bool isPaid;
  double totalPrice;
  String destination;

  Order({
    this.isPaid,
    this.orderAt,
    this.products,
    this.user,
    this.totalPrice,
    this.destination,
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
    tempProductsInOrder.clear();
    currentOrder = Order();
    print("submit order and store in database");
  }

  static void addDestination(String destination) {
    currentOrder.destination = destination;
  }
}

// For mock up
// Since there is only 1 user and 1 order, we will use this for now
Map tempProductsInOrder = {};

Order currentOrder;
