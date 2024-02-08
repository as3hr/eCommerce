import 'package:flutter/material.dart';

import '../../helpers/styles/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.grayI,
          ),
          Positioned(
              right: 7,
              bottom: 10,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit,
                  color: AppColors.lightBlack,
                ),
              )),
        ],
      ),
    );
  }
}
