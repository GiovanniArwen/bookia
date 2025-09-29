import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/services/local/local_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      LocalHelper.getUserData().then((value) {
        if (value != null) {
          if (!mounted) return;
          pushWithRelacement(context, Routes.main);
        } else {
          if (!mounted) return;

           pushWithRelacement(context, Routes.welcome);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logo),
            Gap(10),
            Text(
              "Order Your Book Now!",
              style: TextStyles.size16(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
