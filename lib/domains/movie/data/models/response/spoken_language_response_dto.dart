class SpokenLanguageDto {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguageDto({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageDto(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );
}
