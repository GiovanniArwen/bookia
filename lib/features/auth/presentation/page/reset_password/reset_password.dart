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

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.otp});
  final String otp;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passController = TextEditingController();
  final ConfirmController = TextEditingController();
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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create new password', style: TextStyles.size30()),
              Gap(10),
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyles.size16(color: AppColors.greyColor),
              ),
              Gap(30),
              Customtextfield(
                isPassword: true,
                controller: passController,
                hintText: 'New Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new password';
                  }
                  return null;
                },
              ),
              Gap(15),
              Customtextfield(
                controller: ConfirmController,
                hintText: 'Confirm Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your confirm password';
                  }
                  return null;
                },
              ),
              Gap(38),
              MainButton(
                text: 'Reset Password',
                fontsize: 12,
                onPressed: () async {
                  final pass = passController.text.trim();
                  final confirm = ConfirmController.text.trim();
                  final otpcode = widget.otp;
                  if (pass.isEmpty || confirm.isEmpty) {
                    showerror(context, "Please enter password");
                    return;
                  }
                  if (pass != confirm) {
                    showerror(context, "Passwords do not match");
                    return;
                  }
                  final success = await Authrepo.resetPassword(
                    otpcode,
                    pass,
                    confirm,
                  );
                  if (success) {
                    context.pushReplacement(Routes.successPassword);
                  } else {
                    showerror(context, "Failed to reset password");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
