import 'package:biztore/widgets/video_circle_image_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';


class VideoDescription extends StatelessWidget {
  final username;
  final videtoTitle;
  final songInfo;
  final userPic;
  VideoDescription(this.username, this.videtoTitle, this.songInfo, this.userPic);

  // Full dimensions of an action
  static const double ActionWidgetSize = 30.0;
// The size of the profile image in the follow Action
  static const double ProfileImageSize = 30.0;
  LinearGradient get musicGradient => LinearGradient(colors: [
    blackLightColor!, blackColor!, blackColor!, blackLightColor!
  ], stops: const [0.0, 0.4, 0.6, 1.0
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);


  Widget _getMusicPlayerAction(userPic) {
    return Container(
        margin: const EdgeInsets.only(top: 0.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(3.0),
              height: ProfileImageSize,
              width: ProfileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000.0),
                  child: CachedNetworkImage(
                    imageUrl: userPic,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
              )),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 125.0,
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(username,
                  //   style: const TextStyle(
                  //       fontSize: 16,
                  //       color: primaryLightColor,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 4,),
                  Text(videtoTitle, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, color: whiteColor),),
                  const SizedBox(height: 4),
                  Row(children: [
                    VideoCircleImageAnimation(
                      child: const Icon(Icons.playlist_add_check_circle_outlined, color: Colors.white70,)//_getMusicPlayerAction(userPic),
                    ),
                    const Icon(Icons.audiotrack, size: 15.0, color: whiteColor,),
                    Text(songInfo, overflow: TextOverflow.ellipsis, style: const TextStyle(color: whiteColor, fontSize: 14.0))
                  ]),
                  Row(children: [
                    //CircleImageAnimation(
                     //_getMusicPlayerAction(userPic),
                    //),
                    const Text('@ajaxsamson', overflow: TextOverflow.ellipsis, style: TextStyle(color: whiteColor, fontSize: 13.0))
                  ]),

                ]
            )
        )
    );
  }
}
