import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'package:gap/gap.dart';

import 'featured_book_horizontal_list_view.dart';
import 'featured_book_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Gap(20),
        FeaturedBookHorizontalListView(),
        Gap(30),
        Text('Best Seller', style: Styles.textStyle20),
        Gap(20),
        BestSellerListViewItem(),
      ],
    );
  }
}


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 150,
      child: Row(
        children: [
        AspectRatio(
        //width:height
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(AssetsData.soloLevelingImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      )
        ],
      ),
    );
  }
}

