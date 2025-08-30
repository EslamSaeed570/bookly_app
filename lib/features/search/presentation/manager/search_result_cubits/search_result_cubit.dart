import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchRepo) : super(SearchResultInitial());
  final SearchRepo searchRepo;
  Future<void> featchFeaturedBooks({required String search}) async {
    emit(SearchResultLoading());

    var result = await searchRepo.FeatchSearchResult(search: search);

    result.fold((failure) => emit(SearchResultFailure(failure.errMessage)),
        (books) {
      return emit(SearchResultSuccess(books));
    });
  }
}
