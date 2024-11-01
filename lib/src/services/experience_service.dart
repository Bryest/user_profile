import 'package:user_profile/src/models/experience.dart';
import 'json_loader.dart';

class ExperienceService {
  final String _experiencePath = 'assets/data/experience.json';
  List<UserExperiences> _userExperiences = [];

  Future<void> loadExperiences() async {
    final List<dynamic> experienceJson =
        await JsonLoader.loadJsonArray(_experiencePath);
    _userExperiences =
        experienceJson.map((json) => UserExperiences.fromJson(json)).toList();
  }

  List<Experience> getExperiencesByUserId(String userId) {
    return _userExperiences
        .firstWhere(
          (userExperiences) => userExperiences.userId == userId,
          orElse: () => UserExperiences(userId: userId, experiences: []),
        )
        .experiences;
  }
}
