// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import '../../../classes/status_request.dart';
// import 'api_errors.dart';


// class DioExceptions {
//   static ApiErrors showDioExceptionMessage(
//       {required DioException dioException}) {
//     ApiErrors? apiErrors;
//     if (dioException.message!.contains("401")) {
//       apiErrors =ApiErrors(message: "Un authorized", statusRequest: StatusRequest.failure);
//     } else {
//       log("exception is ${dioException.type}");
//       switch (dioException.type) {
//         case DioExceptionType.receiveTimeout:
//           apiErrors = ApiErrors(
//               message: 'Receive connection timeout',
//               statusRequest: StatusRequest.timeOutFailure);
//           break;
//         case DioExceptionType.connectionTimeout:
//           apiErrors = ApiErrors(
//               message: 'Request connection timeout',
//               statusRequest: StatusRequest.timeOutFailure);
//           break;
//         case DioExceptionType.sendTimeout:
//           apiErrors = ApiErrors(
//               message: 'Request connection timeout',
//               statusRequest: StatusRequest.timeOutFailure);
//           break;
//         case DioExceptionType.connectionError:
//           debugPrint("check internet connections or check api end point");
//           apiErrors = ApiErrors(
//               message: 'No internet connection',
//               statusRequest: StatusRequest.offlineFailure);
//           break;
//         case DioExceptionType.cancel:
//           //error on body parameter
//           apiErrors = ApiErrors(
//               message: 'Something went wrong try again',
//               statusRequest: StatusRequest.failure);
//           break;
//         case DioExceptionType.badResponse:
//           //error on body parameter
//           apiErrors = ApiErrors(
//               message: dioException.response?.data,
//               statusRequest: StatusRequest.failure);
//           break;
//         default:
//           apiErrors = ApiErrors(
//               message: "Un know error", statusRequest: StatusRequest.failure);
//       }
//     }
//     return apiErrors;
//   }
// }
