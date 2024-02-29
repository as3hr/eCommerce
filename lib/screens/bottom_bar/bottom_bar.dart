import '../../helpers/styles/app_images.dart';
import '../home/home_screen.dart';
import '../notification/notification_screen.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';

class BottomBar {
  final String image;
  final String routeName;

  BottomBar({
    required this.image,
    required this.routeName,
  });

  static final allBottomBarItems = [
    BottomBar(
      image: AppImages.home,
      routeName: HomeScreen.routeName,
    ),
    BottomBar(
      image: AppImages.notification,
      routeName: NotificationScreen.routeName,
    ),
    BottomBar(
      image: AppImages.order,
      routeName: OrderScreen.routeName,
    ),
    BottomBar(
      image: AppImages.profile,
      routeName: ProfileScreen.routeName,
    ),
  ];
}
