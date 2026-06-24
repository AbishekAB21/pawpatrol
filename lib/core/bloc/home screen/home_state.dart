import 'package:pawpatrol/features/home%20screen/core/models/product_model.dart';

class HomeState {
  final List<ProductModel> products;

  const HomeState({
    required this.products,
  });

  HomeState copyWith({
    List<ProductModel>? products,
  }) {
    return HomeState(
      products: products ?? this.products,
    );
  }
}