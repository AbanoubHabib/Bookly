import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/app_themes.dart'; // تأكد من استيراد ملف الثيمات
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/manager/navigation_cubit.dart';
import 'core/manager/theme_cubit.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/model/book_model/book_model.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/controller/favorites_cubit/favorites_cubit.dart';
import 'features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';

void main() async {
  // دي لازم تكون أول سطر طالما فيه await في الـ main
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة الـ GetIt
  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>('favorites_box'); // ده الصندوق اللي هنخزن فيه
  // تهيئة الـ Hydrated Storage لحفظ حالة الثيم (Light/Dark)
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );

  runApp(
    DevicePreview(
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => const Bookly(),
    ),
  );
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // توفير الـ ThemeCubit على مستوى التطبيق بالكامل
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit()..fetchFavorites(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // التعديل المهم هنا: نراقب الـ ThemeMode
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                routerConfig: AppRouter.router,

                // ربط الثيمات من ملف AppThemes
                themeMode: themeMode,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
              );
            },
          );
        },
      ),
    );
  }
}
