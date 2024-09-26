import 'package:dartz/dartz.dart';

import '../../../core/api/dio/dio_crud/http_methods.dart';
import '../../../core/api/dio/errors/api_errors.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/dio_method.dart';
import '../../../core/services/app_services.dart';
import 'product_det_data.dart';

class ProductDetailsDataImp implements ProductDetailsData {
  final HttpMethods httpMethods;

  ProductDetailsDataImp({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> addToFav(String itemId) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.addToFavorite,
        body: {"userId": AppServices.userId, "itemId": itemId},
        isAuthorized: false);
  }

  @override
  Future<Either<ApiErrors, Map>> deleteFromFav(String itemId) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.removeFromFavorite,
        body: {"userId": AppServices.userId, "itemId": itemId},
        isAuthorized: false);
  }

  @override
  Future<Either<ApiErrors, Map>> addDataToCart(String itemId) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.addToCart,
        body: {"userId": AppServices.userId, "itemId": itemId},
        isAuthorized: false);
  }
}
