import 'package:user_profile/src/models/user_profile.dart';
import 'json_loader.dart';

class AuthenticationService {
  final String _authPath = 'assets/data/authentication.json';
  List<UserProfile> _users = [];

  Future<void> loadUsers() async {
    final List<dynamic> authJson = await JsonLoader.loadJsonArray(_authPath);
    _users = authJson.map((json) => UserProfile.fromJson(json)).toList();
  }

  UserProfile? login(String email, String passwordHash) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.passwordHash == passwordHash,
      );
    } catch (e) {
      return null;
    }
  }
}
