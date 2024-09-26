// import 'dart:developer';

// import '../../api/links/api_links.dart';
// import '../../app/local_storage/get_storage.dart';
// import '../../constant/local_storage_box/local_storage_box.dart';
// import '../../services/app_services.dart';

// class AuthHelper {
//  static storeLoginData(
//       {required Map r, required String email, required String phoneNumber}) {
//     GetStorageClass.setString(key: LocalStorageBox.userEmail, value: email);
//     GetStorageClass.setString(
//         key: LocalStorageBox.userPassword, value: phoneNumber);
//     AppServices.userEmail = email;
//     AppServices.userPassword = phoneNumber;
//     String token = r['data']['token'];
//     int userId = r['data']['clientId'];
//     int id = r['data']['id'];
//     String role = r['data']['type'];
//     String refreshToken = r['data']['refreshToken'];
//     GetStorageClass.setString(key: LocalStorageBox.token, value: token);
//     GetStorageClass.setString(key: LocalStorageBox.userRole, value: role);
//     GetStorageClass.setString(
//         key: LocalStorageBox.refreshToken, value: refreshToken);
//     GetStorageClass.setString(
//         key: LocalStorageBox.userId, value: id.toString());
//     AppServices.accessToken = token;
//     AppServices.userId = userId.toString();
//     AppServices.userRole = role;
//     AppServices.refreshToken = refreshToken;
//     ApiLinks.authorizedHeaders = {
//       'Content-Type': 'application/json',
//       'Authorization': "Bearer $token",
//     };
//     log("token is ========== ${AppServices.accessToken}");
//   }
// }
