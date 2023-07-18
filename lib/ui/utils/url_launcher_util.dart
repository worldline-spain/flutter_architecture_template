import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<void> launchPage(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
