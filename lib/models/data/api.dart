import 'package:ecommerce_admin_panel/models/data/api_helpers.dart';
import 'package:ecommerce_admin_panel/models/user_notification.dart';
import 'package:ecommerce_admin_panel/models/order.dart';
import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:ecommerce_admin_panel/models/user.dart';
import 'package:dio/dio.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      extra: {
        "withCredentials": true,
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Headers": '*',
        "Access-Control-Allow-Origin": "http://localhost:3000",
        "Set-Cookie":
            "session=[session_id]; Expires=[expire_time]; Secure; SameSite=None"
      },
      baseUrl: 'http://localhost:3000',
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      contentType: 'application/json',
    ),
  );

  static const defaultLimit = 50;

  static Future<User> login(
      {required String email, required String password}) async {
    const url = '/auth/login';
    final response = await dio.post(url, data: {
      "email": email,
      "password": password,
    });
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<void> logOut() async {
    const url = '/auth/signout';
    final response = await dio.post(url);
    ApiHelpers.checkError(response);
  }

  static Future<User> fetchProfile() async {
    const url = '/users/profile';
    final response = await dio.get(
      url,
    );
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<User> getUserById(String id) async {
    final url = '/users/$id';
    final response = await dio.get(
      url,
    );
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<List<User>> getAllUsers({
    int page = 1,
    int limit = 25,
    Map<String, dynamic>? extraQuery,
  }) async {
    const url = '/users/';
    final response = await dio.get(url, queryParameters: {
      'page': page,
      'limit': limit,
      ...?extraQuery,
    });
    return ApiHelpers.parseResponse(response, User.fromJson);
  }

  static Future<void> deleteUser(String id) async {
    final url = '/users/$id';
    final response = await dio.delete(
      url,
    );
    ApiHelpers.checkError(response);
  }

  static Future<Order> getOrderById(String id) async {
    final url = '/orders/$id';
    final response = await dio.get(
      url,
    );
    final data = ApiHelpers.checkError(response)['result'];
    return Order.fromJson(data);
  }

  static Future<List<Order>> getAllOrders({
    int page = 1,
    int limit = 25,
    Map<String, dynamic>? extraQuery,
  }) async {
    const url = '/orders/';
    final response = await dio.get(url, queryParameters: {
      'page': page,
      'limit': limit,
      ...?extraQuery,
    });
    return ApiHelpers.parseResponse(response, Order.fromJson);
  }

  static Future<void> deleteOrder(String id) async {
    final url = '/orders/$id';
    final response = await dio.delete(
      url,
    );
    ApiHelpers.checkError(response);
  }

  static Future<Product> getProductById(String id) async {
    final url = '/products/$id';
    final response = await dio.get(
      url,
    );
    final data = ApiHelpers.checkError(response)['result'];
    return Product.fromJson(data);
  }

  static Future<Product> createProduct(Product product) async {
    const url = '/products/';
    final response = await dio.post(url, data: product.toJson());
    final data = ApiHelpers.checkError(response)['result'];
    return Product.fromJson(data);
  }

  static Future<Product> updateProduct(Product product) async {
    final url = '/products/${product.id}';
    final response = await dio.put(url, data: product.toJson());
    final data = ApiHelpers.checkError(response)['result'];
    return Product.fromJson(data);
  }

  static Future<List<Product>> getAllProducts({
    int page = 1,
    int limit = 25,
    Map<String, dynamic>? extraQuery,
  }) async {
    const url = '/products/';
    final response = await dio.get(url, queryParameters: {
      'page': page,
      'limit': limit,
      ...?extraQuery,
    });
    return ApiHelpers.parseResponse(response, Product.fromJson);
  }

  static Future<void> deleteProduct(String id) async {
    final url = '/products/$id';
    final response = await dio.delete(
      url,
    );
    ApiHelpers.checkError(response);
  }

  static Future<UserNotification> createNotification(
      UserNotification notification) async {
    const url = '/notifications/';
    final response = await dio.post(url, data: notification.toJson());
    final data = ApiHelpers.checkError(response)['result'];
    return UserNotification.fromJson(data);
  }

  static Future<List<UserNotification>> getAllNotifications({
    int page = 1,
    int limit = 25,
    Map<String, dynamic>? extraQuery,
  }) async {
    const url = '/notifications/';
    final response = await dio.get(url, queryParameters: {
      'page': page,
      'limit': limit,
      ...?extraQuery,
    });
    return ApiHelpers.parseResponse(response, UserNotification.fromJson);
  }
}
