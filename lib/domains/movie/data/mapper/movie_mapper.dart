import 'package:movie_app/domains/movie/data/models/response/movie_response_dto.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';

class MovieMapper {
  List<MovieDataEntity> mapMovieDataDtoToEntity(List<MovieDataDto> data) {
    List<MovieDataEntity> entity = <MovieDataEntity>[];

    for (MovieDataDto element in data) {
      entity.add(
        mapMovieDataDtoToMovieDataEntity(element),
      );
    }

    return entity;
  }

  MovieDataEntity mapMovieDataDtoToMovieDataEntity(MovieDataDto data) =>
      MovieDataEntity(
        adult: data.adult ?? false,
        backdropPath: data.backdropPath ?? '',
        genreIds: data.genreIds ?? [],
        id: data.id ?? 0,
        originalLanguage: data.originalLanguage ?? '',
        originalTitle: data.originalTitle ?? '',
        overview: data.overview ?? '',
        popularity: data.popularity ?? 0,
        posterPath: data.posterPath ?? '',
        releaseDate: data.releaseDate ?? DateTime.now(),
        title: data.title ?? '',
        video: data.video ?? false,
        voteAverage: data.voteAverage ?? 0,
        voteCount: data.voteCount ?? 0,
      );
}
