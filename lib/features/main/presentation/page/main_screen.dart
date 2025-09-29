import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreen(), bottomNavigationBar: navigationBar());
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.accentColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            AppAssets.home,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          icon: SvgPicture.asset(AppAssets.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.bookmark),
          label: 'wishlist',
          activeIcon: SvgPicture.asset(
            AppAssets.bookmark,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.cart),
          label: 'Cart',
          activeIcon: SvgPicture.asset(
            AppAssets.cart,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.profile),
          label: 'Profile',
          activeIcon: SvgPicture.asset(
            AppAssets.profile,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      currentIndex: currentindex,
      onTap: (value) {
        currentindex = value;
      },
    );
  }
}
