import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? author;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final String? previewLink;

  @HiveField(5)
  final bool isFree;

  @HiveField(6)
  final num rating;

  @HiveField(7)
  final int ratingCount;

  BookModel({
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
      author: (volumeInfo['authors'] as List?)?.first ?? 'Unknown',
      imageUrl: (volumeInfo['imageLinks']?['thumbnail'] ??
          'https://www.freeiconspng.com/uploads/no-image-icon-11.png')
          .replaceFirst('http:', 'https:'),
      previewLink: volumeInfo['previewLink'],
      isFree: accessInfo['viewability'] == 'ALL_PAGES' ||
          accessInfo['viewability'] == 'PARTIAL',
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
