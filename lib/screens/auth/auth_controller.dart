import 'package:dio/dio.dart';
import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api_error.dart';
import '../../helpers/functions/change_page.dart';
import '../../models/token.dart';
import 'login/login_screen.dart';

class AuthController extends GetxController {
  final isInitialized = false.obs;
  User user = User();
  String image = '';
  final token = Rx<Token?>(null);
  bool get authenticated => token.value != null;
  String email = '';
  String password = '';

  @override
  void onInit() {
    addInterceptor();
    autoLogin();
    super.onInit();
  }

  void addInterceptor() {
    Api.dio.interceptors.addAll([
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          if (response.headers.map.containsKey('set-cookie')) {
            final tokenVal = Token(
              bearerToken: (response.headers['set-cookie'] as List)[0],
            );
            token.value = tokenVal;
            update();
          }
          return handler.next(response);
        },
        onRequest: (options, handler) {
          if (token.value != null) {
            options.headers['cookie'] = token.value;
          }
          return handler.next(options);
        },
      ),
      PrettyDioLogger(
        request: true,
        requestHeader: false,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  Future<void> login() async {
    await Api.login(email: email.trim(), password: password.trim());
    token.value?.persistToken();
    fetchProfile();
    update();
  }

  Future<void> googleSignIn() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = fire.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final result =
        await fire.FirebaseAuth.instance.signInWithCredential(credential);

    final user = User(
        firstName: result.user?.displayName ?? '',
        email: result.user?.email ?? '',
        image: result.user?.photoURL ?? '');

    socialAuth(user);
  }

  Future<void> saveImage(String path, {bool isSocial = false}) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setString('image', path),
      prefs.setString('email', user.email ?? ''),
      prefs.setBool('isSocial', isSocial),
    ]);
    image = await getImage();
  }

  Future<void> removeImage() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove('image'),
    ]);
    image = '';
    update();
  }

  Future<String> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    final image = prefs.getString('image');
    final email = prefs.getString('email');
    if (email == user.email) {
      return image ?? '';
    } else {
      await removeImage();
      return '';
    }
  }

  Future<void> socialAuth(User user) async {
    await Api.socialAuth(user: user);
    token.value?.persistToken();
    await fetchProfile();
    await saveImage(user.image ?? '', isSocial: true);
    update();
  }

  Future<void> signUp({
    required User user,
  }) async {
    await Api.signUp(user: user);
    showToast(
      message: 'Account created Successfully!',
      imagePath: AppImages.successful,
    );
    changePage(LoginScreen.routeName);
  }

  Future<void> fetchProfile() async {
    user = await Api.getUser();
    final prefs = await SharedPreferences.getInstance();
    final isSocial = prefs.getBool('isSocial');
    if (isSocial == true) {
      user.isSocial = true;
    }
    update();
  }

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await Api.logout();
    await removeImage();
    await Token.clearToken();
    token.value = null;
    user = User();
    update();
  }

  Future<void> autoLogin() async {
    final storedTokens = await Token.fetchToken();
    if (storedTokens != null) {
      try {
        token.value = storedTokens;
        await fetchProfile();
        image = await getImage();
        update();
      } on ApiError catch (e) {
        if (e.type == ErrorType.invalidCredentials ||
            e.type == ErrorType.unAuthorized) {
          Token.clearToken();
          token.value = null;
        }
      }
    }
    isInitialized.value = true;
  }

  Future<void> updateUser({
    required User user,
  }) async {
    await Api.updateUser(user: user);
    fetchProfile();
    showToast(
      message: 'Profile Updated!',
      imagePath: AppImages.successful,
    );
  }
}
