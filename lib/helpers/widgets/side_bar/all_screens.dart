import 'package:ecommerce_admin_panel/helpers/styles/asset_images.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';

class AllScreens {
  static final allScreens = [
    Screen(
      image: AssetImages.home,
      routeName: RouteName.home,
      title: 'Overview',
    ),
    Screen(
      image: AssetImages.users,
      routeName: RouteName.userList,
      title: 'Users',
    ),
    Screen(
      image: AssetImages.order,
      routeName: RouteName.ordersList,
      title: 'Orders',
    ),
    Screen(
      image: AssetImages.product,
      routeName: RouteName.productsList,
      title: 'Products',
    ),
    Screen(
      image: AssetImages.chat,
      routeName: RouteName.chatScreen,
      title: 'Chats',
    ),
    Screen(
      image: AssetImages.users,
      routeName: RouteName.profileScreen,
      title: 'Account',
    ),
  ];
}
