abstract class HomeEvent {}

class AddProduct extends HomeEvent {
  final String productId;

  AddProduct(this.productId);
}

class IncrementProduct extends HomeEvent {
  final String productId;

  IncrementProduct(this.productId);
}

class DecrementProduct extends HomeEvent {
  final String productId;

  DecrementProduct(this.productId);
}