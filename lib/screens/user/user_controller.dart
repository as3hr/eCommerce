import 'package:ecommerce_admin_panel/models/data/api.dart';
import 'package:get/get.dart';

import '../../models/user.dart';

class UserController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllUsers();
  }

  List<User> allUsers = [];
  User? user;
  int limit = 25;
  User get getCurrentUser => user ?? User();

  set setUser(User newUser) {
    user = newUser;
  }

  Future<bool> getAllUsers({
    bool refresh = false,
    Map<String, dynamic>? extraQuery,
  }) async {
    if (refresh) {
      allUsers.clear();
    }
    int page = (allUsers.length / limit).ceil() + 1;
    final data = await Api.getAllUsers(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allUsers.addAll(data);
    update();
    if (data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> getUserById(String id) async {
    user = await Api.getUserById(id);
    update();
  }

  Future<void> deleteUser() async {
    await Api.deleteUser(user?.id ?? '');
    getAllUsers(refresh: true);
    update();
  }
}
