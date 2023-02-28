import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(
    this.baseMoviesRepository,
  );

  @override
  Future<Either<Failure, List<Movie>>> call(
    NoParameters parameters,
  ) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
