import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/show_dialoug.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/data/repo/authRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Otp extends StatefulWidget {
  Otp({super.key, required this.email});
  final String email;
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String otpcode = "";

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
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OTP Verification', style: TextStyles.size30()),
                  Gap(10),
                  Text(
                    'Enter the verification code we just sent on your email address.',
                    style: TextStyles.size16(color: AppColors.greyColor),
                  ),
                  Gap(32),
                  OtpTextField(
                    keyboardType: TextInputType.number,
                    numberOfFields: 6,
                    decoration: InputDecoration(),
                    fieldWidth: 50,
                    borderColor: AppColors.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      setState(() {
                        otpcode = verificationCode;
                      });
                    },
                    // end onSubmit
                  ),
                  Gap(38),
                  MainButton(
                    text: 'Verify',
                    fontsize: 12,
                    onPressed: () async {
                      if (otpcode.isEmpty) {
                        showMyDialog(context, "Please enter OTP code");
                        return;
                      }
                      final isvalid = await Authrepo.verifyOtp(
                        widget.email,
                        otpcode,
                      );
                      if (isvalid) {
                        context.push(Routes.resetPassword, extra: otpcode);
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
                Text("Didn’t received code?", style: TextStyles.size16()),
                TextButton(
                  onPressed: () {
                    //  pushWithRelacement(context, Routes.login);
                  },
                  child: Text(
                    ' Resend',
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
