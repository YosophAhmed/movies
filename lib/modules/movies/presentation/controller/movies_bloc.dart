import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/modules/movies/presentation/controller/movies_states.dart';
import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
    });
  }
}