import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import '../controller/featured_books_cubit/featured_books_cubit.dart';
import '../controller/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_vertical_list_view.dart';
import 'custom_app_bar.dart';
import 'package:gap/gap.dart';
import 'featured_book_horizontal_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: const Color(0xffEF8262),
      strokeWidth: 3,
      displacement: 50,
      onRefresh: () async{
        // بنادي على 2الميثود اللي بتجيب الداتا تاني
        BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                Gap(20),
                FeaturedBookHorizontalListView(),
                Gap(30),
                Text('Newest Books ', style: Styles.textStyle20),
                Gap(10),
              ],
            ),
          ),
          NewestBooksVerticalListView(),
        ],
      ),
    );
  }
}
