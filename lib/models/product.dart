class Product {
  final String id;
  final String imageUrl;
  final String title;
  final String price;
  final double rating;
  final int reviews;
  final int quantity;
  final String description;

  Product(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.rating,
      required this.reviews,
      required this.quantity,
      required this.description});
}
