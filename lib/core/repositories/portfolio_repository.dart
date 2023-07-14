import '../datasources/portfolio_local_data_source.dart';
import '../datasources/portfolio_remote_data_source.dart';

// get models
import '../models/project_model.dart';
import '../models/about_me_model.dart';
import '../models/skill_model.dart';
import '../models/contact_model.dart';

class PortfolioRepository {
  PortfolioRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final PortfolioLocalDataSource localDataSource;
  final PortfolioRemoteDataSource remoteDataSource;

  Future<List<ProjectModel>> getFrontendProjects() async {
    final projects = await remoteDataSource.getFrontendProjects();
    await localDataSource.cacheFrontendProjects(projects);
    return projects;
  }

  Future<List<ProjectModel>> getBackendProjects() async {
    final projects = await remoteDataSource.getBackendProjects();
    await localDataSource.cacheBackendProjects(projects);
    return projects;
  }

  Future<List<ProjectModel>> getCachedFrontendProjects() async {
    return await localDataSource.getCachedFrontendProjects();
  }

  Future<List<ProjectModel>> getCachedBackendProjects() async {
    return await localDataSource.getCachedBackendProjects();
  }

  Future<AboutMeModel> getAboutMe() async {
    final aboutMe = await remoteDataSource.getAboutMe();
    await localDataSource.cacheAboutMe(aboutMe);
    return aboutMe;
  }

  Future<AboutMeModel> getCachedAboutMe() async {
    return await localDataSource.getCachedAboutMe();
  }

  Future<List<Skill>> getSkills() async {
    final skills = await remoteDataSource.getSkills();
    await localDataSource.cacheSkills(skills);
    return skills;
  }

  Future<List<Skill>> getCachedSkills() async {
    return await localDataSource.getCachedSkills();
  }

  Future<List<Skill>> getFrontendSkills() async {
    final skills = await remoteDataSource.getFrontendSkills();
    await localDataSource.cacheFrontendSkills(skills);
    return skills;
  }

  Future<List<Skill>> getCachedFrontendSkills() async {
    return await localDataSource.getCachedFrontendSkills();
  }

  Future<List<Skill>> getBackendSkills() async {
    final skills = await remoteDataSource.getBackendSkills();
    await localDataSource.cacheBackendSkills(skills);
    return skills;
  }

  Future<List<Skill>> getCachedBackendSkills() async {
    return await localDataSource.getCachedBackendSkills();
  }

  Future<List<ContactModel>> getContacts() async {
    final contacts = await remoteDataSource.getContacts();
    await localDataSource.cacheContacts(contacts);
    return contacts;
  }

  Future<List<ContactModel>> getCachedContacts() async {
    return await localDataSource.getCachedContacts();
  }
}
