import 'package:bookly/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_image_item.dart';
import 'package:bookly/features/home/presentation/widgets/similar_books_horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
import 'book_action_two_button.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              CustomBookDetailsAppBar(),
              Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: CustomBookImageItem(),
              ),
              Gap(20),
              Text('Solo Leveling Anime ', style: Styles.textStyle30),
              Gap(5),
              Text(
                'Abanoub Habib ',
                style: Styles.textStyle18.copyWith(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(10),
              BookRating(mainAxisAlignment: MainAxisAlignment.center),
              Gap(45),
              BookAction(),
              Expanded(child: Gap(40)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(30.h),
              SimilarBooksListView(),
              Gap(41.h),
            ],
          ),
        ),
      ],
    );
  }
}
