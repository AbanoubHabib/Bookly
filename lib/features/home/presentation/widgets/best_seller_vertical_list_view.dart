import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerVerticalListView extends StatelessWidget {
  const BestSellerVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    //! Don't use Expanded because it will scroll using CustomScrollView
    return ListView.builder(
      padding: EdgeInsets.zero,
      //? take the height of the children
      // shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
