part of 'search_result_cubit.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

class SearchResultInitial extends SearchResultState {}

class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;

const  SearchResultSuccess(this.books);
}

class SearchResultFailure extends SearchResultState {
  final String errMessage;

  const SearchResultFailure(this.errMessage);
}

class SearchResultLoading extends SearchResultState {}
