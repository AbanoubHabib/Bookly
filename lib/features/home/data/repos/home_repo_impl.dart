import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';
import 'package:dio/dio.dart';

//* هنا مجبر ينفذ الفيتشرز الموجوده فى HomeRepo
class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      // الـ endpoint هنا يبحث عن كتب Flutter مع فلتر للمعاينة المجانية
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      // الـ endpoint هنا يبحث عن أحدث كتب Flutter المرتبة زمنياً
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      // هنا بنبحث عن كتب مشابهة بناءً على التصنيف (Category) وبترتيب الأهمية
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
