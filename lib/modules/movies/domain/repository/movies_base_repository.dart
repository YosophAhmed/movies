import 'package:dartz/dartz.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';
import 'package:movies/modules/movies/domain/entities/recommendations.dart';
import 'package:movies/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/modules/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<Recommendations>>> getRecommendations(
    RecommendationsParameters parameters,
  );
}
