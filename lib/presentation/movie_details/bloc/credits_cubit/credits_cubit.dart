import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domains/movie/domain/usecases/get_credits_usecase.dart';
import '/shared_libraries/utils/state/view_data_state.dart';
import 'credits_state.dart';

class CreditsCubit extends Cubit<CreditsState> {
  final GetCreditsUseCase getCreditsUseCase = GetCreditsUseCase();

  CreditsCubit() : super(CreditsState(creditsState: ViewData.initial()));

  void getCredits({required int id}) async {
    emit(CreditsState(creditsState: ViewData.loading()));
    final result = await getCreditsUseCase.call(id);
    result.fold(
      (failure) => emit(
        CreditsState(
          creditsState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        CreditsState(
          creditsState: ViewData.loaded(
            data: result,
          ),
        ),
      ),
    );
  }
}
