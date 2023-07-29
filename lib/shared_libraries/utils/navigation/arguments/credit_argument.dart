import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';

class CreditArgument extends Equatable {
  final String creditName;
  final List<CreditsDataEntity> creditsDataEntity;

  const CreditArgument(
      {required this.creditName, required this.creditsDataEntity});

  @override
  List<Object?> get props => [creditName, creditsDataEntity];
}
