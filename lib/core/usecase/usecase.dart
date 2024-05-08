import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
   Future<Either<Failure, Type>> call();
}