import 'package:getya/models/order.dart';
import 'package:getya/models/product.dart';

class OrderController {
  Future<dynamic> addProductToCart(Product product, int quantity) async {
    Order.addProductToCart(product, quantity);
  }
}
