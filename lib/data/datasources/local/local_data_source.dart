import 'package:either_dart/either.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/env/env.dart';

abstract interface class LocalDataSource {
  Future<Either<MainError, Env>> getEnvironment();
}
