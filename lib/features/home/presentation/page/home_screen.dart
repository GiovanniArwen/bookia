import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/home/presentation/widgets/all_books_builder.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/features/home/presentation/widgets/new_arrivals_builder.dart';
import 'package:bookia/features/home/presentation/widgets/slider.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(), //method mn goa
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AppAssets.logo, height: 30),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.search, height: 30),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is HomeLoading || state is HomeError) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    HomeSlider(),
                    Gap(20),
                    BestSellerBuilder(products: cubit.bestSellers),
                    Gap(20),
                    NewArrivalsBuilder(products: cubit.newArrivals),
                    Gap(20),
                    AllBooksBuilder(products: cubit.allbooks),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
