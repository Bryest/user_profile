import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_profile/src/models/user_profile.dart';
import 'package:user_profile/utils/constants.dart';
import 'package:user_profile/utils/social_icon_map.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;
  final List<String> topSkills;

  const ProfileCard({
    Key? key,
    required this.profile,
    required this.topSkills,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: profile.profileImageUrl != null
                  ? NetworkImage(profile.profileImageUrl!)
                  : const AssetImage('assets/images/placeholder.png')
                      as ImageProvider,
              radius: 50,
            ),
            const SizedBox(height: 16),
            Text(
              profile.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              profile.location ?? 'Unknown location',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 16),
            Text(
              profile.bio ?? 'No bio available',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Top Skills',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: topSkills.map((skill) {
                return ElevatedButton(
                  onPressed: () {},
                  child: Text(skill),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Social Links',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (profile.socialLinks ?? {}).entries.map((entry) {
                final iconData = socialIcons[entry.key.toLowerCase()] ??
                    FontAwesomeIcons.link;
                final color = AppIconColors.getIconColor(
                    entry.key); // Get color for the icon
                return IconButton(
                  icon: FaIcon(iconData, color: color), // Apply color
                  onPressed: () => _launchURL(entry.value),
                  tooltip: entry.key,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
