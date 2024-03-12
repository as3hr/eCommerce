class CategoryItem {
  final String title;
  final String image;

  CategoryItem({
    required this.image,
    required this.title,
  });

  static final allCategories = [
    CategoryItem(
      image: '',
      title: 'Hoodies',
    ),
    CategoryItem(
      image: '',
      title: 'Shorts',
    ),
    CategoryItem(
      image: '',
      title: 'Shoes',
    ),
    CategoryItem(
      image: '',
      title: 'Bag',
    ),
    CategoryItem(
      image: '',
      title: 'Accessories',
    ),
  ];
}
