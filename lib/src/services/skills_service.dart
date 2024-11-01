// lib/src/services/skills_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/skill.dart';
import '../models/user_skills.dart';

class SkillsService {
  final String _skillsPath = 'assets/data/skills.json';
  List<UserSkills> _userSkills = [];

  Future<void> loadSkills() async {
    final String jsonString = await rootBundle.loadString(_skillsPath);
    final List<dynamic> skillsJson = json.decode(jsonString);
    _userSkills = skillsJson.map((json) => UserSkills.fromJson(json)).toList();
  }

  List<Skill> getSkillsByUserId(String userId) {
    final userSkills = _userSkills.firstWhere(
      (userSkills) => userSkills.userId == userId,
      orElse: () => UserSkills(userId: userId, skills: []),
    );
    return userSkills.skills;
  }
}
