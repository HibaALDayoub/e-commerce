import 'package:dartz/dartz.dart';

import '../../../core/api/dio/errors/api_errors.dart';

abstract class CartData {
  Future<Either<ApiErrors, Map>> viewCart();
}
