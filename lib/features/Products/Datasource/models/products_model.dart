class ProductsModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String thumbnail;
  ProductsModel(
      {required this.category,
      required this.description,
      required this.price,
      required this.rating,
      required this.thumbnail,
      required this.title});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      title: json['title'] ?? "no title",
      description: json['description'] ?? "no description",
      price: json['price'] ?? "no price",
      rating: json['rating'] ?? "no rating",
      thumbnail: json['thumbnail'] ?? "no thumbnail",
      category: json['category'] ?? "no category",
    );
  }
}
