import 'package:ecommerce_admin_panel/models/data/api.dart';
import 'package:get/get.dart';

import '../../models/pagination.dart';
import '../../models/user.dart';

class UserController extends GetxController {
  List<User> allUsers = [];
  User? user;
  Pagination<User> userPagination = Pagination<User>();
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
    extraQuery?['isAdmin'] = false;
    int page = (allUsers.length / limit).ceil() + 1;
    userPagination = await Api.getAllUsers(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allUsers.addAll(userPagination.data);
    update();
    if (userPagination.data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> getUserById() async {
    user = await Api.getUserById(user?.id ?? '');
    update();
  }

  Future<void> deleteUser() async {
    await Api.deleteUser(user?.id ?? '');
    getAllUsers(refresh: true);
    update();
  }
}
