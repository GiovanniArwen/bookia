import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:flutter/material.dart';

class AppBarwithBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarwithBack({super.key, this.actions});
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          Pop(context);
        },
        child: Image.asset(AppAssets.back, width: 41, height: 41),
      ),
      actions: [actions ?? const SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
