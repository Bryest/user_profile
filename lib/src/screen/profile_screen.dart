// lib/src/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/project.dart';
import 'package:user_profile/src/models/user_profile.dart';
import 'package:user_profile/src/services/profile_service.dart';
import 'package:user_profile/src/services/skills_service.dart';
import 'package:user_profile/src/services/project_service.dart'; // Import ProjectService
import 'package:user_profile/src/widgets/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProfile? userProfile;
  List<String> topSkills = []; // Store top skills here
  List<Project> userProjects = []; // Store user's projects

  final ProfileService profileService = ProfileService();
  final SkillsService skillsService = SkillsService();
  final ProjectsService projectsService =
      ProjectsService(); // Instance of ProjectsService

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _loadTopSkills();
    _loadUserProjects(); // Load projects here
  }

  Future<void> _loadUserProfile() async {
    await profileService.loadProfiles();
    setState(() {
      userProfile = profileService.getProfileById(widget.userId);
    });
  }

  Future<void> _loadTopSkills() async {
    await skillsService.loadSkills();
    final skills = skillsService.getSkillsByUserId(widget.userId);

    skills.sort((a, b) => b.endorsements.compareTo(a.endorsements));
    setState(() {
      topSkills = skills.take(3).map((skill) => skill.skill).toList();
    });
  }

  Future<void> _loadUserProjects() async {
    await projectsService.loadProjects();
    setState(() {
      userProjects = projectsService.getProjectsByUserId(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Professional Summary")),
      body: Column(
        children: [
          Expanded(
            child: userProfile != null
                ? ProfileCard(
                    profile: userProfile!,
                    topSkills: topSkills,
                    // projects: userProjects, // Pass projects here
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/skills');
                  },
                  child: const Text("Skills"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/experience');
                  },
                  child: const Text("Experience"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/projects');
                  },
                  child: const Text("Projects"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
