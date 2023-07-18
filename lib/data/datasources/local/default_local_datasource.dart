import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/data/datasources/local/local_data_source.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/env/env.dart';

@Injectable(as: LocalDataSource)
class DefaultLocalDataSource implements LocalDataSource {
  final env = getIt<Env>();

  @override
  Future<Either<MainError, Env>> getEnvironment() {
    try {
      return Future.value(Right(env));
    } catch (e) {
      return Future.value(Left(UnknownError()));
    }
  }
}
