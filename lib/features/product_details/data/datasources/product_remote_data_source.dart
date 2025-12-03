import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_orange_bay/core/network/endpoints.dart';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(EndPoints.productsPath);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('----------------------------------');
        print(data);
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
