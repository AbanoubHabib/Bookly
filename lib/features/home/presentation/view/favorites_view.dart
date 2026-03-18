import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import '../../data/model/book_model/book_model.dart';

import '../controller/favorites_cubit/favorites_cubit.dart';
import '../widgets/book_list_view_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesCubit, List<BookModel>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet! Go add some 📚'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return BookListViewItem(bookModel: favorites[index]);
            },
          );
        },
      ),
    );
  }
}
