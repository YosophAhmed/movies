import 'package:movies/modules/movies/data/models/genres_model.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.image,
    required super.genres,
    required super.id,
    required super.description,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.averageVote,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        image: json['backdrop_path'],
        genres: List<GenresModel>.from(
          json['genres'].map(
            (element) => GenresModel.fromJson(element),
          ),
        ),
        id: json['id'],
        description: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        averageVote: json['vote_average'].toDouble(),
      );
}
