import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/data/datasources/remote/remote_datasource.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';
import 'package:worldline_flutter/domain/repositories/example/example_repository.dart';

@Injectable(as: ExampleRepository)
class ExampleRepositoryImpl implements ExampleRepository {
  final RemoteDatasource _remoteDatasource;

  ExampleRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<MainError, List<Example>>> get() {
    return _remoteDatasource.getExample();
  }
}
