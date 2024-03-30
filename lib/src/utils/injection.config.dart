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

import '../data/data_repositories/authentication_repository.dart' as _i8;
import '../data/data_repositories/product_repository.dart' as _i12;
import '../data/data_sources/remote/rest_client.dart' as _i6;
import '../data/dio_config/dio_module.dart' as _i15;
import '../domain/repositories/authentication_repository.dart' as _i7;
import '../domain/repositories/product_repository.dart' as _i11;
import '../domain/usecase/authentication_usecase.dart' as _i9;
import '../domain/usecase/product_usecase.dart' as _i13;
import '../presentation/pages/login/bloc/login_cubit.dart' as _i10;
import '../presentation/pages/product/bloc/product_cubit.dart' as _i14;
import '../presentation/pages/product_order/bloc/product_order_cubit.dart'
    as _i5;
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
  gh.factory<_i5.ProductOrderCubit>(() => _i5.ProductOrderCubit());
  gh.lazySingleton<_i6.RestClient>(() => _i6.RestClient(gh<_i4.Dio>()));
  gh.factory<_i7.AuthenticationRepository>(
      () => _i8.DataAuthenticationRepository(gh<_i6.RestClient>()));
  gh.lazySingleton<_i9.AuthenticationUseCase>(
      () => _i9.AuthenticationUseCase(gh<_i7.AuthenticationRepository>()));
  gh.factory<_i10.LoginCubit>(
      () => _i10.LoginCubit(gh<_i9.AuthenticationUseCase>()));
  gh.factory<_i11.ProductRepository>(
      () => _i12.DataProductRepository(gh<_i6.RestClient>()));
  gh.lazySingleton<_i13.ProductUseCase>(
      () => _i13.ProductUseCase(gh<_i11.ProductRepository>()));
  gh.factory<_i14.ProductCubit>(
      () => _i14.ProductCubit(gh<_i13.ProductUseCase>()));
  return getIt;
}

class _$DioModule extends _i15.DioModule {}
