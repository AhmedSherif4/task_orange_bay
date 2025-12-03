import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import 'product_details_state.dart';

/// Cubit responsible for managing the state of the Product Details screen.
@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductsUseCase getProductsUseCase;

  ProductDetailsCubit(this.getProductsUseCase)
    : super(const ProductDetailsState());

  /// Loads the product details from the use case.
  ///
  /// Emits [RequestState.loading] initially, then [RequestState.loaded] with the product data
  /// or [RequestState.error] with the failure message.
  Future<void> loadProductDetails() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getProductsUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(requestState: RequestState.error, errorMessage: failure),
      ),
      (products) {
        if (products.isEmpty) {
          emit(state.copyWith(requestState: RequestState.empty));
        } else {
          final product = products.first;
          final similarProducts = products.length > 1
              ? products.sublist(1)
              : <Product>[];

          emit(
            state.copyWith(
              requestState: RequestState.loaded,
              product: product,
              similarProducts: similarProducts,
            ),
          );
        }
      },
    );
  }

  /// Increments the quantity of the product to be added to the cart.
  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  /// Decrements the quantity of the product.
  ///
  /// Ensures the quantity does not go below 1.
  void decrementQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  /// Sets the index of the currently displayed image in the slider.
  void setCurrentImageIndex(int index) {
    emit(state.copyWith(currentImageIndex: index));
  }
}
