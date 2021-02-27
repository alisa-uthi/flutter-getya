import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';

class OrderController {
  addProductToCart(Product product, int quantity) {
    Order.addProductToCart(product, quantity);
  }

  createNewOrder(double totalPrice) {
    Order.createNewOrder(totalPrice);
  }

  submitOrder() {
    Order.submitOrder();
  }

  addDestination(String destination) {
    Order.addDestination(destination);
  }
}
