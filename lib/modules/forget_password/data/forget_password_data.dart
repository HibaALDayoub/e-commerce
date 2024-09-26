import 'package:dartz/dartz.dart';
import 'package:e_comerce/core/api/dio/errors/api_errors.dart';

abstract class ForgetPasswordData {
  Future<Either<ApiErrors, Map>> forgetPassword({required String email});
}
