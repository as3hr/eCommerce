import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/models/order.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/payment/payment_screen.dart';
import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../models/product.dart';
import 'checkout/order_placed.dart';

class CartController extends GetxController {
  Order order = Order();
  List<Product> checkoutProducts = [];

  //address
  List<Address> userAddresses = [];
  int selectedAddressIndex = 0;
  late bool selectedAddress;

  //payment
  late bool selectedPayment;
  int selectedPaymentIndex = 0;
  List<String> paymentMethods = ['Cash On Delivery (COD)', 'Pay Right Now'];
  String currentPayment = 'Cash On Delivery (COD)';

  bool addProduct(Product product) {
    if (!checkoutProducts.contains(product)) {
      checkoutProducts.add(product);
      calculateCost();
      return true;
    }
    return false;
  }

  void removeProduct(Product product) {
    checkoutProducts.remove(product);
    calculateCost();
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
  }

  void increaseQuantity(Product product) {
    product.quantity = product.quantity + 1;
    calculateCost();
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

  Future<void> createOrder({bool paymentDone = false}) async {
    order.products = checkoutProducts;
    if (paymentDone || currentPayment != paymentMethods.last) {
      await Api.createOrder(order: order);
      changePage(OrderPlaced.routeName);
      removeAllProducts();
      await Get.find<OrderScreenController>().getOrders(refresh: true);
    } else if (currentPayment == paymentMethods.last) {
      changePage(PaymentScreen.routeName, arguments: {
        'amount': order.total,
        'currency': 'usd',
      });
    }
  }
}
