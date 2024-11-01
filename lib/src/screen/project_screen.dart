// lib/src/screens/project_screen.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/project.dart';
import 'package:user_profile/src/services/project_service.dart';
import 'package:user_profile/src/widgets/profile_card.dart';
import 'package:user_profile/src/widgets/project_card.dart';

class ProjectScreen extends StatefulWidget {
  final String userId;

  const ProjectScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  List<Project> userProjects = [];
  final ProjectsService projectsService = ProjectsService();

  @override
  void initState() {
    super.initState();
    _loadUserProjects();
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
      appBar: AppBar(title: const Text("User Projects")),
      body: ListView.builder(
        itemCount: userProjects.length,
        itemBuilder: (context, index) {
          final project = userProjects[index];
          return ProjectCard(
            title: project.title,
            description: project.description,
            projectUrl: project.projectUrl, // Pass the project URL here
          );
        },
      ),
    );
  }
}
