// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_repositories/product_repository.dart' as _i7;
import '../data/data_sources/remote/rest_client.dart' as _i5;
import '../data/dio_config/dio_module.dart' as _i10;
import '../domain/repositories/product_repository.dart' as _i6;
import '../domain/usecase/product_usecase.dart' as _i8;
import '../presentation/pages/product/bloc/product_cubit.dart' as _i9;
import '../presentation/widgets/bottombar/bloc/bottom_bar_cubit.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.factory<_i3.BottomBarCubit>(() => _i3.BottomBarCubit());
  gh.factory<_i4.Dio>(() => dioModule.instance);
  gh.lazySingleton<_i5.RestClient>(() => _i5.RestClient(gh<_i4.Dio>()));
  gh.factory<_i6.ProductRepository>(
      () => _i7.DataProductRepository(gh<_i5.RestClient>()));
  gh.lazySingleton<_i8.ProductUseCase>(
      () => _i8.ProductUseCase(gh<_i6.ProductRepository>()));
  gh.factory<_i9.ProductCubit>(
      () => _i9.ProductCubit(gh<_i8.ProductUseCase>()));
  return getIt;
}

class _$DioModule extends _i10.DioModule {}
