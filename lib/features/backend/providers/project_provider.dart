import 'package:flutter/material.dart';

import '../../../core/repositories/portfolio_repository.dart';
import '../../../core/models/project_model.dart';

enum ProjectType {
  frontend,
  backend,
}

class ProjectProvider extends ChangeNotifier {
  ProjectProvider({required this.repository});

  final PortfolioRepository repository;

  List<ProjectModel> _projects = [];
  List<ProjectModel> get projects => _projects;

  Future<void> getProjects(ProjectType type) async {
    switch (type) {
      case ProjectType.frontend:
        _projects = await repository.getFrontendProjects();
        break;
      case ProjectType.backend:
        _projects = await repository.getBackendProjects();
        break;
    }
    notifyListeners();
  }
 
}