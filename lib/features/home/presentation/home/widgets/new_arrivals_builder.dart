import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/book_list_response/product.dart';
import 'package:bookia/features/home/presentation/home/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewArrivalsBuilder extends StatelessWidget {
  const NewArrivalsBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Arrivals', style: TextStyles.size26()),
            TextButton(
              onPressed: () {},
              child: Text('See All', style: TextStyles.size16()),
            ),
          ],
        ),
        Gap(15),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BookCard(product: products[index],source: 'new',);
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
