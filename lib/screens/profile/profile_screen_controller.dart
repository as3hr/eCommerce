import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/functions/change_page.dart';
import '../../models/address.dart';
import '../../models/wishlist.dart';
import '../auth/auth_controller.dart';
import 'components/profile_sub_screens/address/address_screen.dart';

class ProfileScreenController extends GetxController {
  final addressFormKey = GlobalKey<FormState>();
  bool get addressFormIsValid =>
      addressFormKey.currentState?.validate() == true;
  static final authController = Get.find<AuthController>();
  final picker = ImagePicker();

  List<Wish> wishLists = [];
  List<Address> addresses = [];
  var favourites = Wish();

  @override
  void onInit() async {
    super.onInit();
    await Future.wait([getWishList(), getAddresses()]);
  }

  Future<void> getWishList({bool refresh = false}) async {
    if (refresh) wishLists.clear();
    wishLists = await Api.getWishes();
    getFavouriteWish();
    update();
  }

  void getFavouriteWish() {
    if (wishLists.isNotEmpty) {
      favourites = wishLists.firstWhere((wish) => wish.title == 'Favorites');
    }
  }

  Future<void> toggleFav(Product product) async {
    final hasProduct =
        favourites.products?.any((element) => element.title == product.title) ==
            true;
    loadingWrapper(() async {
      if (hasProduct) {
        favourites.products!
            .removeWhere((element) => element.title == product.title);
        await updateWishList(favourites);
        showToast(
          message: 'Removed from Favourites!',
          imagePath: AppImages.access,
        );
      } else {
        favourites.products?.add(product);
        await updateWishList(favourites);
        showToast(
          message: 'Added to Favourites!',
          imagePath: AppImages.successful,
        );
      }
    });
  }

  Future<void> updateWishList(Wish wish) async {
    await Api.updateWish(wish: wish);
    getWishList(refresh: true);
    update();
  }

  Future<List<Address>> getAddresses({bool refresh = false}) async {
    if (refresh) addresses.clear();
    addresses = await Api.getAddresses();
    update();
    return addresses;
  }

  Future<void> updateAddress(Address address) async {
    await Api.updateAddress(address: address);
    showToast(message: 'Updated Successfully', imagePath: AppImages.successful);
    getAddresses(refresh: true);
    update();
  }

  Future<void> deleteAddress(Address address) async {
    await Api.deleteAddress(address: address);
    showToast(message: 'Deleted Successfully', imagePath: AppImages.successful);
    await getAddresses(refresh: true);
    update();
    changePage(AddressScreen.routeName);
  }

  Future<void> createAddress(Address address) async {
    await Api.createAddress(address: address);
    showToast(message: 'Created Successfully', imagePath: AppImages.successful);
    await getAddresses(refresh: true);
    update();
  }

  Future showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Photo Gallery',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImage(ImageSource.gallery);
              });
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Camera',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImage(ImageSource.camera);
              });
            },
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final file = await picker.pickImage(source: source);
    if (file != null) {
      await uploadImage(
        file.path,
        file.name,
      );
    }
  }

  Future<void> uploadImage(String path, String name) async {
    try {
      final authController = Get.find<AuthController>();
      await authController.uploadImage(path, name);
      await authController.fetchProfile();
      showToast(message: 'Image Uploaded!');
    } catch (_) {
      showToast(
          message: 'Could not upload the image!',
          imagePath: AppImages.unsuccessful);
    }
    authController.update();
    update();
  }
}
