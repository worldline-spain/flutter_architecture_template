import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/data/datasources/local/local_data_source.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/repositories/system/system_respository.dart';
import 'package:worldline_flutter/env/env.dart';

@Injectable(as: SystemRepository)
class SystemRepositoryImpl implements SystemRepository {
  final LocalDataSource _localDatasource;

  SystemRepositoryImpl(this._localDatasource);

  @override
  Future<Either<MainError, Env>> get() {
    return _localDatasource.getEnvironment();
  }

  @override
  Future<Either<MainError, bool>> save() {
    throw UnimplementedError();
  }
}
