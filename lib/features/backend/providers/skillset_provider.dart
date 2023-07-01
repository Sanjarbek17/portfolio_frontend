import 'package:flutter/material.dart';

import '../../../core/repositories/portfolio_repository.dart';
import '../../../core/models/skill_model.dart';

class SkillsetProvider extends ChangeNotifier {
  SkillsetProvider({required this.repository});

  final PortfolioRepository repository;

  List<Skill> _skills = [];
  List<Skill> get skills => _skills;

  Future<void> getSkills() async {
    _skills = await repository.getSkills();
    notifyListeners();
  }
 
}