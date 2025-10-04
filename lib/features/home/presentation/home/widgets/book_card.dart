import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product, required this.source});

  final Product product;
  final String source;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Product ID: ${product.id}");
        PushTo(
          context,
          Routes.bookDetails,
          extra: {'product': product, 'source': source},
        );
      },
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: product.key ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? '',
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
              ),
            ),
            Gap(5),
            SizedBox(
              height: 42,

              child: Text(
                textAlign: TextAlign.center,
                product.name ?? '',
                style: TextStyles.size16(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price}', style: TextStyles.size16()),
                MainButton(
                  text: 'Buy',
                  onPressed: () {},
                  height: 30,
                  width: 70,
                  bgColor: AppColors.darkColor,
                  borderRadius: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
