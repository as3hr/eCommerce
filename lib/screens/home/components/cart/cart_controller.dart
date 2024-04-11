import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/models/order.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/order_placed.dart';
import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../models/product.dart';

class CartController extends GetxController {
  bool showPageView = false;
  Order order = Order();
  List<Product> checkoutProducts = [];

  bool addProduct(Product product) {
    if (!checkoutProducts.contains(product)) {
      checkoutProducts.add(product);
      calculateCost();
      update();
      return true;
    }
    return false;
  }

  void removeProduct(Product product) {
    checkoutProducts.remove(product);
    calculateCost();
    update();
  }

  void calculateCost() {
    order.subTotal = getSubTotal();
    order.shippingCost = ((3 / 100) * order.subTotal);
    order.tax = ((5 / 100) * order.subTotal);
    order.total = order.tax + order.shippingCost + order.subTotal;
    update();
  }

  double getSubTotal() {
    double sum = 0.0;
    for (var item in checkoutProducts) {
      final price = item.price * item.quantity;
      sum = sum + price;
    }
    return sum;
  }

  void removeAllProducts() {
    checkoutProducts = [];
    order = Order();
    calculateCost();
    update();
  }

  void increaseQuantity(Product product) {
    product.quantity = product.quantity + 1;
    calculateCost();
    update();
  }

  void decreaseQuantity(Product product) {
    product.quantity = product.quantity - 1;
    if (product.quantity < 1) {
      checkoutProducts.remove(product);
    } else {
      calculateCost();
    }
    update();
  }

  Future<void> createOrder() async {
    order.products = checkoutProducts;
    await Api.createOrder(order: order);
    changePage(OrderPlaced.routeName);
    removeAllProducts();
    await Get.find<OrderScreenController>().getOrders(refresh: true);
  }
}
