import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';

class OrderController {
  Future<dynamic> addProductToCart(Product product, int quantity) async {
    await Order.addProductToCart(product, quantity);
  }

  Future<dynamic> createNewOrder(double totalPrice) async {
    await Order.createNewOrder(totalPrice);
  }

  Future<dynamic> submitOrder() async {
    await Order.submitOrder();
  }
}
