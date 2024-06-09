import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.navy,
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
