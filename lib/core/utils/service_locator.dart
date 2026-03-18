import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/repo/search_repo_impl.dart';
import 'api_service.dart';

// بنعرف متغير ثابت (global) هو اللي هنستخدمه في كل التطبيق عشان نوصل للأدوات بتاعتنا
final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. تسجيل الـ ApiService:
  // بنعمله هنا عشان الـ HomeRepoImpl بيعتمد عليه
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // 2. تسجيل الـ HomeRepoImpl:
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt
          .get<
            ApiService
          >(),
    ),
  );
  // 3. تسجيل الـ SearchRepoImpl:
    getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiService>()),
    );
}

