import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';
import 'package:e_comerce/modules/cart/data/cart_data.dart';

import '../../../core/api/dio/dio_crud/http_methods.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/dio_method.dart';
import '../../../core/services/app_services.dart';

class CartDataImpl implements CartData {
  HttpMethods httpMethods;
  CartDataImpl({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> viewCart() async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post,
        linkUrl: ApiLinks.viewCart,
        body: {"userId": AppServices.userId},
        isAuthorized: false);
  }
}
