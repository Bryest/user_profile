class Project {
  final String projectId;
  final String title;
  final String description;
  final List<String> technologies;
  final String? projectUrl; // Make projectUrl nullable

  Project({
    required this.projectId,
    required this.title,
    required this.description,
    required this.technologies,
    this.projectUrl, // Optional
  });

  // Factory method to create Project from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      technologies: List<String>.from(json['technologies']),
      projectUrl: json['projectUrl'] as String?, // Nullable projectUrl
    );
  }
}

class UserProjects {
  final String userId;
  final List<Project> projects;

  UserProjects({
    required this.userId,
    required this.projects,
  });

  // Factory method to create UserProjects from JSON
  factory UserProjects.fromJson(Map<String, dynamic> json) {
    return UserProjects(
      userId: json['userId'],
      projects: (json['projects'] as List)
          .map((projJson) => Project.fromJson(projJson))
          .toList(),
    );
  }
}
