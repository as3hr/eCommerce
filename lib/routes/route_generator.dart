import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/order/order_listing.dart';
import 'package:ecommerce_admin_panel/screens/order/order_screen.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/home_page.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/home_screen.dart';
import 'package:ecommerce_admin_panel/screens/notification/notification_listing.dart';
import 'package:ecommerce_admin_panel/screens/notification/notification_screen.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view.dart';
import 'package:ecommerce_admin_panel/screens/product/product_listings.dart';
import 'package:ecommerce_admin_panel/screens/product/product_screen.dart';
import 'package:ecommerce_admin_panel/screens/user/user_listings.dart';
import 'package:ecommerce_admin_panel/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    routes: [
      GoRoute(
          name: RouteName.login,
          path: '/',
          // redirect: (context, state) {
          //   return Get.find<Auth>().authenticated ? url : null;
          // },
          builder: (context, state) {
            return const LoginView();
          }),
      ShellRoute(
        builder: (context, state, child) {
          return HomePage(
            child: child,
          );
        },
        routes: [
          GoRoute(
            builder: (context, state) {
              return const HomeScreen();
            },
            name: RouteName.home,
            path: '/dashboard',
            // redirect: (context, state) => redirect(context, state),
          ),
          GoRoute(
              name: RouteName.ordersList,
              path: '/orders',
              // redirect: (context, state) => redirect(context, state),
              routes: [
                GoRoute(
                    name: RouteName.orderScreen,
                    path: 'order-screen',
                    // redirect: (context, state) => redirect(context, state),
                    builder: (context, state) {
                      return const OrderScreen();
                    }),
              ],
              builder: (context, state) {
                return const OrderListing();
              }),
          GoRoute(
              name: RouteName.userList,
              path: '/users',
              // redirect: (context, state) => redirect(context, state),
              builder: (context, state) {
                return const UserListing();
              },
              routes: [
                GoRoute(
                  name: RouteName.userScreen,
                  path: 'users-screen',
                  // redirect: (context, state) => redirect(context, state),
                  builder: (context, state) {
                    return const UserScreen();
                  },
                ),
              ]),
          GoRoute(
              name: RouteName.notificationsList,
              path: '/notifications',
              // redirect: (context, state) => redirect(context, state),
              builder: (context, state) {
                return const NotificationListing();
              },
              routes: [
                GoRoute(
                    name: RouteName.notificationsScreen,
                    path: 'notifications-screen',
                    // redirect: (context, state) => redirect(context, state),
                    builder: (context, state) {
                      return const NotificationScreen();
                    }),
              ]),
          GoRoute(
              name: RouteName.productsList,
              path: '/products',
              // redirect: (context, state) => redirect(context, state),
              builder: (context, state) {
                return const ProductListing();
              },
              routes: [
                GoRoute(
                    // redirect: (context, state) => redirect(context, state),
                    path: 'product-screen',
                    name: RouteName.productsScreen,
                    builder: (context, state) {
                      return const ProductScreen();
                    }),
              ]),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      );
    },
  );

  // static String? redirect(BuildContext context, GoRouterState state) {
  //   return Get.find<Auth>().authenticated
  //       ? null
  //       : state.namedLocation(LoginView.routeName);
  // }
}
