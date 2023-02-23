import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(
    this.baseMoviesRepository,
  );

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
