import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import 'package:movie_app/presentation/movie_details/bloc/videos_cubit/videos_cubit.dart';
import 'package:movie_app/shared_libraries/component/card/video_card.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Videos extends StatelessWidget {
  const Videos({
    super.key,
    required this.data,
  });
  final List<VideoDataEntity> data;

  @override
  Widget build(BuildContext context) {
    final videoCubit = context.read<VideosCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Videos',
          style: TextStyle(
            color: ColorName.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VideoCard(
                video: data[index],
                onTap: () {
                  videoCubit.videoIndex = index;
                  videoCubit.ytControllers[videoCubit.videoIndex]
                      .toggleFullScreenMode();
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}
