import 'package:flutter/material.dart';

import '../../../core/repositories/portfolio_repository.dart';
import '../../../core/models/about_me_model.dart';


class AboutMeProvider extends ChangeNotifier {
  AboutMeProvider({required this.repository});

  final PortfolioRepository repository;

  AboutMeModel? _aboutMe;
  AboutMeModel? get aboutMe => _aboutMe;

  Future<void> getAboutMe() async {
    _aboutMe = await repository.getAboutMe();
    notifyListeners();
  }
 
}