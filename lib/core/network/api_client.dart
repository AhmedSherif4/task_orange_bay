import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_orange_bay/core/network/endpoints.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
}
