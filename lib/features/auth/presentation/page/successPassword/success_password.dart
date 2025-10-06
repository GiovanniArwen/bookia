import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.Successmark),
            Gap(35),
            Text('Password Changed!', style: TextStyles.size30()),
            Gap(3),
            Text(
              textAlign: TextAlign.center,
              'Your password has been changed\n successfully.',
              style: TextStyles.size16(color: AppColors.greyColor),
            ),
            Gap(40),
            MainButton(
              text: 'Back to Login',
              fontsize: 12,
              onPressed: () {
                PushAndRemoveUntil(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
