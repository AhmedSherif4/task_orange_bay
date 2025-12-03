// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/network/api_client.dart' as _i1059;
import '../../features/product_details/data/datasources/product_local_data_source.dart'
    as _i481;
import '../../features/product_details/data/datasources/product_remote_data_source.dart'
    as _i857;
import '../../features/product_details/data/models/product_model.dart' as _i245;
import '../../features/product_details/data/repositories/product_repository_impl.dart'
    as _i137;
import '../../features/product_details/domain/repositories/product_repository.dart'
    as _i743;
import '../../features/product_details/domain/usecases/get_products_usecase.dart'
    as _i813;
import '../../features/product_details/presentation/cubit/product_details_cubit.dart'
    as _i4;
import '../theme/theme_cubit.dart' as _i611;
import 'external_module.dart' as _i489;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalModule = _$ExternalModule();
    final registerModule = _$RegisterModule();
    gh.singleton<_i611.ThemeCubit>(() => _i611.ThemeCubit());
    await gh.lazySingletonAsync<_i979.Box<_i245.ProductModel>>(
      () => externalModule.productBox,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i857.ProductRemoteDataSource>(
        () => _i857.ProductRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i481.ProductLocalDataSource>(() =>
        _i481.ProductLocalDataSourceImpl(gh<_i979.Box<_i245.ProductModel>>()));
    gh.lazySingleton<_i743.ProductRepository>(() => _i137.ProductRepositoryImpl(
          remoteDataSource: gh<_i857.ProductRemoteDataSource>(),
          localDataSource: gh<_i481.ProductLocalDataSource>(),
        ));
    gh.lazySingleton<_i813.GetProductsUseCase>(
        () => _i813.GetProductsUseCase(gh<_i743.ProductRepository>()));
    gh.factory<_i4.ProductDetailsCubit>(
        () => _i4.ProductDetailsCubit(gh<_i813.GetProductsUseCase>()));
    return this;
  }
}

class _$ExternalModule extends _i489.ExternalModule {}

class _$RegisterModule extends _i1059.RegisterModule {}
