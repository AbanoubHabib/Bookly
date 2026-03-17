import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/styles.dart';
import 'book_action_two_button.dart';
import 'book_rating.dart';
import 'custom_book_image_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: CustomBookImageItem(
            imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.tiz9y9jJBk_pUmwWtYFUxgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
          ),
        ),
        const Gap(20),
        Text('Solo Leveling Anime ', style: Styles.textStyle30),
        const Gap(5),
        Text(
          'Abanoub Habib ',
          style: Styles.textStyle18.copyWith(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(10),
        BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const Gap(45),
        const BookAction(),
      ],
    );
  }
}
