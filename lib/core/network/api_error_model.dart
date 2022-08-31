import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ApiErrorModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  List<Object> get props => [statusCode, statusMessage, success];
}
