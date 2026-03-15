import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'best_seller_vertical_list_view.dart';
import 'custom_app_bar.dart';
import 'package:gap/gap.dart';

import 'featured_book_horizontal_list_view.dart';
import 'custom_book_image_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Gap(20),
              FeaturedBookHorizontalListView(),
              Gap(30),
              Text('Best Seller', style: Styles.textStyle20),
              Gap(10),
            ],
          ),
        ),
        SliverFillRemaining(child: BestSellerVerticalListView()),
      ],
    );
  }
}

