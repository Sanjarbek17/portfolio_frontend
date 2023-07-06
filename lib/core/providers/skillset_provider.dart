import 'package:flutter/material.dart';

import '../repositories/portfolio_repository.dart';
import '../models/skill_model.dart';

enum SkillsetType { frontend, backend }

enum SkillsetStatus { loading, loaded, error }

class SkillsetProvider extends ChangeNotifier {
  SkillsetProvider({required this.repository});

  final PortfolioRepository repository;
  SkillsetStatus status = SkillsetStatus.loading;

  List<Skill> _skills = [];
  List<Skill> get skills => _skills;

  Future<void> getSkills(SkillsetType type) async {
    try {
      switch (type) {
        case SkillsetType.frontend:
          _skills = await repository.getFrontendSkills();
          break;
        case SkillsetType.backend:
          _skills = await repository.getBackendSkills();
          break;
      }
      if (_skills.isEmpty && _skills.length < 9) {
        status = SkillsetStatus.error;
      } else {
        status = SkillsetStatus.loaded;
      }

      notifyListeners();
    } catch (e) {
      print(e);
      status = SkillsetStatus.error;
      notifyListeners();
    }
  }
}
