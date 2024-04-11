import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/functions/change_page.dart';
import '../../models/address.dart';
import '../../models/wishlist.dart';
import '../auth/auth_controller.dart';
import 'components/profile_sub_screens/address/address_screen.dart';

class ProfileScreenController extends GetxController {
  static final authController = Get.find<AuthController>();
  final picker = ImagePicker();

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
    getAddresses(refresh: true);
    update();
  }

  Future showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImageFromGallery();
              });
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImageFromCamera();
              });
            },
          ),
        ],
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await uploadImage(pickedFile.path);
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      await uploadImage(pickedFile.path);
    }
  }

  Future<void> uploadImage(String path) async {
    try {
      final authController = Get.find<AuthController>();
      await authController.uploadImage(path);
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
