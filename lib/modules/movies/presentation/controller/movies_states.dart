import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];
}
