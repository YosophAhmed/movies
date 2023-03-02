import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/error_model.dart';
import 'package:movies/modules/movies/data/models/movie_details_model.dart';
import 'package:movies/modules/movies/data/models/movie_model.dart';
import 'package:movies/modules/movies/data/models/recommendation_model.dart';
import 'package:movies/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/modules/movies/domain/usecases/get_recommendations_usecase.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getGetPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<List<RecommendationModel>> getRecommendations(
    RecommendationsParameters parameters,
  );
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      ApiConstants.nowPlayingMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getGetPopularMovies() async {
    final response = await Dio().get(
      ApiConstants.popularMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      ApiConstants.topRatedMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.movieDetailsPath(
        parameters.movieId,
      ),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
    RecommendationsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.recommendationsPath(
        parameters.id,
      ),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
