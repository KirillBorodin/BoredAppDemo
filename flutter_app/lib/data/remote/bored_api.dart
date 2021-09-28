import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'model/action_response.dart';

part 'bored_api.g.dart';

@RestApi()
abstract class BoredApi {
  factory BoredApi(Dio dio, {String baseUrl}) = _BoredApi;

  @GET("/activity")
  Future<ActionResponse> fetchAction();
}
