import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {super.key,
      required this.image,
      this.isFav = false,
      required this.title,
      required this.price});
  final String image;
  final bool isFav;
  final String title;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 280,
        width: 0.5.sw,
        color: AppColors.grayI,
        child: Stack(
          children: [
            const Center(child: Icon(Icons.abc_sharp)),
            Positioned(
              top: 10,
              right: 5,
              child: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 0.5.sw,
                  color: AppColors.grayIII,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('\$$price'),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
