import 'package:easy_localization/easy_localization.dart'; // For localization
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // For permission handling

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImage(
      {required BuildContext context, required ImageSource source}) async {
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus == PermissionStatus.granted) {
      final XFile? image = await _picker.pickMedia();
      return image;
    } else {
      _showPermissionDeniedSnackBar(context, permissionStatus);
    }

    return null;
  }

  static Future<XFile?> pickVideo(
      {required BuildContext context, required ImageSource source}) async {
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus == PermissionStatus.granted) {
      final XFile? video = await _picker.pickVideo(source: source);
      return video;
    } else {
      _showPermissionDeniedSnackBar(context, permissionStatus);
    }

    return null;
  }

  static Future<List<XFile>?> pickMultiImage(
      {required BuildContext context}) async {
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus == PermissionStatus.granted) {
      final List<XFile> images = await _picker.pickMultiImage(
          imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
      return images;
    } else {
      _showPermissionDeniedSnackBar(context, permissionStatus);
    }

    return null;
  }

  // Method to show SnackBar when permission is denied or permanently denied
  static void _showPermissionDeniedSnackBar(
      BuildContext context, PermissionStatus status) {
    if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text('Permission denied. Please enable it in the app settings.'),
        backgroundColor: Colors.orange,
        action: SnackBarAction(
          label: 'settings'.tr(),
          onPressed: () {
            openAppSettings();
          },
        ),
      ));
    }
  }
}
