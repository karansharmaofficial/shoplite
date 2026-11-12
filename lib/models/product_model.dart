class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final String thumbnail;
  final double price;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title']?.toString() ?? 'Untitled product',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? 'Other',
      thumbnail: json['thumbnail']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );
  }
}