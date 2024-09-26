import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/dio_crud/http_methods.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/core/api/links/api_links.dart';
import 'package:e_comerce/core/classes/dio_method.dart';
import 'package:e_comerce/modules/favorite/data/favorite_data.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../core/services/app_services.dart';

class FavoriteDataImp implements FavoriteData {
  final HttpMethods httpMethods;
  FavoriteDataImp({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> viewFavoriteData() async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.viewFavorite,
        body: {"favoriteUserId": AppServices.userId},
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
}
