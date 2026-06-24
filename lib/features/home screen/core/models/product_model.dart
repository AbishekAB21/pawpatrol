class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final int quantity;
  final String unit; // generic descriptor: weight, size, count, pack — whatever fits the product

  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    this.quantity = 0,
    this.unit = '',
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    double? originalPrice,
    int? quantity,
    String? unit,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }
}