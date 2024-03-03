import 'package:dio/dio.dart';
import 'package:e_commerce/data/api_helpers.dart';
import 'package:e_commerce/models/notification.dart';
import 'package:e_commerce/models/order.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/models/wishlist.dart';

class Api {
  static final dio = Dio(BaseOptions(
      baseUrl: "http://192.168.100.46:6000",
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      contentType: 'application/json'));

  //Auth API's
  static Future<User> login({
    required String email,
    required String password,
  }) async {
    const url = '/auth/login';
    final response = await dio.post(url, data: {
      'email': email,
      'password': password,
    });
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<void> logout() async {
    const url = '/auth/signOut';
    final response = await dio.post(url);
    ApiHelpers.checkError(response);
  }

  static Future<User> signUp({required User user}) async {
    const url = '/auth/signUp';
    final response = await dio.post(url, data: user.userSignUp());
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<void> updateUser({required User user}) async {
    final url = '/users/${user.id}';
    final response = await dio.put(url, data: user.toJson());
    ApiHelpers.checkError(response);
  }

  //User API's
  static Future<User> getUser() async {
    const url = '/users/profile';
    final response = await dio.get(url);
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  //Product API's
  static Future<List<Product>> getProducts({
    Map<String, dynamic>? extraQuery,
    int limit = 25,
    int page = 1,
  }) async {
    const url = '/products/';
    final response = await dio.get(
      url,
      queryParameters: {
        'limit': limit,
        'page': page,
        ...?extraQuery,
      },
    );
    return ApiHelpers.parseResponse(response, Product.fromJson);
  }

  //Notification API's
  static Future<List<NotificationModel>> getNotifications({
    Map<String, dynamic>? extraQuery,
    int limit = 25,
    int page = 1,
  }) async {
    const url = '/notifications/';
    final response = await dio.get(
      url,
      queryParameters: {
        'limit': limit,
        'page': page,
        ...?extraQuery,
      },
    );
    return ApiHelpers.parseResponse(response, NotificationModel.fromJson);
  }

  //Order API's
  static Future<List<Order>> getOrders({
    Map<String, dynamic>? extraQuery,
    int limit = 25,
    int page = 1,
  }) async {
    const url = '/orders/';
    final response = await dio.get(
      url,
      queryParameters: {
        'limit': limit,
        'page': page,
        ...?extraQuery,
      },
    );
    return ApiHelpers.parseResponse(response, Order.fromJson);
  }

  //Wishlist API's
  static Future<List<Wish>> getWishes({
    Map<String, dynamic>? extraQuery,
    int limit = 25,
    int page = 1,
  }) async {
    const url = '/wishes/';
    final response = await dio.get(
      url,
      queryParameters: {
        'limit': limit,
        'page': page,
        ...?extraQuery,
      },
    );
    return ApiHelpers.parseResponse(response, Wish.fromJson);
  }

  static Future<Wish> getWish({required String id}) async {
    final url = '/wishes/$id';
    final response = await dio.get(url);
    final data = ApiHelpers.checkError(response)['result'];
    return Wish.fromJson(data);
  }
}
