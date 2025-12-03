import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      // First, try to get local data
      final localProducts = await localDataSource.getLastProducts();

      // If local data is empty, check internet and fetch remote data
      if (localProducts.isEmpty) {
        try {
          // Fetch from remote data source
          final remoteProducts = await remoteDataSource.getProducts();

          // Handle case where remote data is empty - return empty list
          if (remoteProducts.isEmpty) {
            return const Right([]);
          }

          // Save data locally
          await localDataSource.cacheProducts(remoteProducts);

          // Return remote data
          return Right(remoteProducts);
        } catch (remoteError) {
          // Handle remote fetch errors (no internet, server error, etc.)
          return Left('Failed to fetch products: ${remoteError.toString()}');
        }
      }

      // Return local data if available
      return Right(localProducts);
    } catch (localError) {
      // Handle local data access errors
      try {
        // If local data fails, try remote as fallback
        final remoteProducts = await remoteDataSource.getProducts();

        // Return empty list if no products available
        if (remoteProducts.isEmpty) {
          return const Right([]);
        }

        // Try to cache the data (but don't fail if caching fails)
        try {
          await localDataSource.cacheProducts(remoteProducts);
        } catch (_) {
          // Ignore caching errors, we still have the data
        }

        return Right(remoteProducts);
      } catch (remoteError) {
        // Both local and remote failed
        return const Left(
          'Unable to load products. Please check your connection and try again.',
        );
      }
    }
  }
}
