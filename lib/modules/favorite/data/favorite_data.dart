import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';

abstract class FavoriteData {
  Future<Either<ApiErrors, Map>> viewFavoriteData();
  Future<Either<ApiErrors, Map>> deleteFromFav(String itemId);
}
