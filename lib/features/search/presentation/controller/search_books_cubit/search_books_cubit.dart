import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final SearchRepoImpl searchRepo;
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  Future<void> fetchSearchBooks({required String bookName}) async {
    if (bookName.isEmpty) {
      emit(SearchBooksInitial());
      return;
    }

    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(bookName: bookName);

    result.fold(
          (failure) => emit(SearchBooksFailure(failure.errMessage)),
          (books) => emit(SearchBooksSuccess(books)),
    );
  }
}
