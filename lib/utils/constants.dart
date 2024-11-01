// lib/utils/constants.dart

import 'package:flutter/material.dart';

/// Color constants used throughout the app
class AppColors {
  static const Color primaryColor = Color(0xFF6200EE); // Example primary color
  static const Color accentColor = Color(0xFF03DAC5); // Example accent color
  static const Color backgroundColor = Color(0xFFF6F6F6); // Background color
  static const Color textColor = Color(0xFF333333); // Text color
}

class AppIconColors {
  static const Color github = Color(0xFF333333);
  static const Color linkedin = Color(0xFF0A66C2);
  static const Color stackoverflow = Color(0xFFFFA500);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color devto = Color(0xFF0A0A0A);
  static const Color behance = Color(0xFF1769FF);
  static const Color defaultIcon = Color(0xFF888888);

  // Function to get the icon color based on the platform
  static Color getIconColor(String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return github;
      case 'linkedin':
        return linkedin;
      case 'stackoverflow':
        return stackoverflow;
      case 'twitter':
        return twitter;
      case 'devto':
        return devto;
      case 'behance':
        return behance;
      default:
        return defaultIcon;
    }
  }
}

/// Padding and spacing constants
class AppSpacing {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double cardElevation = 4.0;
}

/// URL constants for external resources
class AppUrls {
  static const String profileImagePlaceholder =
      'https://example.com/default-profile-image.png';
  static const String apiBaseUrl =
      'https://api.example.com/'; // Example base URL for APIs
}

/// Text styles used across the app
class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle subheadline = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14.0,
    color: AppColors.textColor,
  );
}
