import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/network/status.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:flutter/foundation.dart';
import 'package:disney/core/services/service_locator.dart'as di;

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options
      ..baseUrl = ApiConstans.baseUrl
      ..receiveDataWhenStatusError = true
      ..connectTimeout = 20 * 1000
      ..receiveTimeout = 20 * 1000;
    if(kDebugMode) {
      dio.interceptors.add(di.sl<LogInterceptor>());
    }
  }



  Future getData(
      {required String url,
      Map<String, dynamic>? qary,
      String? token,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    try {
      return dio.get(url, queryParameters: qary);
    } on DioError catch (e) {
       _handleDioError(e);
    }
  }

  Future postData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      String? token,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    try {
      return dio.post(url, data: sendDate);
    } on DioError catch (e) {
      _handleDioError(e);
    }
  }

  Future putData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    try {
      return dio.put(url, data: sendDate);
    } on DioError catch (e) {
      _handleDioError(e);
    }
  }

  Future remove(
      {required String url,
      Map<String, dynamic>? qary,
      Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    try {
      return dio.delete(url, data: sendDate);
    } on DioError catch (e) {
      _handleDioError(e);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw  ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw  ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.notFound:
            throw ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.confilct:
            throw ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));

          case StatusCode.internalServerError:
            throw ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw
          ServerException(apiErrorModel: ApiErrorModel.fromJson(error.response!.data));

    }
    }
}
