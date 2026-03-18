import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/model/book_model/book_model.dart';

class FavoritesCubit extends Cubit<List<BookModel>> {
  FavoritesCubit() : super([]);

  // الوصول للصندوق الذي قمنا بفتحه في الـ main
  final _favBox = Hive.box<BookModel>('favorites_box');

  /// 1. جلب كافة الكتب المضافة للمفضلة
  void fetchFavorites() {
    // نحول القيم الموجودة في الـ Box إلى List ونرسلها للـ UI
    emit(_favBox.values.toList());
  }

  /// 2. إضافة أو حذف كتاب (Toggle)
  void toggleFavorite(BookModel book) {
    if (_favBox.containsKey(book.id)) {
      // لو الكتاب موجود فعلاً، امسحه
      _favBox.delete(book.id);
    } else {
      // لو مش موجود، ضيفه باستخدام الـ ID كـ Key
      _favBox.put(book.id, book);
    }

    // بعد كل عملية تعديل، نحدث القائمة المعروضة فوراً
    fetchFavorites();
  }

  /// 3. التأكد هل الكتاب موجود في المفضلة أم لا (من أجل لون القلب)
  bool isFavorite(String bookId) {
    return _favBox.containsKey(bookId);
  }
}
