import 'package:bookly/features/home/presentation/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CustomBookDetailsAppBar(),
          Gap(20),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 80.w),
            child: CustomBookImageItem(),
          )
        ],
    );
  }
}
