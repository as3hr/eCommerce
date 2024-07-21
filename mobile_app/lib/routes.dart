import 'package:e_commerce/binding.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_screen.dart';

import 'helpers/widgets/item_detail/item_detail_screen.dart';
import 'screens/auth/login/login_screen.dart';
import 'screens/auth/sign_up/sign_up.dart';
import 'screens/bottom_bar/bottom_nav_bar.dart';
import 'screens/home/components/cart/cart_screen.dart';
import 'screens/home/components/cart/checkout/checkout_screen.dart';
import 'screens/home/components/cart/checkout/order_placed.dart';
import 'screens/home/components/category/categories_screen.dart';
import 'screens/home/components/category/category_content.dart';
import 'screens/home/home_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/order/components/order_detail/order_detail.dart';
import 'screens/order/order_screen.dart';
import 'screens/profile/components/profile_sub_screens/address/add_address_screen.dart';
import 'screens/profile/components/profile_sub_screens/address/address_screen.dart';
import 'screens/home/components/cart/checkout/payment/add_card_screen.dart';
import 'screens/home/components/cart/checkout/payment/payment_screen.dart';
import 'screens/profile/components/profile_sub_screens/wishlist/wishlist_screen.dart';
import 'screens/profile/components/update_profile_screen.dart';
import 'screens/profile/profile_screen.dart';
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
          settings: settings,
          page: () => const SplashScreen(),
        );
      case SignUp.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SignUp(),
        );
      case LoginScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const LoginScreen(),
        );
      case BottomNavBar.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const BottomNavBar(),
          binding: Binding(),
        );
      case HomeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
        );
      case CartScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CartScreen(),
        );
      case CheckoutScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CheckoutScreen(),
        );
      case OrderPlaced.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OrderPlaced(),
        );
      case CategoriesScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const CategoriesScreen(),
        );
      case CategoryContent.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => CategoryContent(
            category: args['category'],
          ),
        );
      case ProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ProfileScreen(),
        );
      case UpdateProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const UpdateProfileScreen(),
        );
      case OrderScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const OrderScreen(),
        );
      case OrderDetail.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => OrderDetail(
            order: args['order'],
          ),
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const NotificationScreen(),
        );
      case ItemDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ItemDetailScreen(
            product: args['product'],
            changable: args['changable'] ?? true,
          ),
        );
      case AddressScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AddressScreen(),
        );
      case AddAddressScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => AddAddressScreen(
            address: args['address'],
          ),
        );
      case WishListScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const WishListScreen(),
        );
      case WishListCollectionScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => WishListCollectionScreen(
            wish: args['wish'],
          ),
        );
      case PaymentScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => PaymentScreen(
            amount: args['amount'],
            currency: args['currency'],
          ),
        );
      case ChatScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ChatScreen(),
        );
      case AddCardScreen.routeName:
        return GetPageRoute(
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
