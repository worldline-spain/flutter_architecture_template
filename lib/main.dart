import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:worldline_flutter/app.dart';
import 'package:worldline_flutter/data/services/certificates_http_overrides.dart';
import 'package:worldline_flutter/di/di.dart';

void main() async {
  const String env = String.fromEnvironment("ENVIRONMENT");
  configureDependencies(env: env);
  final widgetBindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBindings);

  if (dev.name == env) overrideHttpCertificate();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('es'),
      child: const App(),
    ),
  );
}
