import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String id;
  final String title;
  final String? author;
  final String imageUrl;
  final String? previewLink; // رابط القراءة
  final bool isFree; // هل الكتاب مجاني؟
  final num rating; // التقييم
  final int ratingCount; // عدد المقيّمين

  const BookModel({
    required this.id,
    required this.title,
    this.author,
    required this.imageUrl,
    this.previewLink,
    this.isFree = false,
    this.rating = 0,
    this.ratingCount = 0,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    var volumeInfo = json['volumeInfo'] ?? {};
    var accessInfo = json['accessInfo'] ?? {};

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No Title',
      // بناخد أول مؤلف بس ولو مفيش بنكتب Unknown
      author: (volumeInfo['authors'] as List?)?.first ?? 'Unknown',
      // بنجيب الصورة ونحولها لـ https عشان تشتغل على الموبايل
      imageUrl: (volumeInfo['imageLinks']?['thumbnail'] ??
          'https://www.freeiconspng.com/uploads/no-image-icon-11.png')
          .replaceFirst('http:', 'https:'),
      previewLink: volumeInfo['previewLink'],
      isFree: accessInfo['viewability'] == 'ALL_PAGES' ||
          accessInfo['viewability'] == 'PARTIAL',

      // حل مشكلة الـ Null: بنحول القيمة لـ String ونعملها parse عشان نضمن النوع
      rating: num.parse((volumeInfo['averageRating'] ?? 0).toString()),
      ratingCount: int.parse((volumeInfo['ratingsCount'] ?? 0).toString()),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    author,
    imageUrl,
    previewLink,
    isFree,
    rating,
    ratingCount,
  ];
}
