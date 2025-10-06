import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.image ?? '',
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          ),
          Gap(15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? '',
                            style: TextStyles.size16(fontSize: 18),
                          ),
                          Gap(5),
                          Text(
                            '\$${product.price}',
                            style: TextStyles.size16(),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                      text: "Add to cart",
                      onPressed: () {},
                      height: 40,
                      borderRadius: 4,
                      width: 200,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
