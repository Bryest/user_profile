// lib/src/models/user_skills.dart

import 'skill.dart';

class UserSkills {
  final String userId;
  final List<Skill> skills;

  UserSkills({
    required this.userId,
    required this.skills,
  });

  factory UserSkills.fromJson(Map<String, dynamic> json) {
    return UserSkills(
      userId: json['userId'] as String,
      skills: (json['skills'] as List)
          .map((skillJson) => Skill.fromJson(skillJson))
          .toList(),
    );
  }
}
