import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  // بحدد هنا أنا عايز أعمل إيه؟؟؟
  //* بكتب هنا الفانكشنز المسؤله عن جلب وعرض الداتا بدوت تعريف او خواص without implementations

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks( {required String category} );
}
