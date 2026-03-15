import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/widgets/book_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(15.h),
        CustomSearchTextField(),
        Gap(15.h),
        Text('Search Results', style: Styles.textStyle20.copyWith(
          fontWeight: FontWeight.bold,
        )),
        Gap(5),
        Expanded(child: SearchResultVerticalListView()),
      ],
    );
  }
}

class SearchResultVerticalListView extends StatelessWidget {
  const SearchResultVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
