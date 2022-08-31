import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMassage;

  const Failure(this.errorMassage);

  @override
  List<Object> get props => [errorMassage];
}

class ServerFailure extends Failure{
  const ServerFailure(super.errorMassage);
}