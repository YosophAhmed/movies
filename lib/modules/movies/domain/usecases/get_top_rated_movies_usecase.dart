import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../entities/movie.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(
    this.baseMoviesRepository,
  );

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
