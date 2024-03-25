import 'package:computer_shop_app/src/data/data_models/request/login_request.dart';
import 'package:computer_shop_app/src/data/data_models/response/login_response.dart';
import 'package:computer_shop_app/src/data/data_models/response/role_drop_downs_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:computer_shop_app/src/config/app_config.dart';
import 'package:computer_shop_app/src/data/data_models/response/product_response.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/api_response.dart';

part 'rest_client.g.dart';

@LazySingleton()
@RestApi(baseUrl: AppConfig.domain)
@Headers({
  "Accept": "application/json",
  "Content-Type": "application/json",
  "Cache-Control": "max-age=640000"
})
abstract class RestClient {
  @FactoryMethod()
  factory RestClient(@FactoryMethod() Dio dio) = _RestClient;

  @GET(ApiPath.products)
  Future<HttpResponse<ApiResponse<List<ProductResponse>>>> product({
    @Header("Authorization") required String accessToken,
    @Query("page_size") required int page_size,
  });

  @GET(ApiPath.roledropdowns)
  Future<HttpResponse<ApiResponse<List<RoleDropDownsResponse>>>> roleDropDowns();

  @POST(ApiPath.login)
  Future<HttpResponse<LoginResponse>> login({
    @Body() required LoginRequest form,
  });
}
