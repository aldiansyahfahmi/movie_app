class VideoDataDto {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  VideoDataDto({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory VideoDataDto.fromJson(Map<String, dynamic> json) => VideoDataDto(
        iso6391: json["iso_639_1"]!,
        iso31661: json["iso_3166_1"]!,
        name: json["name"],
        key: json["key"],
        site: json["site"]!,
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        id: json["id"],
      );
}
