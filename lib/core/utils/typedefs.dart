import 'package:fpdart/fpdart.dart';
import 'package:movies_assignment/core/exceptions/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
