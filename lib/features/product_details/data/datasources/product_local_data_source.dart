import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>> getLastProducts();
}

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductModel> productBox;

  ProductLocalDataSourceImpl(this.productBox);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await productBox.clear();
    await productBox.addAll(products);
  }

  @override
  Future<List<ProductModel>> getLastProducts() async {
    return productBox.values.toList();
  }
}
