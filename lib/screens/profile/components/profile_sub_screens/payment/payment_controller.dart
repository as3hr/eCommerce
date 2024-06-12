import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/models/payment.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address/add_address_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:e_commerce/models/card.dart' as card;

class PaymentController extends GetxController {
  var newCard = card.Card();
  @override
  void onInit() {
    super.onInit();
    getCards();
  }

  List<card.Card> cards = [];
  double amount = 0;
  String currency = '';
  bool isLoading = true;
  String clientSecret = '';

  Future<void> createPayment() async {
    final addresses = Get.find<ProfileScreenController>().addresses;
    if (addresses.isEmpty == true) {
      showToast(
        message: 'No Address found\nClick here to add Address!',
        imagePath: AppImages.access,
        onTap: (_) {
          changePage(AddAddressScreen.routeName,
              arguments: {'address': Address()});
        },
        duration: const Duration(seconds: 3),
      );
    } else {
      clientSecret = await Api.createPayment(
          payment: Payment(
        address: addresses.first,
        amount: amount,
        currency: currency,
      ));
    }
  }

  Future<void> addCard() async {
    await Api.addCard(newCard);
    await getCards();
  }

  Future<void> getCards() async {
    cards = await Api.getCards();
    isLoading = false;
    update();
  }

  void checkPaymentValidity() {
    if (cards.isNotEmpty && amount != 0 && currency.isNotEmpty) {
      update();
    }
  }
}
