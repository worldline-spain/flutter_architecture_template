import 'package:either_dart/either.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';

abstract interface class RemoteDatasource {
  Future<Either<MainError, List<Example>>> getExample();
  Future<Either<MainError, void>> saveExample();
}
