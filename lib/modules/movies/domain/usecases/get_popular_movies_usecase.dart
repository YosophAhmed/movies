import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../entities/movie.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(
    this.baseMoviesRepository,
  );

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
