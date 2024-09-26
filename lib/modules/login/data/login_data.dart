import 'package:dartz/dartz.dart';

import '../../../core/api/dio/errors/api_errors.dart';

abstract class LoginData {
  Future<Either<ApiErrors, Map>> login(
      {required String email, required String password});
}
