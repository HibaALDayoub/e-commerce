import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../../classes/dio_method.dart';
import '../../../classes/status_request.dart';
import '../../../helper/internet_functions/check_internet_connection.dart';
import '../errors/api_errors.dart';
import 'package:http/http.dart' as http;

class HttpMethods {
  Future<Either<ApiErrors, Map>> allMethod({
    required HttpMethod httpMethod,
    required String linkUrl,
    Map? body,
    required bool isAuthorized,
    // مافهمت   الفايل   شو يعني 
    //    ومافهمت ليش ال ماب كلها 
    // من اجل رفع صورة مثلا
    
    Map<String, List<File>>? files,
  }) async {
    try {
      // log("url link is $linkUrl");
      if (await checkInternetConnection()) {
        var response = await chooseMethod(
          // هون البارمترات ضروري متل ال الفانكشن السابقة
          body: body,
          linkUrl: linkUrl,
          httpMethod: httpMethod,
          isAuthorized: isAuthorized,
          files: files,
        );

        // debugPrint("status code is ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          // log("tttt ${response.body}");
          Map responseBody = jsonDecode(response.body);
          log("response is $responseBody");
          return Right(responseBody);
        } else {
          return left(ApiErrors(
            // ياريت توضحلي ياهن بالضبط
              statusCode: response.statusCode,
              message: response.body.toString(),
              statusRequest: StatusRequest.failure));
        }
      } else {
        // توضيح لكلاس اي بي اي ايرور
        return left(ApiErrors(
            message: 'No internet connection',
            statusRequest: StatusRequest.failure));
      }
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on TimeoutException catch (e) {
      log('Time Out | $e');
      return Left(NetworkError(message: "Time Out"));
    } catch (e) {
      log("catch error $e");
      return left(
          ApiErrors(message: "$e", statusRequest: StatusRequest.failure));
    }
  }

  Future<Response> chooseMethod({
    required HttpMethod httpMethod,
    required String linkUrl,
     body,
    required bool isAuthorized,
    Map<String, List<File>>? files,
  }) async {
    //======POST==========================
    if (httpMethod == HttpMethod.post) {
      return await http
      // ليش حطيت       uri  ?
          .post(
            Uri.parse(linkUrl),
            body: body,
            // headers:
            //     isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
          )
          .timeout(const Duration(seconds: 30));
    }
    if (httpMethod == HttpMethod.get) {
      return await http
          .get(
            Uri.parse(linkUrl),
            // headers:
            //     isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
          )
          .timeout(const Duration(seconds: 30));
    }
    //======MULTIPART==========================
    else if (httpMethod == HttpMethod.multiPart) {}

    return await http
        .get(
          Uri.parse(linkUrl),
          // headers:
          //     isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
        )
        .timeout(const Duration(seconds: 30));
  }
}
