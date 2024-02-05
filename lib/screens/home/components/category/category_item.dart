class CategoryItem {
  final String title;
  final Future Function() onTap;
  final String image;

  CategoryItem({
    required this.image,
    required this.onTap,
    required this.title,
  });

  static final allCategories = [
    CategoryItem(
      image: '',
      onTap: () async {},
      title: 'Hoodies',
    ),
    CategoryItem(
      image: '',
      onTap: () async {},
      title: 'Shorts',
    ),
    CategoryItem(
      image: '',
      onTap: () async {},
      title: 'Shoes',
    ),
    CategoryItem(
      image: '',
      onTap: () async {},
      title: 'Bag',
    ),
    CategoryItem(
      image: '',
      onTap: () async {},
      title: 'Accessories',
    ),
  ];
}
