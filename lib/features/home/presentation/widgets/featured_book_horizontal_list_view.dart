import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/books_shimmer_loading.dart';
import 'custom_book_image_item.dart';

class FeaturedBookHorizontalListView extends StatelessWidget {
  const FeaturedBookHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          //print(state.books[0].imageUrl);
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .23,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDetails, extra: state.books[index]);
                      },
                      child: CustomBookImageItem(
                        imageUrl: state.books[index].imageUrl,
                      )),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
              errMessage: state.errMessage, onPressed: () {
                // بنادي على الميثود اللي بتجيب الداتا تاني
                BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
          });
        } else {
          return BooksShimmerLoading(type: ShimmerType.featured);
        }
      },
    );
  }
}
