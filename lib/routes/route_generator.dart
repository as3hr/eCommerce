// ignore_for_file: unused_local_variable, avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/credential/credential_listing.dart';
import 'package:ecommerce_admin_panel/screens/credential/credential_screen.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/home_page.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/home_screen.dart';
import 'package:ecommerce_admin_panel/screens/lead/lead_listing.dart';
import 'package:ecommerce_admin_panel/screens/lead/lead_screen.dart';
import 'package:ecommerce_admin_panel/screens/log/log_listing.dart';
import 'package:ecommerce_admin_panel/screens/log/log_screen.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view.dart';
import 'package:ecommerce_admin_panel/screens/permission/permission_listings.dart';
import 'package:ecommerce_admin_panel/screens/permission/permission_screen.dart';
import 'package:ecommerce_admin_panel/screens/user/user_listings.dart';
import 'package:ecommerce_admin_panel/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/user.dart';

class AppRouter {
  static var url = window.location.href;
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
              path: '/credentials',
              // redirect: (context, state) => redirect(context, state),
              routes: [
                GoRoute(
                    name: RouteName.orderScreen,
                    path: 'credential-screen',
                    // redirect: (context, state) => redirect(context, state),
                    builder: (context, state) {
                      return const CredentialScreen();
                    }),
              ],
              builder: (context, state) {
                return const CredentialListing();
              }),
          GoRoute(
            name: RouteName.addressesList,
            // redirect: (context, state) => redirect(context, state),
            path: '/leads',
            routes: [
              GoRoute(
                  name: RouteName.addressesScreen,
                  // redirect: (context, state) => redirect(context, state),
                  path: 'leads-screen',
                  builder: (context, state) {
                    return const LeadScreen();
                  }),
            ],
            builder: (context, state) {
              return const LeadListing();
            },
          ),
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
                    final user = state.extra as User;
                    return UserScreen(
                      user: user,
                    );
                  },
                ),
              ]),
          GoRoute(
              name: RouteName.notificationsList,
              path: '/logs',
              // redirect: (context, state) => redirect(context, state),
              builder: (context, state) {
                return const LogListing();
              },
              routes: [
                GoRoute(
                    name: RouteName.notificationsScreen,
                    path: 'logs-screen',
                    // redirect: (context, state) => redirect(context, state),
                    builder: (context, state) {
                      return const LogScreen();
                    }),
              ]),
          GoRoute(
              name: RouteName.productsList,
              path: '/permissions',
              // redirect: (context, state) => redirect(context, state),
              builder: (context, state) {
                return const PermissionListing();
              },
              routes: [
                GoRoute(
                    // redirect: (context, state) => redirect(context, state),
                    path: 'permissions-screen',
                    name: RouteName.productsScreen,
                    builder: (context, state) {
                      return const PermissionScreen();
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
