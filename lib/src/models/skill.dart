// lib/src/models/skill.dart

class Skill {
  final String skill;
  final String proficiency;
  final int endorsements;

  Skill({
    required this.skill,
    required this.proficiency,
    required this.endorsements,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skill: json['skill'] as String,
      proficiency: json['proficiency'] as String,
      endorsements: json['endorsements'] as int,
    );
  }
}
