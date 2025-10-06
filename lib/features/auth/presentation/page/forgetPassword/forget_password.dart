import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/customTextFIeld.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/show_dialoug.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/data/repo/authRepo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Pop(context);
          },
          child: Image.asset(AppAssets.back, width: 41, height: 41),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forget Password?', style: TextStyles.size30()),
                  Gap(10),
                  Text(
                    'Don\'t worry! It occurs. Please enter the email address linked with your account',
                    style: TextStyles.size16(color: AppColors.greyColor),
                  ),
                  Gap(30),
                  Customtextfield(
                    controller: emailController,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  Gap(30),
                  MainButton(
                    text: 'Send Code',
                    fontsize: 12,

                    onPressed: () async {
                      final email = emailController.text;
                      final success = await Authrepo.sendOtp(email);
                      if (success) {
                        context.push(Routes.otp, extra: email);
                      } else {
                        showMyDialog(context, 'Failed to send OTP');
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Remember Password? ", style: TextStyles.size16()),
                TextButton(
                  onPressed: () {
                    pushWithRelacement(context, Routes.login);
                  },
                  child: Text(
                    'Login',
                    style: TextStyles.size16(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
