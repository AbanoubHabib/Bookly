import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/styles.dart';
import '../controller/search_books_cubit/search_books_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        EasyDebounce.debounce(
          'search-debouncer',
          const Duration(milliseconds: 500),
          () {
            BlocProvider.of<SearchBooksCubit>(
              context,
            ).fetchSearchBooks(bookName: value);
          },
        );
      },

      decoration: InputDecoration(
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
              size: 22.h,
              color: Colors.white,
            ),
          ),
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16.h),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(12),
  );
}
