// ignore_for_file: constant_identifier_names

import '../models/language_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    const LanguageModel(
      imageUrl: "Рус",
      languageName: 'русский',
      countryCode: 'RU',
      languageCode: 'ru',
    ),
    const LanguageModel(
      imageUrl: "Eng",
      languageName: 'english',
      countryCode: 'US',
      languageCode: 'en',
    ),
  ];
}
