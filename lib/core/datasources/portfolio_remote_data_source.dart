import 'package:dio/dio.dart';

import '../models/project_model.dart';

class PortfolioRemoteDataSource {
  PortfolioRemoteDataSource({required this.dio});

  final Dio dio;

  Future<List<ProjectModel>> getFrontendProjects() async {
    final response = await dio.get('frontend/');
    final List<dynamic> json = response.data as List<dynamic>;
    // TODO: multi language support
    return json.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<ProjectModel>> getBackendProjects() async {
    final response = await dio.get('backend/');
    final List<dynamic> json = response.data as List<dynamic>;
    // TODO: multi language support
    return json.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
