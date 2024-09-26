import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/dio_crud/http_methods.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/core/api/links/api_links.dart';
import 'package:e_comerce/modules/login/data/login_data.dart';

import '../../../core/classes/dio_method.dart';

class LoginDataImpl implements LoginData {
  final HttpMethods httpMethods;

  LoginDataImpl({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> login(
      {required String email, required String password}) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks().login,
        body: {
          "email": email,
          "password": password,
        },
        isAuthorized: false);
  }
}
