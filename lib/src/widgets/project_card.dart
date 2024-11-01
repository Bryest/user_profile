// lib/src/widgets/project_card.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String? projectUrl;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    this.projectUrl,
  }) : super(key: key);

  Future<void> _launchURL(BuildContext context) async {
    if (projectUrl != null) {
      final Uri uri = Uri.parse(projectUrl!);
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $projectUrl';
        }
      } catch (e) {
        print("Error launching URL: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cannot open link: $projectUrl")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _launchURL(context), // Pass context here
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: projectUrl != null ? Colors.blue : Colors.black,
                      decoration:
                          projectUrl != null ? TextDecoration.underline : null,
                    ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
