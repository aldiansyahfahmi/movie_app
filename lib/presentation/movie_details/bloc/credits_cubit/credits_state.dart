import 'package:equatable/equatable.dart';
import 'package:movie_app/domains/movie/domain/entities/response/credits_response_entity.dart';
import '/shared_libraries/utils/state/view_data_state.dart';

class CreditsState extends Equatable {
  final ViewData<CreditsEntity> creditsState;

  const CreditsState({required this.creditsState});

  @override
  List<Object?> get props => [creditsState];
}
