import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../datasource/remote_movie_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MoviesRepository(
    this.baseRemoteMovieDataSource,
  );

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseRemoteMovieDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseRemoteMovieDataSource.getGetPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseRemoteMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}