import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:worldline_flutter/di/di.config.dart';
import 'package:worldline_flutter/env/env.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required String env}) =>
    getIt.init(environment: env);

const dev = Environment("dev");
const prep = Environment("prep");
const prod = Environment("prod");

@module
abstract class DiModule {
  @Singleton()
  Env get env => EnvConfig();

  @Singleton()
  MainNavigator get navigator => MainNavigator();
}
