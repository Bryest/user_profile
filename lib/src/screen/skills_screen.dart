// lib/src/screens/skills_screen.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/skill.dart';
import 'package:user_profile/src/services/skills_service.dart';
import 'package:user_profile/src/widgets/skills_card.dart';

class SkillsScreen extends StatefulWidget {
  final String userId;

  const SkillsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  List<Skill> userSkills = [];
  final SkillsService skillsService = SkillsService();

  @override
  void initState() {
    super.initState();
    _loadUserSkills();
  }

  Future<void> _loadUserSkills() async {
    await skillsService.loadSkills();
    setState(() {
      userSkills = skillsService.getSkillsByUserId(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Skills")),
      body: ListView.builder(
        itemCount: userSkills.length,
        itemBuilder: (context, index) {
          return SkillsCard(skill: userSkills[index]);
        },
      ),
    );
  }
}
