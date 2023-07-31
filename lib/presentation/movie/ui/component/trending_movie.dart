import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/movie/bloc/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:movie_app/presentation/movie/bloc/trending_movie_cubit/trending_movie_state.dart';
import 'package:movie_app/presentation/movie/ui/component/list_movie.dart';
import 'package:movie_app/shared_libraries/component/loading/movie_loading.dart';
import 'package:movie_app/shared_libraries/component/view/error_view.dart';
import 'package:movie_app/shared_libraries/utils/constants/app_constants.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';
import 'package:movie_app/shared_libraries/utils/state/view_data_state.dart';

class TrendingMovie extends StatefulWidget {
  const TrendingMovie({super.key});

  @override
  State<TrendingMovie> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Trending',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.gray),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TabBar(
                  controller: tabController,
                  indicatorPadding: const EdgeInsets.all(8),
                  indicator: BoxDecoration(
                    color: ColorName.gray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: (index) {
                    context.read<TrendingMovieCubit>().getTrendingMovie(
                          timeWindow: index == 0
                              ? AppConstants.app.day
                              : AppConstants.app.week,
                        );
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'This Week',
                        style: TextStyle(
                          color: ColorName.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
          builder: (context, state) {
            return state.trendingMovieState.observe(
              onLoading: const MovieLoading(),
              onError: (error) => ErrorView(
                error: error!,
                onTap: () => context
                    .read<TrendingMovieCubit>()
                    .getTrendingMovie(timeWindow: AppConstants.app.day),
              ),
              (data) => ListMovie(data: data!),
            );
          },
        ),
      ],
    );
  }
}
