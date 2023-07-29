import 'package:movie_app/domains/movie/data/models/response/genre_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/production_company_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/production_country_response_dto.dart';
import 'package:movie_app/domains/movie/data/models/response/spoken_language_response_dto.dart';

class MovieDataDto {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<GenreDto>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyDto>? productionCompanies;
  final List<ProductionCountryDto>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageDto>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDataDto({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDataDto.fromJson(Map<String, dynamic> json) => MovieDataDto(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<GenreDto>.from(
                json["genres"]!.map((x) => GenreDto.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? []
            : List<ProductionCompanyDto>.from(json["production_companies"]!
                .map((x) => ProductionCompanyDto.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? []
            : List<ProductionCountryDto>.from(json["production_countries"]!
                .map((x) => ProductionCountryDto.fromJson(x))),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] == null
            ? []
            : List<SpokenLanguageDto>.from(json["spoken_languages"]!
                .map((x) => SpokenLanguageDto.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
