import 'package:either_dart/either.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';

abstract interface class ExampleRepository {
  Future<Either<MainError, List<Example>>> get();
  Future<Either<MainError, void>> save();
}
