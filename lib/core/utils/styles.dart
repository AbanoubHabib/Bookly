// import 'package:bookly_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

abstract class Styles {
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp.clamp(16, 20),
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp.clamp(18, 22),
    fontWeight: FontWeight.normal, // normal == regular
  );
  static TextStyle textStyle30 = TextStyle(
    fontSize: 30.sp.clamp(20, 33),
    fontWeight: FontWeight.normal,
    fontFamily: kGTSectraFine,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w500,
  );
}
