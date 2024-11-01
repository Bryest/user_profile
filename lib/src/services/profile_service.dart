// lib/src/services/profile_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:user_profile/src/models/user_profile.dart';

class ProfileService {
  final String _profilePath = 'assets/data/profiles.json';
  List<UserProfile> _profiles = [];

  Future<void> loadProfiles() async {
    try {
      final String jsonString = await rootBundle.loadString(_profilePath);
      final List<dynamic> profileJson = json.decode(jsonString);
      _profiles =
          profileJson.map((json) => UserProfile.fromJson(json)).toList();
      print("Profiles loaded: ${_profiles.length}");
    } catch (e) {
      print("Error loading profiles: $e");
    }
  }

  UserProfile? getFirstUser() {
    return _profiles.isNotEmpty ? _profiles.first : null;
  }

  // Add getProfileById method
  UserProfile? getProfileById(String userId) {
    try {
      return _profiles.firstWhere((profile) => profile.userId == userId);
    } catch (e) {
      print("Profile with userId $userId not found");
      return null;
    }
  }
}
