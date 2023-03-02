import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/modules/movies/domain/entities/recommendations.dart';
import 'package:movies/modules/movies/domain/repository/movies_base_repository.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase(
    this.baseMoviesRepository,
  );

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    return await baseMoviesRepository.getRecommendations(
      parameters,
    );
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
