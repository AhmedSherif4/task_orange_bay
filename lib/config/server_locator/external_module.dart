import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/product_details/data/models/product_model.dart';

@module
abstract class ExternalModule {
  @preResolve
  @lazySingleton
  Future<Box<ProductModel>> get productBox async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(ReviewModelAdapter());
    return await Hive.openBox<ProductModel>('products');
  }
}
