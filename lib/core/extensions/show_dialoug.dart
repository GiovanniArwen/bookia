import 'package:bookia/core/constants/appImages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showerror(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.redAccent, content: Text(message)),
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
