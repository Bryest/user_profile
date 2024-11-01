// lib/src/services/projects_service.dart
import 'package:user_profile/src/models/project.dart';
import 'json_loader.dart';

class ProjectsService {
  final String _projectsPath = 'assets/data/projects.json';
  List<UserProjects> _userProjects = [];

  Future<void> loadProjects() async {
    final List<dynamic> projectsJson =
        await JsonLoader.loadJsonArray(_projectsPath);
    _userProjects =
        projectsJson.map((json) => UserProjects.fromJson(json)).toList();
  }

  List<Project> getProjectsByUserId(String userId) {
    return _userProjects
        .firstWhere(
          (userProjects) => userProjects.userId == userId,
          orElse: () => UserProjects(userId: userId, projects: []),
        )
        .projects;
  }
}
