import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({this.stackTrace});
  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class CubitFailure extends Failure with EquatableMixin {
  CubitFailure({this.stackTrace});
  final String? stackTrace;

  @override
  List<Object?> get props => throw UnimplementedError();
}