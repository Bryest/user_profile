// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_profile/src/screen/experience_card.dart';
import 'package:user_profile/src/screen/profile_screen.dart';
import 'package:user_profile/src/screen/project_screen.dart';
import 'package:user_profile/src/screen/skills_screen.dart';
import 'package:user_profile/src/models/user_profile.dart';
import 'package:user_profile/src/services/profile_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final profileService = ProfileService();
  await profileService.loadProfiles();
  final UserProfile? firstUser = profileService.getFirstUser();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp(initialUser: firstUser));
  });
}

class MyApp extends StatelessWidget {
  final UserProfile? initialUser;

  const MyApp({Key? key, required this.initialUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking App for Programmers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: initialUser != null
          ? ProfileScreen(userId: initialUser!.userId)
          : Scaffold(
              body: Center(
                child: Text("No user found"),
              ),
            ),
      routes: {
        '/skills': (context) => SkillsScreen(userId: initialUser!.userId),
        '/experience': (context) =>
            ExperienceScreen(userId: initialUser!.userId),
        '/projects': (context) => ProjectScreen(userId: initialUser!.userId),
      },
    );
  }
}
