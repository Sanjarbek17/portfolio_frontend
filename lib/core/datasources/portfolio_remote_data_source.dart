import 'package:dio/dio.dart';

import '../models/project_model.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';
import '../models/contact_model.dart';

class PortfolioRemoteDataSource {
  PortfolioRemoteDataSource({required this.dio});

  final Dio dio;

  Future<List<ProjectModel>> getFrontendProjects() async {
    final response = await dio.get('frontend/');
    final List<dynamic> json = response.data as List<dynamic>;
    return json.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<ProjectModel>> getBackendProjects() async {
    final response = await dio.get('backend/');
    final List<dynamic> json = response.data as List<dynamic>;
    return json.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<AboutMeModel> getAboutMe() async {
    final response = await dio.get('about/');
    final List json = response.data as List<dynamic>;
    return AboutMeModel.fromJson(json[0]);
  }

  Future<List<Skill>> getSkills() async {
    final response = await dio.get('skill/');
    final List<dynamic> json = response.data as List<dynamic>;
    return json.map((e) => Skill.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Skill>> getFrontendSkills() async {
    final response = await dio.get('frontend-skill/');
    final List<dynamic> json = response.data as List<dynamic>;
    
    return json.map((e) => Skill.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Skill>> getBackendSkills() async {
    final response = await dio.get('backend-skill/');
    final List<dynamic> json = response.data as List<dynamic>;

    return json.map((e) => Skill.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<ContactModel>> getContacts() async {
    final response = await dio.get('contact/');
    final List<dynamic> json = response.data as List<dynamic>;
    return json.map((e) => ContactModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
