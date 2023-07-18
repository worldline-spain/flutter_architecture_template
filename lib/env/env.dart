abstract class Env {
  final String urlRestService;
  final String packageName;

  const Env({
    required this.urlRestService,
    required this.packageName,
  });
}

class EnvConfig implements Env {
  @override
  String get packageName => const String.fromEnvironment("PACKAGE_NAME");

  @override
  String get urlRestService => const String.fromEnvironment("URL_REST_SERVICE");
}
