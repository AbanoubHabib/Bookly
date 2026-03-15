import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, size: 18,color: Color(0xffFFDD4f)),
        Gap(10),
        Text('4.8', style: Styles.textStyle16),
        Gap(5),
        Text('(2679)', style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
