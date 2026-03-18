import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/book_model/book_model.dart';
import '../controller/favorites_cubit/favorites_cubit.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, List<BookModel>>(
      builder: (context, favorites) {
        // بنشيك هل الكتاب ده موجود في لستة المفضلات ولا لا
        bool isFav = context.read<FavoritesCubit>().isFavorite(bookModel.id);

        return IconButton(
          onPressed: () {
            context.read<FavoritesCubit>().toggleFavorite(bookModel);
          },
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? const Color(0xffEF8262) : Colors.grey,
            size: 28,
          ),
        );
      },
    );
  }
}
