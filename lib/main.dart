import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setupServiceLocator();
  // تهيئة الـ GetIt قبل تشغيل التطبيق و لازم نناديها قبل الـ runApp
  runApp(Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            homeRepo: getIt
                .get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),//! .. mean after init FeaturedBooksCubit call fetchFeaturedBooks
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            homeRepo: getIt
                .get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true, // عشان الخط يتناسب مع كل الشاشات
        splitScreenMode:
            true, // عشان لو الشاشة كبيرة (زي التابلت) يوزع المحتوى بشكل أفضل
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme,
              ),
            ),
          );
        },
      ),
    );
  }
}
