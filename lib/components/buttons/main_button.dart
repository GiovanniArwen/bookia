import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,

    required this.text,
    this.fontsize,
    this.width = double.infinity,
    this.height = 56,
    required this.onPressed,
    this.bgColor,
    this.fgColor,
    this.borderColor,
    this.borderRadius = 10,
  });
  final String text;
  final double width;
  final double height;
  final double? fontsize;
  final Color? bgColor;
  final Color? fgColor;
  final Color? borderColor;
  final Function() onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.size16(
            color: fgColor ?? AppColors.whiteColor,
            fontSize: fontsize ?? 14,
          ),
        ),
      ),
    );
  }
}
