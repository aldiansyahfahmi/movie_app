class GenreDto {
  final int? id;
  final String? name;

  GenreDto({
    this.id,
    this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) => GenreDto(
        id: json["id"],
        name: json["name"],
      );
}
