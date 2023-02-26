import 'package:dartz/dartz.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(
    this.baseMoviesRepository,
  );

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
