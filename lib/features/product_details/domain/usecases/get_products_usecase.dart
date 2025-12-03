import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<String, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
