import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  final Map<Permission, PermissionStatus> permissionStatuses = await [
    if (!kIsWeb) Permission.camera,
    if (!kIsWeb) Permission.location,
    if (!kIsWeb) Permission.contacts,
    if (!kIsWeb) Permission.notification
  ].request();

  // Process the permission statuses and handle accordingly
  permissionStatuses.forEach((permission, status) {
    if (status.isGranted) {
      // Permission is granted, take appropriate action
      switch (permission) {
        case Permission.camera:
          // Camera permission granted, enable camera functionality
          break;
        case Permission.location:
          // Location permission granted, access user's location
          break;
        case Permission.contacts:
          // Contacts permission granted, access user's contacts
          break;
        case Permission.notification:
          // Notification permission granted, access user's notifications
          break;
      }
    } else if (status.isDenied) {
      // Permission is denied, show a message or disable related features
      switch (permission) {
        case Permission.camera:
          // Camera permission denied, inform the user or disable camera functionality
          break;
        case Permission.location:
          // Location permission denied, inform the user or disable location-based features
          break;
        case Permission.contacts:
          // Contacts permission denied, inform the user or disable contacts-related features
          break;
        case Permission.notification:
          // Notification permission denied, inform the user or disable notification-related features
          break;
      }
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, show a dialog or redirect user to app settings
      // to enable the permission manually
      switch (permission) {
        case Permission.camera:
          // Camera permission permanently denied, show a dialog or redirect to app settings
          break;
        case Permission.location:
          // Location permission permanently denied, show a dialog or redirect to app settings
          break;
        case Permission.contacts:
          // Contacts permission permanently denied, show a dialog or redirect to app settings
          break;
        case Permission.notification:
          // Notification permission permanently denied, show a dialog or redirect to app settings
          break;
      }
    }
  });
}
