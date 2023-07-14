// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/project_model.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';
import '../models/contact_model.dart';

const CACHED_FRONTEND_PROJECTS = 'CACHED_FRONTEND_PROJECTS';
const CACHED_BACKEND_PROJECTS = 'CACHED_BACKEND_PROJECTS';
const CACHED_ABOUT_ME = 'CACHED_ABOUT_ME';
const CACHED_SKILLS = 'CACHED_SKILLS';
const CACHED_CONTACTS = 'CACHED_CONTACTS';

class PortfolioLocalDataSource {
  final SharedPreferences sharedPreferences;

  PortfolioLocalDataSource({required this.sharedPreferences});

  Future<void> cacheFrontendProjects(List<ProjectModel> projects) async {
    final List<String> json = projects.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_FRONTEND_PROJECTS, json);
  }

  Future<void> cacheBackendProjects(List<ProjectModel> projects) async {
    final List<String> json = projects.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_BACKEND_PROJECTS, json);
  }

  Future<List<ProjectModel>> getCachedFrontendProjects() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_FRONTEND_PROJECTS) ?? [];
    return json.map((e) => ProjectModel.fromJson(jsonDecode(e))).toList();
  }

  Future<List<ProjectModel>> getCachedBackendProjects() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_BACKEND_PROJECTS) ?? [];

    return json.map((e) => ProjectModel.fromJson(jsonDecode(e))).toList();
  }

  Future<void> cacheAboutMe(AboutMeModel aboutMe) async {
    final String json = aboutMe.toJson().toString();
    await sharedPreferences.setString(CACHED_ABOUT_ME, json);
  }

  Future<AboutMeModel> getCachedAboutMe() async {
    final String json = sharedPreferences.getString(CACHED_ABOUT_ME) ?? '';
    return AboutMeModel.fromJson(jsonDecode(json));
  }

  Future<void> cacheSkills(List<Skill> skills) async {
    final List<String> json = skills.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_SKILLS, json);
  }

  Future<List<Skill>> getCachedSkills() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_SKILLS) ?? [];
    return json.map((e) => Skill.fromJson(jsonDecode(e))).toList();
  }

  Future<void> cacheFrontendSkills(List<Skill> skills) async {
    final List<String> json = skills.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_SKILLS, json);
  }

  Future<List<Skill>> getCachedFrontendSkills() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_SKILLS) ?? [];
    return json.map((e) => Skill.fromJson(jsonDecode(e))).toList();
  }

  Future<void> cacheBackendSkills(List<Skill> skills) async {
    final List<String> json = skills.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_SKILLS, json);
  }

  Future<List<Skill>> getCachedBackendSkills() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_SKILLS) ?? [];
    return json.map((e) => Skill.fromJson(jsonDecode(e))).toList();
  }

  Future<void> cacheContacts(List<ContactModel> contacts) async {
    final List<String> json = contacts.map((e) => e.toJson().toString()).toList();
    await sharedPreferences.setStringList(CACHED_CONTACTS, json);
  }

  Future<List<ContactModel>> getCachedContacts() async {
    final List<String> json = sharedPreferences.getStringList(CACHED_CONTACTS) ?? [];
    return json.map((e) => ContactModel.fromJson(jsonDecode(e))).toList();
  }
}
