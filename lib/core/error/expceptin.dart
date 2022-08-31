import 'package:disney/core/network/api_error_model.dart';

class ServerException implements Exception{
  final ApiErrorModel apiErrorModel;
  ServerException({ required this.apiErrorModel});
}