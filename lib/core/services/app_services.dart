import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../app/local_storage/get_storage.dart';
import '../constant/local_storage_box/local_storage_box.dart';
import '../localization/controller/localization_controller.dart';

class AppServices extends GetxService {
  //i use it for initialize all data i need instead of initialize it in the main function
  static int step = 0;
  static String fcmToken = '';
  static String userId = ''; //this the user client id
  static String itemId = ''; //this the user client id
  static String categoriesId = '';

  static LocalizationController? localizationController;
  Future<AppServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    // ______________
    step = await GetStorageClass.getInt(LocalStorageBox.step);
    localizationController = await Get.put(LocalizationController());
    userId = await GetStorageClass.getString(LocalStorageBox.userId);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
