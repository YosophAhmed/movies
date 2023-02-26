import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/modules/movies/data/datasource/remote_movie_data_source.dart';
import 'package:movies/modules/movies/data/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';
import 'package:movies/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/modules/movies/presentation/controller/movies_states.dart';

import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  MoviesBloc() : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseRemoteMovieDataSource remoteMovieDataSource = RemoteMovieDataSource();
      BaseMoviesRepository moviesRepository = MoviesRepository(
        remoteMovieDataSource,
      );
      final result = await GetNowPlayingMoviesUseCase(
        moviesRepository,
      ).execute();
    });
  }
}
