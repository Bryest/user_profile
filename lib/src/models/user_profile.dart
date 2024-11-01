// lib/src/models/user_profile.dart

class UserProfile {
  final String userId;
  final String name;
  final String email;
  final String passwordHash;
  final String? location;
  final String? bio;
  final String? profileImageUrl;
  final Map<String, String>? socialLinks;

  UserProfile({
    required this.userId,
    required this.name,
    required this.email,
    required this.passwordHash,
    this.location,
    this.bio,
    this.profileImageUrl,
    this.socialLinks,
  });

  // Factory method to create UserProfile from JSON
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'] ?? '', // Fallback to empty string if null
      name: json['name'] ?? '', // Fallback to empty string if null
      email: json['email'] ?? '', // Fallback to empty string if null
      passwordHash:
          json['passwordHash'] ?? '', // Fallback to empty string if null
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      socialLinks: json['socialLinks'] != null
          ? Map<String, String>.from(json['socialLinks'])
          : null,
    );
  }
}
