import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:get/get.dart';

import '../../models/address.dart';
import '../../models/wishlist.dart';

class ProfileScreenController extends GetxController {
  List<Wish> wishLists = [];
  List<Address> addresses = [];

  @override
  void onInit() async {
    super.onInit();
    await Future.wait([getWishList(), getAddresses()]);
  }

  Future<void> getWishList({bool refresh = false}) async {
    if (refresh) wishLists.clear();
    wishLists = await Api.getWishes();
    // getInitialWish();
    update();
  }

  void getInitialWish() {
    final products = Get.find<HomeScreenController>()
        .productsList
        .where((product) => product.isFav == true)
        .toList();
    wishLists.insert(
        0,
        Wish(
          products: products,
          title: 'Favourites',
        ));
  }

  Future<void> getAddresses({bool refresh = false}) async {
    if (refresh) addresses.clear();
    addresses = await Api.getAddresses();
    update();
  }

  Future<void> updateAddress(Address address) async {
    await Api.updateAddress(address: address);
    showToast(message: 'Updated Successfully', imagePath: AppImages.successful);
    getAddresses(refresh: true);
    update();
  }

  Future<void> createAddress(Address address) async {
    await Api.createAddress(address: address);
    showToast(message: 'Created Successfully', imagePath: AppImages.successful);
    getAddresses(refresh: true);
    update();
  }
}
