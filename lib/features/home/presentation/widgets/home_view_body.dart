import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'package:gap/gap.dart';

import 'featured_book_horizontal_list_view.dart';
import 'featured_book_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar(), Gap(20), FeaturedBookHorizontalListView()],
    );
  }
}
