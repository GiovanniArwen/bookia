import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            right: 22,
            left: 22,
            top: 0,
            bottom: 80,
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset(AppAssets.logo, width: 250),
                Gap(10),
                Text("Order Your Book Now!", style: TextStyles.size16()),
                Spacer(flex: 2),
                MainButton(
                  text: 'Login',
                  fontsize: 14,
                  onPressed: () {
                    PushTo(context, Routes.login);
                  },
                  bgColor: AppColors.primaryColor,
                  fgColor: AppColors.whiteColor,
                ),
                Gap(10),
                MainButton(
                  text: 'Sign Up',
                  fontsize: 14,
                  onPressed: () {
                    PushTo(context, Routes.register);
                  },
                  bgColor: AppColors.whiteColor,
                  fgColor: AppColors.darkColor,
                  borderColor: AppColors.darkColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
