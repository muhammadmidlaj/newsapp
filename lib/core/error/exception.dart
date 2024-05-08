import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  final String message;
  final int errorCode;

  const ApiException({required this.message, required this.errorCode});
  @override
  List<Object?> get props => [message, errorCode];
}
