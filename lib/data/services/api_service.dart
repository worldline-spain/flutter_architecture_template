import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/data/services/dio_service.dart';
import 'package:worldline_flutter/data/transformers/error_transformer.dart';
import 'package:worldline_flutter/domain/models/errors.dart';

class ApiService extends DioRestService<MainError> {
  ApiService()
      : super(
          validCodes: [200, 201, 204],
          catchErrors: errorsHandler,
        );
}

@module
abstract class ApiServiceModule {
  @lazySingleton
  ApiService get httpClient => ApiService();
}
