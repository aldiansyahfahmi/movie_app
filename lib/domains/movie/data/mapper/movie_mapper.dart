import 'package:movie_app/domains/movie/data/models/response/genre_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/movie_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/production_company_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/production_country_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/spoken_language_response_dto.dart';
import 'package:movie_app/domains/movie/domain/entities/response/genre_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/movie_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/production_company_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/production_country_response_entity.dart';
import 'package:movie_app/domains/movie/domain/entities/response/spoken_language_response_entity.dart';

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
        genres: mapGenreDtoToEntity(data.genres ?? []),
        productionCountries:
            mapProductionCountryDtoToEntity(data.productionCountries ?? []),
        productionCompanies:
            mapProductionCompanyDtoToEntity(data.productionCompanies ?? []),
        spokenLanguages:
            mapSpokenLanguageDtoToEntity(data.spokenLanguages ?? []),
        belongsToCollection: data.belongsToCollection ?? '',
        budget: data.budget ?? 0,
        homepage: data.homepage ?? '',
        imdbId: data.imdbId ?? '',
        revenue: data.revenue ?? 0,
        runtime: data.runtime ?? 0,
        status: data.status ?? '',
        tagline: data.tagline ?? '',
      );

  List<GenreEntity> mapGenreDtoToEntity(List<GenreDto> data) {
    List<GenreEntity> entity = <GenreEntity>[];

    for (GenreDto element in data) {
      entity.add(
        mapGenreDtoToGenreEntity(element),
      );
    }

    return entity;
  }

  GenreEntity mapGenreDtoToGenreEntity(GenreDto data) => GenreEntity(
        id: data.id ?? 0,
        name: data.name ?? '',
      );

  List<ProductionCompanyEntity> mapProductionCompanyDtoToEntity(
      List<ProductionCompanyDto> data) {
    List<ProductionCompanyEntity> entity = <ProductionCompanyEntity>[];

    for (ProductionCompanyDto element in data) {
      entity.add(
        mapProductionCompanyDtoToProductionCompanyEntity(element),
      );
    }

    return entity;
  }

  ProductionCompanyEntity mapProductionCompanyDtoToProductionCompanyEntity(
          ProductionCompanyDto data) =>
      ProductionCompanyEntity(
        id: data.id ?? 0,
        logoPath: data.logoPath ?? '',
        name: data.name ?? '',
        originCountry: data.originCountry ?? '',
      );

  List<ProductionCountryEntity> mapProductionCountryDtoToEntity(
      List<ProductionCountryDto> data) {
    List<ProductionCountryEntity> entity = <ProductionCountryEntity>[];

    for (ProductionCountryDto element in data) {
      entity.add(
        mapProductionCountryDtoToProductionCountryEntity(element),
      );
    }

    return entity;
  }

  ProductionCountryEntity mapProductionCountryDtoToProductionCountryEntity(
          ProductionCountryDto data) =>
      ProductionCountryEntity(
        iso31661: data.iso31661 ?? '',
        name: data.name ?? '',
      );

  List<SpokenLanguageEntity> mapSpokenLanguageDtoToEntity(
      List<SpokenLanguageDto> data) {
    List<SpokenLanguageEntity> entity = <SpokenLanguageEntity>[];

    for (SpokenLanguageDto element in data) {
      entity.add(
        mapSpokenLanguageDtoToSpokenLanguageEntity(element),
      );
    }
    return entity;
  }

  SpokenLanguageEntity mapSpokenLanguageDtoToSpokenLanguageEntity(
          SpokenLanguageDto data) =>
      SpokenLanguageEntity(
        englishName: data.englishName ?? '',
        iso6391: data.iso6391 ?? '',
        name: data.name ?? '',
      );
}
