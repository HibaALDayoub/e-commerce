import 'package:get/get.dart';
import '../../classes/validation_type.dart';

class ValidationErrors {
  static String fieldValidation(
      {required String value,
      required int minValue,
      required int maxValue,
      required ValidationType validationType}) {
    if (validationType == ValidationType.name) {
      if (!GetUtils.isUsername(value)) {
        return 'Please enter a valid name'.tr;
      }
    }
    if (validationType == ValidationType.email) {
      if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email'.tr;
      }
    }
    if (validationType == ValidationType.number) {
      if (!hasMatch(value, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')) {
        return 'Please enter a valid phone number'.tr;
      }
    }
    if (value.isEmpty) {
      return "This field is required".tr;
    }
    if (value.length < minValue) {
      return "${"Can't be less than".tr} $minValue";
    }
    if (value.length > maxValue) {
      return "${"Can't be more than".tr} $maxValue";
    }
    return '';
  }

  //for compare passwords
  static confirmValidate(String passwordValue, String confirmPasswordValue) {
    if (confirmPasswordValue != passwordValue ||
        confirmPasswordValue.isEmpty ||
        passwordValue.isEmpty) {
      return "Doesn't compare".tr;
    }
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
