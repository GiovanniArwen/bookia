import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.iconPath, required this.onTap});
  final String iconPath;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: SvgPicture.asset(iconPath)),
      ),
    );
  }
}
