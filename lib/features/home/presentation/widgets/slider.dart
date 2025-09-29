import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [buildSlider(), Gap(14), buildIndicator()]);
  }

  CarouselSlider buildSlider() {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          AppAssets.background,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      options: CarouselOptions(
        height: 150,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  SmoothPageIndicator buildIndicator() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: _currentIndex),
      count: 3,
      effect: ExpandingDotsEffect(
        dotColor: AppColors.accentColor,
        dotHeight: 7,
        dotWidth: 7,
        activeDotColor: AppColors.primaryColor,
        expansionFactor: 5,
      ),
      onDotClicked: (index) {},
    );
  }
}
