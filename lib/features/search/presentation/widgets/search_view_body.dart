import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/search/presentation/controller/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/widgets/search_result_vertical_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
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
        const CustomSearchTextField(),
        const SizedBox(height: 16),
        Text(
          'Search Results',
          style: Styles.textStyle30.copyWith(
            fontSize: 18,
            color: const Color(0xffEF8262),
            fontWeight: FontWeight.w600, // سمك متوسط
            letterSpacing: 1.2,
          ),
        ),
        const Gap(16),
        Expanded(
          child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              if (state is SearchBooksSuccess) {
                return SearchResultVerticalListView(books: state.books);
              } else if (state is SearchBooksFailure) {
                return CustomErrorWidget(
                  errMessage: state.errMessage,
                  onPressed: () {},
                );
              } else if (state is SearchBooksLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Text(
                    'Start searching for books !',
                    style: Styles.textStyle18,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
