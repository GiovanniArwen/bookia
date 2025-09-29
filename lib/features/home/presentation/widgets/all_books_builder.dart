import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllBooksBuilder extends StatelessWidget {
  const AllBooksBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('All Books', style: TextStyles.size26()),
            TextButton(
              onPressed: () {},
              child: Text('See All', style: TextStyles.size16()),
            ),
          ],
        ),
        Gap(15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return BookCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
