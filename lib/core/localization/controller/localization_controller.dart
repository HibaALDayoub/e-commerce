import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/local_storage/get_storage.dart';
import '../../constant/local_storage_box/local_storage_box.dart';

class LocalizationController extends GetxController {
  late Locale language;
  String languageCode = '';
  changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
    await GetStorageClass.setString(
        key: LocalStorageBox.languageKey, value: codeLanguage);
    Get.updateLocale(locale);
    language = Locale(codeLanguage);
    languageCode = language.languageCode;
    update();
    log("local is ${language.languageCode}");
  }

  initializeLanguage() async {
    String lang = await GetStorageClass.getString(LocalStorageBox.languageKey);
    log("lang is $lang");
    if (lang == 'ar') {
      language = const Locale('ar');
      languageCode = 'AR';
    } else if (lang == 'en') {
      language = const Locale('en');
      languageCode = 'EN';
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (language.languageCode == 'ar') {
        languageCode = 'EN';
        language = const Locale('ar');
      } else {
        languageCode = 'AR';
        language = const Locale('en');
      }
      log("language is $languageCode  ${language.languageCode}");
    }
  }

  @override
  void onInit() async {
    initializeLanguage();
    super.onInit();
  }
}
