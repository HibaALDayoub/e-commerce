import 'package:dartz/dartz.dart';

import '../../../core/api/dio/errors/api_errors.dart';

abstract class MainData {
  Future<Either<ApiErrors, Map>> getHomeData();
}
