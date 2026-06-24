import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/features/home%20screen/core/data/product_data.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          HomeState(
            products: ProductData().dummyProducts,
          ),
        ) {
    on<AddProduct>(_onAddProduct);
    on<IncrementProduct>(_onIncrementProduct);
    on<DecrementProduct>(_onDecrementProduct);
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<HomeState> emit,
  ) {
    final updatedProducts = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(quantity: 1);
      }

      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));
  }

  void _onIncrementProduct(
    IncrementProduct event,
    Emitter<HomeState> emit,
  ) {
    final updatedProducts = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(
          quantity: product.quantity + 1,
        );
      }

      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));
  }

  void _onDecrementProduct(
    DecrementProduct event,
    Emitter<HomeState> emit,
  ) {
    final updatedProducts = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(
          quantity:
              product.quantity > 0 ? product.quantity - 1 : 0,
        );
      }

      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));
  }
}