import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app/presentation/credits/ui/component/credits_loading.dart';
import 'package:movie_app/presentation/movie_details/bloc/credits_cubit/credits_cubit.dart';
import 'package:movie_app/presentation/movie_details/bloc/credits_cubit/credits_state.dart';
import 'package:movie_app/shared_libraries/component/appbar/custom_appbar.dart';
import 'package:movie_app/shared_libraries/component/card/credits_card.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/navigation/arguments/credit_argument.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class CreditScreen extends StatefulWidget {
  final CreditArgument argument;
  const CreditScreen({super.key, required this.argument});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  void getCredits() {
    context.read<CreditsCubit>().getCredits(
          id: widget.argument.movieId,
        );
  }

  @override
  void initState() {
    getCredits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: widget.argument.creditName),
            Expanded(
              child: BlocBuilder<CreditsCubit, CreditsState>(
                builder: (context, state) {
                  return state.creditsState.observe(
                    onLoading: const CreditsLoading(),
                    onError: (error) => ErrorView(
                      error: error!,
                      onTap: () => getCredits(),
                    ),
                    (data) => AlignedGridView.count(
                      padding: const EdgeInsets.all(16),
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 4
                          : 8,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemCount: widget.argument.creditName == 'Cast'
                          ? data!.cast.length
                          : data!.crew.length,
                      itemBuilder: (context, index) {
                        return CreditsCard(
                          credit: widget.argument.creditName == 'Cast'
                              ? data.cast[index]
                              : data.crew[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
