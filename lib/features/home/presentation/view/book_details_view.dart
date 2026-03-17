import 'package:bookly/features/home/presentation/widgets/booK_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/book_model/book_model.dart';
import '../controller/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}



class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // Use a default category since BookModel doesn't have a category field
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: 'Programming');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BookDetailsViewBody(bookModel: widget.bookModel),
        ),
      ),
    );
  }
}
