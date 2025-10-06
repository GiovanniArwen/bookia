import 'package:bookia/core/constants/appImages.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { error, success, warning }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? Colors.red
          : type == DialogType.warning
          ? Colors.orange
          : AppColors.primaryColor,
      content: Text(message),
    ),
  );
}

showSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.green, content: Text(message)),
  );
}

showloading(BuildContext context) {
  showDialog(
    context: context,

    builder: (context) =>
        Center(child: Row(children: [Lottie.asset(Appimages.loadingbook)])),
  );
}
