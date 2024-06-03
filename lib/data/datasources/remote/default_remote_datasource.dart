import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/data/datasources/remote/remote_datasource.dart';
import 'package:worldline_flutter/data/dto/example_dto.dart';
import 'package:worldline_flutter/data/services/api_service.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';
import 'package:worldline_flutter/env/env.dart';

@Injectable(as: RemoteDatasource)
class DefaultRemoteDatasource implements RemoteDatasource {
  final ApiService _apiService;
  final _env = getIt<Env>();

  DefaultRemoteDatasource(this._apiService);

  @override
  Future<Either<MainError, List<Example>>> getExample() async {
    final uri = Uri.parse(
      "${_env.urlRestService}/pois.json",
    );

    final result = await _apiService.get<Map<String, dynamic>>(uri);
    return result.either<MainError, List<Example>>(
      (left) => left,
      (right) => ExampleDto.fromJson(right).toModel(),
    );
  }

  @override
  Future<Either<MainError, void>> saveExample() {
    throw UnimplementedError();
  }
}
