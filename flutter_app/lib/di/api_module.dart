import 'package:dio/dio.dart';
import 'package:flutter_app/data/remote/bored_api.dart';
import 'package:flutter_app/data/remote/logging_interceptor.dart';
import 'package:flutter_app/data/remote/network_constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @lazySingleton
  BoredApi get bubblesApi {
    Dio dio = Dio();
    dio.interceptors.add(LoggingInterceptor());
    return BoredApi(
      dio,
      baseUrl: NetworkConstants.BORED_BASE_URL,
    );
  }
}
