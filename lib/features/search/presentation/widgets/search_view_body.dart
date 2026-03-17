import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/books_shimmer_loading.dart';
import '../../../../core/widgets/custom_error_widget.dart';
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
        Text(
          'Search Results',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
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
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {

        if (state is NewestBooksSuccess) {
          return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BookListViewItem(
                          bookModel: state.books[index],
                        ),
                      );
                    },
                  );
        }else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage, onPressed: () {});
        } else {
          return BooksShimmerLoading(type:  ShimmerType.newest);
        }
      },
    );
  }
}
