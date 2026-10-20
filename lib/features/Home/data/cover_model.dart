class CoverModel {
  final String imageUrl;
  final String name;
  CoverModel({required this.imageUrl, required this.name});

  static List<CoverModel> covers = [
    CoverModel(imageUrl: 'assets/cover/cover3.png', name: 'Black collection'),
    CoverModel(imageUrl: 'assets/cover/cover2.png', name: 'Black collection'),
    CoverModel(imageUrl: 'assets/cover/cover1.png', name: 'Black collection'),
  ];
}
