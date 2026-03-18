import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/styles.dart';
import '../../data/model/book_model/book_model.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetails, extra: bookModel);
      },
      child: Card(
        // استخدام لون الـ Surface اللي إنت حددته في الثيم أوتوماتيك
        color: Theme.of(context).colorScheme.surface,
        elevation: 0.5, // ظل خفيف جداً عشان ميبقاش شكلها قديم
        // margin: const EdgeInsets.symmetric(vertical: 3), // مسافة بين الكروت
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          // حدود خفيفة جداً بتبان شيك في الـ Light Mode
          side: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          ),
        ),
        child: SizedBox(
          height: 135.h, // قللنا الارتفاع شوية عشان الـ Padding الخارجي
          child: Row(
            children: [
              CustomBookImage(
                imageUrl: bookModel.imageUrl,
                borderRadius: BorderRadius.circular(12),
              ),
              Gap(20.w), // قللت الـ Gap شوية عشان الكارت ميبقاش عريض أوي
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(3.h),
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Text(
                        bookModel.title,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16.copyWith(
                          fontFamily: kGTSectraFine,
                          // اللون هيتغير أوتوماتيك بناءً على الثيم
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      bookModel.author ?? 'Unknown',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(
                              0xffEF8262,
                            ), // لون Bookly البرتقالي
                          ),
                        ),
                        const Spacer(),
                        bookModel.rating > 0
                            ? BookRating(
                                rating: bookModel.rating,
                                count: bookModel.ratingCount,
                              )
                            : Text(
                                'No ratings',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.4),
                                ),
                              ),
                        const Gap(7),
                      ],
                    ),
                    Gap(3.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
