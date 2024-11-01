// lib/src/widgets/experience_card.dart

import 'package:flutter/material.dart';
import 'package:user_profile/src/models/experience.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({Key? key, required this.experience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(experience.title,
                style: Theme.of(context).textTheme.headlineMedium),
            Text('${experience.company} - ${experience.location}',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 8),
            Text('${experience.startDate} - ${experience.endDate}'),
            const SizedBox(height: 8),
            Text(experience.description),
          ],
        ),
      ),
    );
  }
}
