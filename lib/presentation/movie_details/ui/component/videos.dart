import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domains/movie/domain/entities/response/video_response_entity.dart';
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
    // List<YoutubePlayerController> ytControllers = data
    //     .map(
    //       (video) => YoutubePlayerController(
    //         initialVideoId: video.key,
    //         flags: const YoutubePlayerFlags(
    //           autoPlay: false,
    //         ),
    //       ),
    //     )
    //     .toList();
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
        // SizedBox(
        //   height: 200.h,
        //   child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return SizedBox(
        //         width: 200,
        //         child: YoutubePlayer(
        //           controller: ytControllers[index],
        //         ),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const SizedBox(
        //         width: 16,
        //       );
        //     },
        //     itemCount: data.length,
        //   ),
        // ),
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
                    child: VideoCard(video: video),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
