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
    var volumeInfo = json['volumeInfo'] ?? {}; // تأمين لو volumeInfo نل
    var accessInfo = json['accessInfo'] ?? {};

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No Title',
      author: (volumeInfo['authors'] as List?)?.first ?? 'Unknown',
      // تعديل بسيط: استخدام replaceFirst لضمان الدقة وتوفير قيمة افتراضية واضحة
      imageUrl: (volumeInfo['imageLinks']?['thumbnail'] ??
          'https://www.freeiconspng.com/uploads/no-image-icon-11.png')
          .replaceFirst('http:', 'https:'),
      previewLink: volumeInfo['previewLink'],
      isFree: accessInfo['viewability'] == 'ALL_PAGES' || accessInfo['viewability'] == 'PARTIAL',
    );
  }
}
