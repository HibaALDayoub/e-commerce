import 'package:dartz/dartz.dart';

import '../../../core/api/dio/errors/api_errors.dart';

abstract class CategoryData {
  Future<Either<ApiErrors, Map>> viewCategoryData(String id);
}
