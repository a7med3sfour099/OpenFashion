class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  static List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: 'Product 1',
      description: 'Description of Product 1',
      price: 100,
      imageUrl: 'assets/product/product1.png',
    ),
    ProductModel(
      id: '2',
      name: 'Product 2',
      description: 'Description of Product 2',
      price: 19.99,
      imageUrl: 'assets/product/product2.png',
    ),
    ProductModel(
      id: '3',
      name: 'Product 3',
      description: 'Description of Product 3',
      price: 120,
      imageUrl: 'assets/product/product3.png',
    ),
    ProductModel(
      id: '4',
      name: 'Product 4',
      description: 'Description of Product 4',
      price: 150,
      imageUrl: 'assets/product/product4.png',
    ),
    ProductModel(
      id: '5',
      name: 'Product 5',
      description: 'Description of Product 5',
      price: 200,
      imageUrl: 'assets/product/product5.png',
    ),
    ProductModel(
      id: '6',
      name: 'Product 6',
      description: 'Description of Product 6',
      price: 250,
      imageUrl: 'assets/product/product6.png',
    ),
  ];
}
