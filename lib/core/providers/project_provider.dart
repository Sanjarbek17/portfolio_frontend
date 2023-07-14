import 'package:flutter/material.dart';

import '../repositories/portfolio_repository.dart';
import '../models/project_model.dart';

enum ProjectType {
  frontend,
  backend,
}

enum ProjectStatus {
  loading,
  loaded,
  error,
}

class ProjectProvider extends ChangeNotifier {
  ProjectProvider({required this.repository});

  final PortfolioRepository repository;

  ProjectStatus status = ProjectStatus.loading;

  List<ProjectModel> _projects = [];
  List<ProjectModel> get projects => _projects;

  Future<void> getProjects(ProjectType type) async {
    try {
      switch (type) {
        case ProjectType.frontend:
          _projects = await repository.getFrontendProjects();
          break;
        case ProjectType.backend:
          _projects = await repository.getBackendProjects();
          break;
      }
      status = ProjectStatus.loaded;
      notifyListeners();
    } catch (e) {
      status = ProjectStatus.error;
      notifyListeners();
    }
  }
}
