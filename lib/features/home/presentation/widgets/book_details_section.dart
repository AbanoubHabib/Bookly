import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
import '../../data/model/book_model/book_model.dart';
import 'book_action_two_button.dart';
import 'book_rating.dart';
import 'custom_book_image_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: CustomBookImageItem(imageUrl: bookModel.imageUrl),
        ),
        const Gap(20),

        Center(
          child: Text(
            bookModel.title,
            textAlign: TextAlign.center,
            style: Styles.textStyle30.copyWith(
              fontSize: 25.sp.clamp(18, 22),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(5),
        Text(
          bookModel.author ?? 'Abanoub Habib',
          style: Styles.textStyle18.copyWith(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(10),
        bookModel.rating > 0
            ? BookRating(rating: bookModel.rating, count: bookModel.ratingCount,mainAxisAlignment: MainAxisAlignment.center,)
            :  Text(
                'No ratings yet',
                style: TextStyle(fontSize: 15, color: Colors.red.shade400,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),
              ),
        const Gap(45),
        BookAction(bookModel: bookModel),
      ],
    );
  }
}
