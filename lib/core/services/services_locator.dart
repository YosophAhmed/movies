import 'package:get_it/get_it.dart';
import 'package:movies/modules/movies/data/datasource/remote_movie_data_source.dart';
import 'package:movies/modules/movies/data/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';
import 'package:movies/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/modules/movies/domain/usecases/get_top_rated_movies_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
      () => RemoteMovieDataSource(),
    );
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(
        sl(),
      ),
    );
  }
}
