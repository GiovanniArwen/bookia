import 'package:bookia/components/app_bar/app_barwith_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extensions/show_dialoug.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product, required this.source});
  final Product product;
  final String source;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit,HomeState>(
      listener: (context, state) {
        if (state is AddToWishlistSuccessState) {
          showMyDialog(context, 'Added to wishlist', type: DialogType.success);
        } else if (state is HomeError) {
          Pop(context,);
          showMyDialog(context, state.message);
        } else if (state is HomeLoading) {
          showloading(context);
        }
      },
      child: Scaffold(
        appBar: AppBarwithBack(
          actions: IconButton(
            onPressed: () {
           //       print("Saved token: ${LocalHelper.pref.getString('token')}");
              context.read<HomeCubit>().addToWishlist(product.id ?? 0);
              // cubit.addRemoveToWishlist(product.id ?? 0);
            },
            icon: SvgPicture.asset(
              AppAssets.bookmark,
              colorFilter: ColorFilter.mode(
                //    cubit.isWishlist(product.id ?? 0)
                AppColors.primaryColor,
                //   : AppColors.darkColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Hero(
                    tag: product.key ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: product.image ?? '',
                        height: 280,
                      ),
                    ),
                  ),
                  Gap(20),

                  Text(
                    product.name ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyles.size16(),
                  ),
                  Gap(10),
                  Text(
                    product.category ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyles.size16(color: AppColors.primaryColor),
                  ),
                  Gap(20),
                  Text(
                    product.description ?? '',
                    textAlign: TextAlign.justify,
                    style: TextStyles.size16(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyles.size26(fontSize: 24),
                ),

                Gap(40),
                Expanded(
                  child: MainButton(
                    height: 55,
                    borderRadius: 8,
                    bgColor: AppColors.darkColor,
                    text: 'Add to Cart',
                    onPressed: () {
                      //  cubit.addToCart(product.id ?? 0);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //  },
    // );
    //  var cubit = context.read<HomeCubit>();
  }
}
