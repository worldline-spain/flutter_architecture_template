import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class PlatformUtil {
  /// Executing on: `web` with SO `Android` or `iOS`.
  static bool get isMobileBrowser => kIsWeb && PlatformUtil.isMobileSystem;

  /// Executing on: app with SO `Android` or `iOS`.
  ///
  /// Never executing on: `web`.
  static bool get isMobileApp => !kIsWeb && PlatformUtil.isMobileSystem;

  /// Executing on: `Android` or `iOS`.
  ///
  /// Do not matter if is app or web.
  static bool get isMobileSystem =>
      PlatformUtil.isIOS || PlatformUtil.isAndroid;

  /// Executing on: `Android`.
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Executing on: `iOS`.
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Executing on: `web`.
  static bool get isWeb => kIsWeb;
}
