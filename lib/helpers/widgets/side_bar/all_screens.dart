import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';

class AllScreens {
  static final allScreens = [
    Screen(routeName: RouteName.userList, title: 'Users'),
    Screen(routeName: RouteName.ordersList, title: 'Orders'),
    Screen(routeName: RouteName.productsList, title: 'Products'),
    Screen(routeName: RouteName.addressesList, title: 'Addresses'),
    Screen(routeName: RouteName.notificationsList, title: 'Notifications'),
  ];
}
