import 'package:flutter/material.dart';

import 'featured_book_list_view_item.dart';

class FeaturedBookHorizontalListView extends StatelessWidget {
  const FeaturedBookHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .23,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding:  EdgeInsets.only(right: 14),
            child: FeaturedBookListViewItem(),
          );
        },
      ),
    );
  }
}
