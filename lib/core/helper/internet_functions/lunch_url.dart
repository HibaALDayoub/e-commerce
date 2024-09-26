
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../classes/url_luncher_method_type.dart';


class UrlLuncher {
 static Future<void> launchURL(
      {required String url, required UrlLuncherMethodType method}) async {
    final Uri uri = Uri(scheme: selectedMethod(method: method), path: url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      AppToasts.errorToast("Failed to lunch");
      throw "cant lunch url";
    }
  }

 static String selectedMethod({required UrlLuncherMethodType method}) {
    String selectedMethod = '';
    switch (method) {
      case UrlLuncherMethodType.email:
        selectedMethod = 'mailto';
        return selectedMethod;
      case UrlLuncherMethodType.phoneCall:
        selectedMethod = 'tel';
        return selectedMethod;
      case UrlLuncherMethodType.sms:
        selectedMethod = 'sms';
        return selectedMethod;
      case UrlLuncherMethodType.https:
        selectedMethod = 'https';
        return selectedMethod;
      default:
        selectedMethod = 'https';
        return selectedMethod;
    }
  }
}
