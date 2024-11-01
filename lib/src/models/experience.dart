// lib/src/models/experience.dart

class Experience {
  final String title;
  final String company;
  final String location;
  final String startDate;
  final String endDate;
  final String description;

  Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  // Factory method to create Experience from JSON
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      company: json['company'],
      location: json['location'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
    );
  }
}

class UserExperiences {
  final String userId;
  final List<Experience> experiences;

  UserExperiences({
    required this.userId,
    required this.experiences,
  });

  // Factory method to create UserExperiences from JSON
  factory UserExperiences.fromJson(Map<String, dynamic> json) {
    return UserExperiences(
      userId: json['userId'],
      experiences: (json['experiences'] as List)
          .map((expJson) => Experience.fromJson(expJson))
          .toList(),
    );
  }
}
