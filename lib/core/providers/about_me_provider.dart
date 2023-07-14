import 'package:flutter/material.dart';

import '../repositories/portfolio_repository.dart';
import '../models/about_me_model.dart';

enum AboutMeStatus { loading, loaded, error }

class AboutMeProvider extends ChangeNotifier {
  AboutMeProvider({required this.repository});

  final PortfolioRepository repository;
  AboutMeStatus status = AboutMeStatus.loading;

  AboutMeModel? _aboutMe;
  AboutMeModel? get aboutMe => _aboutMe;

  Future<void> getAboutMe() async {
    try {
      _aboutMe = await repository.getAboutMe();
      status = AboutMeStatus.loaded;
      notifyListeners();
    } catch (e) {
      status = AboutMeStatus.error;
      notifyListeners();
    }
  }
}
