import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/data/data_sources/helper/exception.dart';

@module
abstract class DioModule {
  @Injectable()
  Dio get instance {
    var dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("onResponse ${response.data}");
      return handler.next(response);
    }, onError: (e, handler) async {
      print("onErrors ${e.response}");
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          handler.next(UnAuthenticationException(e));
        } else if (e.response?.statusCode == 500) {
          handler.next(ServerException(e));
        } else {
          handler.next(e);
        }
      }
    }));
    return dio;
  }
}
