import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

// بنعرف متغير ثابت (global) هو اللي هنستخدمه في كل التطبيق عشان نوصل للأدوات بتاعتنا
final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. تسجيل الـ ApiService:
  // بنعمله هنا عشان الـ HomeRepoImpl بيعتمد عليه
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // 2. تسجيل الـ HomeRepoImpl:
  // استخدمنا registerSingleton عشان نضمن إن الـ Repository ده يتنشئ منه نسخة واحدة بس
  // في الذاكرة طول ما التطبيق شغال، وده بيوفر جداً في الأداء وجهازك هيستريح
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt
          .get<
            ApiService
          >(), // هنا get_it بتدور على الـ ApiService اللي سجلناه فوق وبتبعته لـ HomeRepoImpl
    ),
  );
  // 3. تسجيل الـ SearchRepoImpl:
  //   getIt.registerSingleton<SearchRepoImpl>(
  //     SearchRepoImpl(getIt.get<ApiService>()),
  //   );
}

/*
🚀 إزاي تستخدمه في الـ main.dart؟
عشان الـ get_it يبدأ يشتغل لازم تنادي دالة الـ setupServiceLocator في أول الـ main:
void main() {
  setupServiceLocator(); // لازم تناديها قبل الـ runApp
  runApp(const BooklyApp());
}
*/
