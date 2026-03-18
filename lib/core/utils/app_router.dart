import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/book_details_view.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:bookly/features/search/presentation/controller/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/model/book_model/book_model.dart';
import '../../features/home/presentation/view/main_view.dart';
import '../../features/search/data/repo/search_repo_impl.dart';

class AppRouter {
  static const String splash = '/'; // خلي الـ Splash هي نقطة البداية الحقيقية
  static const String mainView = '/mainView'; // ده المسار الجديد اللي فيه الـ Nav Bar
  static const String bookDetails = '/bookDetails';
  static const String search = '/search';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      // 1. شاشة الـ Splash
      GoRoute(
          path: splash,
          builder: (context, state) => const SplashView()
      ),

      // 2. الشاشة الرئيسية (اللي شايلة الـ Home والفيفوريت والبروفايل)
      GoRoute(
          path: mainView,
          builder: (context, state) => const MainView()
      ),

      // 3. شاشة التفاصيل
      GoRoute(
        path: bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),

      // 4. شاشة السيرش
      GoRoute(
        path: search,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
