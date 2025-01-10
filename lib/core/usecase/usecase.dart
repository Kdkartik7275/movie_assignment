import 'package:movies_assignment/core/utils/typedefs.dart';

abstract interface class UseCaseWithParams<Type, Params> {
  ResultFuture<Type> call(Params params);
}

abstract interface class UseCaseWithoutParams<Type> {
  ResultFuture<Type> call();
}
