import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  // بنبدأ بـ Dark Mode كـ Default لمشروع Bookly
  ThemeCubit() : super(ThemeMode.dark);

  // فانكشن التبديل (Toggle)
  void toggleTheme() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  // ميزة الـ Hydrated: بيقرأ الداتا المتسيفة من الـ Json ويرجعها لـ ThemeMode
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  // ميزة الـ Hydrated: بيحول الـ ThemeMode لـ Json عشان يتحفظ في الجهاز
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
