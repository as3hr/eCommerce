import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_screen.dart';

import '../../../helpers/functions/change_page.dart';
import 'profile_sub_screens/address/address_screen.dart';
import 'profile_sub_screens/wishlist/wishlist_screen.dart';

class ProfileOption {
  final String title;
  final Function() onTap;

  ProfileOption({required this.title, required this.onTap});

  static final allOptions = [
    ProfileOption(
      onTap: () {
        changePage(AddressScreen.routeName);
      },
      title: 'Address',
    ),
    ProfileOption(
      onTap: () {
        changePage(WishListScreen.routeName);
      },
      title: 'Wishlist',
    ),
    ProfileOption(
      onTap: () {
        changePage(ChatScreen.routeName);
      },
      title: 'Chat Support',
    ),
  ];
}
