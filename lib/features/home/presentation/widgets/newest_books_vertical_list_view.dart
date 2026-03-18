import 'package:bookly/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/books_shimmer_loading.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'book_list_view_item.dart';

class NewestBooksVerticalListView extends StatelessWidget {
  const NewestBooksVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    //! Don't use Expanded because it will scroll using CustomScrollView
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errMessage: state.errMessage,
              onPressed: () {
                // بنادي على الميثود اللي بتجيب الداتا تاني
                BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
              },
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: BooksShimmerLoading(type: ShimmerType.newest),
          );
        }
      },
    );
  }
}
