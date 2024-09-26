import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/core/services/app_services.dart';
import 'package:e_comerce/modules/categories_detailes/data/category_data.dart';

import '../../../core/api/dio/dio_crud/http_methods.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/dio_method.dart';

class CategoryDataImp implements CategoryData {
  final HttpMethods httpMethods;
  CategoryDataImp({required this.httpMethods});
  @override
  Future<Either<ApiErrors, Map>> viewCategoryData(String id) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.itemsLink,
        body: {"categoryid": id, "userid": AppServices.userId},
        // body: {"favoriteUserId": AppServices.userId},
        isAuthorized: false);
  }
}
