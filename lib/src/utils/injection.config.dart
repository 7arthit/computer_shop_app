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

import '../data/data_repositories/authentication_repository.dart' as _i9;
import '../data/data_repositories/product_repository.dart' as _i13;
import '../data/data_sources/remote/rest_client.dart' as _i7;
import '../data/dio_config/dio_module.dart' as _i16;
import '../domain/repositories/authentication_repository.dart' as _i8;
import '../domain/repositories/product_repository.dart' as _i12;
import '../domain/usecase/authentication_usecase.dart' as _i10;
import '../domain/usecase/product_usecase.dart' as _i14;
import '../presentation/pages/login/bloc/login_cubit.dart' as _i11;
import '../presentation/pages/product/bloc/product_cubit.dart' as _i15;
import '../presentation/pages/product_order/bloc/product_order_cubit.dart'
    as _i5;
import '../presentation/pages/product_order_history/bloc/product_order_history_cubit.dart'
    as _i6;
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
  gh.factory<_i6.ProductOrderHistoryCubit>(
      () => _i6.ProductOrderHistoryCubit());
  gh.lazySingleton<_i7.RestClient>(() => _i7.RestClient(gh<_i4.Dio>()));
  gh.factory<_i8.AuthenticationRepository>(
      () => _i9.DataAuthenticationRepository(gh<_i7.RestClient>()));
  gh.lazySingleton<_i10.AuthenticationUseCase>(
      () => _i10.AuthenticationUseCase(gh<_i8.AuthenticationRepository>()));
  gh.factory<_i11.LoginCubit>(
      () => _i11.LoginCubit(gh<_i10.AuthenticationUseCase>()));
  gh.factory<_i12.ProductRepository>(
      () => _i13.DataProductRepository(gh<_i7.RestClient>()));
  gh.lazySingleton<_i14.ProductUseCase>(
      () => _i14.ProductUseCase(gh<_i12.ProductRepository>()));
  gh.factory<_i15.ProductCubit>(
      () => _i15.ProductCubit(gh<_i14.ProductUseCase>()));
  return getIt;
}

class _$DioModule extends _i16.DioModule {}
