import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio_frontend/core/constants/app_constants.dart';
import 'package:portfolio_frontend/core/models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/language_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString('assets/locales/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });

    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
  }
  return languages;
}
