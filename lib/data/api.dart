import 'package:dio/dio.dart';
import 'package:e_commerce/data/api_helpers.dart';
import 'package:e_commerce/models/message.dart';
import 'package:e_commerce/models/notification.dart';
import 'package:e_commerce/models/order.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/models/wishlist.dart';

import '../models/address.dart';
import '../models/chat.dart';

class Api {
  static const baseUrl = 'http://192.168.1.103:3000';
  static final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
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

  static Future<void> addFcm({required String fcmToken}) async {
    const url = '/users/add-token';
    final response = await dio.post(url, data: {'fcmToken': fcmToken});
    ApiHelpers.checkError(response);
  }

  static Future<String> uploadImage(String file, String fileName) async {
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file,
        filename: fileName,
      ),
    });
    const url = '/uploads/';
    final response = await dio.post(
      url,
      data: data,
    );
    final image = ApiHelpers.checkError(response)['result'];
    return image;
  }

  static Future<void> socialAuth({required User user}) async {
    const url = '/auth/social';
    final response = await dio.post(url, data: user.toJson());
    ApiHelpers.checkError(response);
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

  static Future<Order> createOrder({required Order order}) async {
    const url = '/orders/';
    final response = await dio.post(url, data: order.toJson());
    final data = ApiHelpers.checkError(response)['result'];
    return Order.fromJson(data);
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

  static Future<Wish> updateWish({required Wish wish}) async {
    final url = '/wishes/${wish.id}';
    final response = await dio.put(url, data: wish.toJson());
    final data = ApiHelpers.checkError(response)['result'];
    return Wish.fromJson(data);
  }

  //address Api
  static Future<List<Address>> getAddresses() async {
    const url = '/addresses/';
    final response = await dio.get(url);
    return ApiHelpers.parseResponse(response, Address.fromJson);
  }

  static Future<void> updateAddress({required Address address}) async {
    final url = '/addresses/${address.id}';
    final response = await dio.put(url, data: address.toJson());
    ApiHelpers.checkError(response)['result'];
  }

  static Future<void> createAddress({required Address address}) async {
    const url = '/addresses/';
    final response = await dio.post(url, data: address.toJson());
    ApiHelpers.checkError(response)['result'];
  }

  static Future<void> deleteAddress({required Address address}) async {
    final url = '/addresses/${address.id}';
    final response = await dio.delete(url);
    ApiHelpers.checkError(response);
  }

  //Message API's
  static Future<List<Message>> getMessages({
    required String chatId,
    int limit = 25,
    int page = 1,
    Map<String, dynamic>? extraQuery,
  }) async {
    const url = '/messages/';
    final response = await dio.get(
      url,
      queryParameters: {
        'limit': limit,
        'page': page,
        'chatId': chatId,
        ...?extraQuery
      },
    );
    return ApiHelpers.parseResponse(response, Message.fromJson);
  }

  static Future<void> updateMessage({required Message message}) async {
    final url = '/messages/${message.id}';
    final response = await dio.put(url, data: message.toJson());
    ApiHelpers.checkError(response)['result'];
  }

  static Future<void> deleteMessage({required Message message}) async {
    final url = '/messages/${message.id}';
    final response = await dio.delete(url);
    ApiHelpers.checkError(response);
  }

  //Chat Api's
  static Future<void> createChat() async {
    const url = '/chats/';
    final response = await dio.post(url);
    ApiHelpers.checkError(response)['result'];
  }

  static Future<Chat> getMyChat() async {
    const url = '/chats/';
    final response = await dio.get(url);
    final data = ApiHelpers.checkError(response)['result']['data'] as List;
    if (data.isNotEmpty) {
      return Chat.fromJson(data.first);
    }
    return Chat();
  }
}
