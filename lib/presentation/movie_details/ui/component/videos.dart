import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
import 'package:movie_app/shared_libraries/component/card/video_card.dart';
import 'package:movie_app/shared_libraries/utils/helpers/url_helper.dart';
import 'package:movie_app/shared_libraries/utils/resources/colors.gen.dart';

class Videos extends StatelessWidget {
  const Videos({
    super.key,
    required this.data,
  });
  final List<VideoDataEntity> data;

  @override
  Widget build(BuildContext context) {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data
                .map(
                  (video) => Padding(
                    padding: EdgeInsets.only(
                      right: video == data.last ? 0 : 16,
                    ),
                    child: VideoCard(
                      video: video,
                      onTap: () {
                        UrlHelper.launch(
                            'https://www.youtube.com/watch?v=${video.key}');
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
