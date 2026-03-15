import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
     // autofocus: true,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search for books...',
        hintStyle: Styles.textStyle14.copyWith(
          color: Colors.grey.withValues(alpha: 0.7),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: 0.7,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22.sp,
              color: Colors.white,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
