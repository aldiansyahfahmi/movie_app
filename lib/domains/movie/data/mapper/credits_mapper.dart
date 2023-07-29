import 'package:movie_app/domains/movie/data/models/response/credits_response_dto.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';

class CreditsMapper {
  CreditsEntity mapCreditsDtoToCreditsEntity(CreditsDto data) => CreditsEntity(
        id: data.id ?? 0,
        cast: mapCreditsDataDtoToEntity(data.cast ?? []),
        crew: mapCreditsDataDtoToEntity(data.crew ?? []),
      );

  List<CreditsDataEntity> mapCreditsDataDtoToEntity(List<CreditsDataDto> data) {
    List<CreditsDataEntity> entity = <CreditsDataEntity>[];

    for (CreditsDataDto element in data) {
      entity.add(
        mapCreditsDataDtoToCreditsDataEntity(element),
      );
    }

    return entity;
  }

  CreditsDataEntity mapCreditsDataDtoToCreditsDataEntity(CreditsDataDto data) =>
      CreditsDataEntity(
        adult: data.adult ?? false,
        gender: data.gender ?? 0,
        id: data.id ?? 0,
        knownForDepartment: data.knownForDepartment ?? '',
        name: data.name ?? '',
        originalName: data.originalName ?? '',
        popularity: data.popularity ?? 0,
        profilePath: data.profilePath ?? '',
        castId: data.castId ?? 0,
        character: data.character ?? '',
        creditId: data.creditId ?? '',
        order: data.order ?? 0,
        department: data.department ?? '',
        job: data.job ?? '',
      );
}
