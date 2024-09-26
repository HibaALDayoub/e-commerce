import 'package:dartz/dartz.dart';

import '../../../core/api/dio/errors/api_errors.dart';

abstract class ProductDetailsData {
  Future<Either<ApiErrors, Map>> addToFav(String itemId);
  Future<Either<ApiErrors, Map>> addDataToCart(String itemId);
  Future<Either<ApiErrors, Map>> deleteFromFav(String itemId);
}
