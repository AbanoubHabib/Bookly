import 'package:flutter/material.dart';

import '../../../home/data/model/book_model/book_model.dart';
import '../../../home/presentation/widgets/book_list_view_item.dart';

class SearchResultVerticalListView extends StatelessWidget {
  const SearchResultVerticalListView({super.key, required this.books});

  final List<BookModel> books; // لاحظ هنا بعتنا القائمة مباشرة

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookModel: books[index]),
        );
      },
    );
  }
}
