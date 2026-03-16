import 'package:bookly/core/errors/failures.dart';

import 'package:bookly/features/home/data/model/book_model/book_model.dart';

import 'package:dartz/dartz.dart';

import 'home_repo.dart';
//* هنا مجبر ينفذ الفيتشرز الموجوده فى HomeRepo
class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks() {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }

}
