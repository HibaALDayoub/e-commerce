import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/dio_crud/http_methods.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/modules/forget_password/data/forget_password_data.dart';

import '../../../core/api/links/api_links.dart';
import '../../../core/classes/dio_method.dart';

class ForgetPasswordDataImp implements ForgetPasswordData {
  final HttpMethods httpMethods;
  ForgetPasswordDataImp({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> forgetPassword({required String email}) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks().forgetPassword,
        body: {
          "email": email,
        },
        isAuthorized: false);
  }
}
