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
import '../../features/search/data/repo/search_repo_impl.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String bookDetails = '/bookDetails';
  static const String search = '/search';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashView()),
      GoRoute(path: home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: bookDetails,
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(path: search, builder: (context, state) =>
          BlocProvider(
            create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
            child: SearchView(),
          )),
    ],
  );
}
