// lib/src/screens/experience_screen.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/experience.dart';
import 'package:user_profile/src/services/experience_service.dart';
import 'package:user_profile/src/widgets/experience_card.dart';

class ExperienceScreen extends StatefulWidget {
  final String userId;

  const ExperienceScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  List<Experience> userExperiences = [];
  final ExperienceService experienceService = ExperienceService();

  @override
  void initState() {
    super.initState();
    _loadUserExperiences();
  }

  Future<void> _loadUserExperiences() async {
    await experienceService.loadExperiences();
    setState(() {
      userExperiences = experienceService.getExperiencesByUserId(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Experience")),
      body: ListView.builder(
        itemCount: userExperiences.length,
        itemBuilder: (context, index) {
          return ExperienceCard(experience: userExperiences[index]);
        },
      ),
    );
  }
}
