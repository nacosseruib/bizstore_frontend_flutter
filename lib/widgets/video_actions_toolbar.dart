import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';



class VideoActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;

  final String numLikes;
  final String numComments;
  final String userPic;

  VideoActionsToolbar(this.numLikes, this.numComments, this.userPic);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //_getFollowAction(pictureUrl: userPic),
        _getSocialAction(icon: Icons.thumb_up, title: numLikes),
        _getSocialAction(icon: Icons.thumb_down, title: '3'),
        _getSocialAction(icon: Icons.chat_bubble, title: numComments),
        _getSocialAction(
            icon: Icons.reply, title: 'Share', isShare: true
        ),
         const SizedBox(height: 80),
        // CircleImageAnimation(
        //   child: _getMusicPlayerAction(userPic),
        // )
      ]),
    );
  }

  Widget _getSocialAction(
      {required String title, required IconData icon, bool isShare = false}) {
    return Container(
        margin: const EdgeInsets.only(top: 17.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 30.0 : 30.0, color: whiteColor),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 8.0 : 8.0),
            child: Text(title,
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: isShare ? 14.0 : 14.0)),
          )
        ]));
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child:
            Stack(
                children: [_getProfilePicture(pictureUrl), _getPlusIcon()]
            )
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: primaryDeepColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: const Icon(
            Icons.add,
            color: whiteColor,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: Container(
            padding:
                const EdgeInsets.all(1.0), // Add 1.0 point padding to create border
            height: ProfileImageSize, // ProfileImageSize = 50.0;
            width: ProfileImageSize, // ProfileImageSize = 50.0;
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  imageUrl: userPic,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))));
  }

  // LinearGradient get musicGradient => LinearGradient(colors: [
  //   black45Color!,
  //   blackColor!,
  //   blackColor!,
  //   black45Color!
  //     ], stops: const [
  //       0.0,
  //       0.4,
  //       0.6,
  //       1.0
  //     ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  // Widget _getMusicPlayerAction(userPic) {
  //   return Container(
  //       margin: const EdgeInsets.only(top: 10.0),
  //       width: ActionWidgetSize,
  //       height: ActionWidgetSize,
  //       child: Column(children: [
  //         Container(
  //             padding: const EdgeInsets.all(11.0),
  //             height: ProfileImageSize,
  //             width: ProfileImageSize,
  //             decoration: BoxDecoration(
  //                 gradient: musicGradient,
  //                 borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
  //             child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10000.0),
  //                 child: CachedNetworkImage(
  //                   imageUrl: userPic,
  //                   placeholder: (context, url) =>
  //                       const CircularProgressIndicator(),
  //                   errorWidget: (context, url, error) => const Icon(Icons.error),
  //                 )
  //             )),
  //       ]));
  // }
}
