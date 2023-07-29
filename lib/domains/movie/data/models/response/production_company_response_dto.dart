class ProductionCompanyDto {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanyDto({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyDto(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );
}
