import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    SnackBarStatus status = SnackBarStatus.info,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            _getIconForStatus(status),
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      backgroundColor: _getColorForStatus(status),
      duration: duration,
      action: actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: Colors.white,
              onPressed: onActionPressed ?? () {},
            )
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static IconData _getIconForStatus(SnackBarStatus status) {
    switch (status) {
      case SnackBarStatus.success:
        return Icons.check_circle;
      case SnackBarStatus.error:
        return Icons.error;
      case SnackBarStatus.warning:
        return Icons.warning;
      case SnackBarStatus.info:
      default:
        return Icons.info;
    }
  }

  static Color _getColorForStatus(SnackBarStatus status) {
    switch (status) {
      case SnackBarStatus.success:
        return Colors.green;
      case SnackBarStatus.error:
        return Colors.red;
      case SnackBarStatus.warning:
        return Colors.amber;
      case SnackBarStatus.info:
      default:
        return Colors.blue;
    }
  }
}

enum SnackBarStatus { success, error, warning, info }
