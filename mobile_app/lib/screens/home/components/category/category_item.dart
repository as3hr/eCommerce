import 'package:e_commerce/helpers/styles/app_images.dart';

class CategoryItem {
  final String title;
  final String image;

  CategoryItem({
    required this.image,
    required this.title,
  });

  static final allCategories = [
    CategoryItem(
      image: AppImages.hoodie,
      title: 'Hoodies',
    ),
    CategoryItem(
      image: AppImages.shorts,
      title: 'Shorts',
    ),
    CategoryItem(
      image: AppImages.shoes,
      title: 'Shoes',
    ),
    CategoryItem(
      image: AppImages.bag,
      title: 'Bag',
    ),
    CategoryItem(
      image: AppImages.accessories,
      title: 'Accessories',
    ),
  ];
}
