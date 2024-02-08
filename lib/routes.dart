import 'package:e_commerce/helpers/widgets/item_detail/item_detail_screen.dart';
import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/auth/sign_up/sign_up.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar.dart';
import 'package:e_commerce/screens/home/components/category/categories_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/notification/notification_screen.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_detail.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address/add_address_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address/address_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/payment/add_card_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/payment/payment_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/wishlist/wishlist_screen.dart';
import 'package:e_commerce/screens/profile/components/update_profile_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/profile/components/profile_sub_screens/wishlist/wishlist_collection_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args =
        (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

    switch (settings.name) {
      case SplashScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const SplashScreen(),
        );
      case SignUp.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const SignUp(),
        );
      case LoginScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const LoginScreen(),
        );
      case BottomNavBar.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const BottomNavBar(),
        );
      case HomeScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const HomeScreen(),
        );
      case CategoriesScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const CategoriesScreen(),
        );
      case ProfileScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const ProfileScreen(),
        );
      case UpdateProfileScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const UpdateProfileScreen(),
        );
      case OrderScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const OrderScreen(),
        );
      case OrderDetail.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const OrderDetail(),
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const NotificationScreen(),
        );
      case ItemDetailScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const ItemDetailScreen(),
        );
      case AddressScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const AddressScreen(),
        );
      case AddAddressScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const AddAddressScreen(),
        );
      case WishListScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const WishListScreen(),
        );
      case WishListCollectionScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => WishListCollectionScreen(
            title: args['title'],
          ),
        );
      case PaymentScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const PaymentScreen(),
        );
      case AddCardScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const AddCardScreen(),
        );
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(settings) {
    return GetPageRoute(
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
      settings: settings,
      page: () {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      },
    );
  }
}
