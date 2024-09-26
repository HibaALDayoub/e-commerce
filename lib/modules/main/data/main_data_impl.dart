import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/dio_crud/http_methods.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/core/api/links/api_links.dart';
import 'package:e_comerce/core/services/app_services.dart';
import 'package:e_comerce/modules/main/data/main_data.dart';

import '../../../core/classes/dio_method.dart';

class MainDataImpl implements MainData {
  final HttpMethods httpMethods;

  MainDataImpl({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> getHomeData() async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.homeLink,
        body: {"userid": AppServices.userId},
        isAuthorized: false);
  }
}
