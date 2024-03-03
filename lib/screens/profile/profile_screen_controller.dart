import 'package:e_commerce/data/api.dart';
import 'package:get/get.dart';

import '../../models/wishlist.dart';

class ProfileScreenController extends GetxController {
  List<Wish> wishLists = [];

  @override
  void onInit() {
    super.onInit();
    getWishList();
  }

  Future<void> getWishList() async {
    wishLists = await Api.getWishes();
    update();
  }
}
