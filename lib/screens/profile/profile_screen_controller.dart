import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
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
    update();
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
