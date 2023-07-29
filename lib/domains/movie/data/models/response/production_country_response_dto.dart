class ProductionCountryDto {
  final String? iso31661;
  final String? name;

  ProductionCountryDto({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) =>
      ProductionCountryDto(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );
}
