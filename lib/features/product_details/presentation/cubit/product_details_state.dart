import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

enum RequestState { init, loading, loaded, empty, error }

class ProductDetailsState extends Equatable {
  final RequestState requestState;
  final Product? product;
  final List<Product> similarProducts;
  final String errorMessage;
  final int quantity;
  final int currentImageIndex;

  const ProductDetailsState({
    this.requestState = RequestState.init,
    this.product,
    this.similarProducts = const [],
    this.errorMessage = '',
    this.quantity = 1,
    this.currentImageIndex = 0,
  });

  ProductDetailsState copyWith({
    RequestState? requestState,
    Product? product,
    List<Product>? similarProducts,
    String? errorMessage,
    int? quantity,
    int? currentImageIndex,
  }) {
    return ProductDetailsState(
      requestState: requestState ?? this.requestState,
      product: product ?? this.product,
      similarProducts: similarProducts ?? this.similarProducts,
      errorMessage: errorMessage ?? this.errorMessage,
      quantity: quantity ?? this.quantity,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }

  @override
  List<Object?> get props => [
    requestState,
    product,
    similarProducts,
    errorMessage,
    quantity,
    currentImageIndex,
  ];
}
