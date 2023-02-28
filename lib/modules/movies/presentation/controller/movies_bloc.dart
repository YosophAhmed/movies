import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/modules/movies/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {

    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: r,
          ),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedState: RequestState.loaded,
            topRatedMovies: r,
          ),
        ),
      );
    });
  }
}
