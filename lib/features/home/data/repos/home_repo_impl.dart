import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> featchNewestBook() async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?q=subject:programming&Sorting=newest&Filtering=free-ebooks');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    }  catch (e) {
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

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks()async {
  try {
      var data = await apiService.get(
          endPoints:
              'volumes?q=subject:programming&Filtering=free-ebooks');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    }  catch (e) {
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
