import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable{
  final String imageUrl;
  final String languageName;
  final String languageCode;
  final String countryCode;

  const LanguageModel({
    required this.imageUrl,
    required this.languageName,
    required this.countryCode,
    required this.languageCode,
  });
  
  @override
  List<Object?> get props => [imageUrl, languageCode, languageName, countryCode];
}
