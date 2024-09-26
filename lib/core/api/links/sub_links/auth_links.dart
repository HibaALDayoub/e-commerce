import '../api_links.dart';

mixin AuthLinks {
  String get login => '${ApiLinks.serverLink}/auth/login.php';
  String get forgetPassword =>
      '${ApiLinks.serverLink}/forgetPassword/checkemail.php';
}
