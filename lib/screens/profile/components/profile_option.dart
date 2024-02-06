import 'package:e_commerce/helpers/functions/change_page.dart';

class ProfileOption {
  final String title;
  final Function() onTap;

  ProfileOption({required this.title, required this.onTap});

  static final allOption = [
    ProfileOption(
        onTap: () {
          changePage('');
        },
        title: 'Address'),
    ProfileOption(
        onTap: () {
          changePage('');
        },
        title: 'Wishlist'),
    ProfileOption(
        onTap: () {
          changePage('');
        },
        title: 'Payment'),
    ProfileOption(
        onTap: () {
          changePage('');
        },
        title: 'Help'),
    ProfileOption(
        onTap: () {
          changePage('');
        },
        title: 'Support'),
  ];
}
