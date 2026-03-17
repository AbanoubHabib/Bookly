
import 'package:cached_network_image/cached_network_image.dart'; // تأكد من الاستيراد
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

  final BookModel bookModel; // إضافة الموديل عشان ناخد منه البيانات

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetails, extra: bookModel);
      },
      child: SizedBox(
        height: 125, // قللت الارتفاع قليلاً ليكون متناسقاً
        child: Row(
          children: [
          CustomBookImage(
          imageUrl: bookModel.imageUrl,
          borderRadius: BorderRadius.circular(8), // حواف أصغر لتناسب القائمة
        ),
            const Gap(30),
            Expanded( // استخدام Expanded هنا ضروري لمنع الـ Overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bookModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                  ),
                  const Gap(3),
                  Text(
                    bookModel.author ?? 'Unknown',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(), // بيزق التقييم لآخر الـ Row
                       BookRating(

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/assets.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(AppRouter.bookDetails);
        GoRouter.of(context).push(AppRouter.bookDetails);
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            AspectRatio(
              //width:height
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.soloLeveling.path),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Gap(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Text(
                    'Abanoub Habib Flutter Developer',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                  ),
                ),
                const Gap(3),
                Text(
                  'Abyou ',
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      '19,99 €',
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(36.w),
                    BookRating(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
