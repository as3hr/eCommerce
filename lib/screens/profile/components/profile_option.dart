import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/help_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/payment_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/support_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/wishlist_screen.dart';

class ProfileOption {
  final String title;
  final Function() onTap;

  ProfileOption({required this.title, required this.onTap});

  static final allOptions = [
    ProfileOption(
        onTap: () {
          changePage(AddressScreen.routeName);
        },
        title: 'Address'),
    ProfileOption(
        onTap: () {
          changePage(WishListScreen.routeName);
        },
        title: 'Wishlist'),
    ProfileOption(
        onTap: () {
          changePage(PaymentScreen.routeName);
        },
        title: 'Payment'),
    ProfileOption(
        onTap: () {
          changePage(HelpScreen.routeName);
        },
        title: 'Help'),
    ProfileOption(
        onTap: () {
          changePage(SupportScreen.routeName);
        },
        title: 'Support'),
  ];
}
