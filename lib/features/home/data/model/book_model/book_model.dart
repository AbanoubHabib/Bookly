import 'package:equatable/equatable.dart';

import 'item.dart';

class BookModel {
  final String id;
  final String title;
  final String? author;
  final String imageUrl;
  final String? previewLink; // رابط القراءة
  final bool isFree; // هل الكتاب مجاني؟

  BookModel({
    required this.id,
    required this.title,
    this.author,
    required this.imageUrl,
    this.previewLink,
    this.isFree = false,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    // جوجل يضع البيانات الأساسية داخل volumeInfo
    var volumeInfo = json['volumeInfo'];
    // جوجل يضع بيانات الوصول (مجاني أم لا) داخل accessInfo
    var accessInfo = json['accessInfo'];

    return BookModel(
      id: json['id'],
      title: volumeInfo['title'] ?? 'No Title',
      author: (volumeInfo['authors'] as List?)?.first ?? 'Unknown',
      // جلب الصورة بدقة عالية وتأمين الرابط بـ https
      imageUrl: (volumeInfo['imageLinks']?['thumbnail'] ?? '').replaceAll('http:', 'https:'),
      previewLink: volumeInfo['previewLink'],
      // التحقق إذا كان الكتاب متاحاً للقراءة مجاناً
      isFree: accessInfo['viewability'] == 'ALL_PAGES' || accessInfo['viewability'] == 'PARTIAL',
    );
  }
}
