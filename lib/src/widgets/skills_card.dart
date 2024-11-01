// lib/src/widgets/skills_card.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/skill.dart';

class SkillsCard extends StatelessWidget {
  final Skill skill;

  const SkillsCard({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(skill.skill),
        subtitle: Text(
            "Proficiency: ${skill.proficiency} | Endorsements: ${skill.endorsements}"),
      ),
    );
  }
}
