import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearrchRepoImpl implements SearchRepo {
  @override
  final ApiService apiService;

  SearrchRepoImpl({required this.apiService});
  Future<Either<Failure, List<BookModel>>> FeatchSearchResult(
      {required String search}) async {
    try {
      var data = await apiService.get(
          endPoints: 'volumes?q=$search&Sorting=newest&Filtering=free-ebooks');
      List<BookModel> books = [];
      if (data['totalItems'] != 0) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      } else {
        return left(ServerFailure('Oops, no Books here 😕, try search again!'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
