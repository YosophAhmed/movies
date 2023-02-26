import 'package:dartz/dartz.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(
    this.baseMoviesRepository,
  );

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
