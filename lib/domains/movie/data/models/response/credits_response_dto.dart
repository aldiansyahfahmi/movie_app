import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';

class CreditsDto {
  final int? id;
  final List<CreditsDataDto>? cast;
  final List<CreditsDataDto>? crew;

  CreditsDto({
    this.id,
    this.cast,
    this.crew,
  });

  factory CreditsDto.fromJson(Map<String, dynamic> json) => CreditsDto(
        id: json["id"],
        cast: json["cast"] == null
            ? []
            : List<CreditsDataDto>.from(
                json["cast"]!.map((x) => CreditsDataDto.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<CreditsDataDto>.from(
                json["crew"]!.map((x) => CreditsDataDto.fromJson(x))),
      );
}

class CreditsDataDto {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  CreditsDataDto({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory CreditsDataDto.fromJson(Map<String, dynamic> json) => CreditsDataDto(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"] == null
            ? null
            : '${AppConstants.app.posterImageUrl}/${json["profile_path"]}',
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );
}

enum Department {
  acting,
  art,
  camera,
  costumeMakeUp,
  creator,
  crew,
  directing,
  editing,
  production,
  sound,
  visualEffects,
  writing,
}

final departmentValues = EnumValues({
  "Acting": Department.acting,
  "Art": Department.art,
  "Camera": Department.camera,
  "Costume & Make-Up": Department.costumeMakeUp,
  "Creator": Department.creator,
  "Crew": Department.crew,
  "Directing": Department.directing,
  "Editing": Department.editing,
  "Production": Department.production,
  "Sound": Department.sound,
  "Visual Effects": Department.visualEffects,
  "Writing": Department.writing
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
