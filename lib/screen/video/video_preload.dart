// import 'package:cached_video_player/cached_video_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:video_player/video_player.dart';
// import '../../../bloc/preload_bloc.dart';
// import '../../../components/components.dart';
// import '../../../components/constants.dart';
// import '../../widgets/video_actions_toolbar.dart';
// import '../../widgets/video_description.dart';
// import '../profile/profile_screen.dart';
// import 'package:cached_video_preview/cached_video_preview.dart';
//
//
//
// class VideoPreload extends StatelessWidget {
//   const VideoPreload({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children:[
//           Scaffold(
//           backgroundColor: Colors.black,
//             body: SafeArea(
//               child: BlocBuilder<PreloadBloc, PreloadState>(
//                 builder: (context, state) {
//                   return PageView.builder(
//                     controller: PageController(
//                       //initialPage: 0,
//                       viewportFraction: 1.0,
//                     ),
//                     pageSnapping: true,
//                     itemCount: state.urls.length,
//                     scrollDirection: Axis.vertical,
//                     onPageChanged: (index) =>
//                         BlocProvider.of<PreloadBloc>(context, listen: false)
//                             .add(PreloadEvent.onVideoIndexChanged(index)),
//                           itemBuilder: (context, index) {
//                             // Is at end and isLoading
//                             final bool _isLoading = (state.isLoading && index == state.urls.length - 1);
//                             return state.focusedIndex == index
//                                 ? VideoWidget(
//                                     isLoading: _isLoading,
//                                     controller: state.controllers[index]!,
//                                   )
//                                 : const SizedBox();
//                           },
//                   );
//                 },
//               ),
//             ),
//             floatingActionButton: FloatingActionButton(
//               heroTag: "addVideoBtn",
//               onPressed: () {navigateTo(context, '/pickvideo');},
//               backgroundColor: primaryDeepColor,
//               tooltip: 'Add New Video',
//               elevation: 5,
//               // splashColor: Colors.grey,
//               child: const Icon(Icons.add_circle, color: Colors.white, size: 29,),
//             ),
//             floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//
//           )
//         ]
//     );
//   }
// }//end first Stateless widget
//
//
//
// class VideoWidget extends StatefulWidget {
//   final bool isLoading;
//   final CachedVideoPlayerController controller;
//   const VideoWidget({Key? key, required this.isLoading, required this.controller}) : super(key: key);
//   @override
//   State<VideoWidget> createState() => _VideoWidgetState();
// }
//
// class _VideoWidgetState extends State<VideoWidget> {
//   @override
//   Widget build(BuildContext context) {
//       return Container(child: videoScreen());
//   }
//
//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }
//
//   Widget videoScreen() {
//     return Stack(
//         children: [
//           PageView.builder(
//             onPageChanged: (value) {
//               if (value == 1) {
//                 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//               } else {
//                 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//               }
//             },
//             itemCount: 2,
//             itemBuilder: (context, index) {
//               if (index == 0) {
//                 return scrollFeed();
//               } else {
//                 return profileView();
//               }
//             },
//           )
//         ],
//       );
//   }
//
//   Widget profileView() {
//     return ProfileScreen(uid: '11111', slideOutProfile: false);
//   }
//
//   Widget scrollFeed() {
//     return SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(child: feedVideos()),
//           ],
//         ));
//   }
//
//
//   Widget feedVideos() {
//     return Stack(
//           children: [
//             widget.controller.value.isPlaying
//                 ?
//                   GestureDetector(
//                     onTap: () {
//                       if (widget.controller.value.isPlaying) {
//                         widget.controller.pause();
//                         const Center(child: Icon(Icons.play_arrow, size: 50, color: Colors.grey,));
//                       } else {
//                         widget.controller.play();
//                       }
//                     },
//                       //child: ListView(
//                         //children:[
//                       child: SizedBox.expand(
//                               child: FittedBox(
//                                 fit: BoxFit.cover,
//                                 child: SizedBox(
//                                   width: widget.controller.value.size.width ?? 0,
//                                   height: widget.controller.value.size.height ?? 0,
//                                   child: CachedVideoPlayer(widget.controller),//VideoPlayer(controller),
//                                 ),
//                               )
//                             )
//                         //]),
//                     )
//                   :
//                     Center(child: getCircularProgressIndicator(),),
//                     // Expanded(
//                     //   child: CachedVideoPreviewWidget(
//                     //       path: widget.controller,
//                     //       type: SourceType.remote,
//                     //       remoteImageBuilder: (BuildContext context, url) =>
//                     //           Image.network(url),
//                     //       // Add custom Http Headers,
//                     //       httpHeaders: const <String, String>{},
//                     //     ),
//                     //   )
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       VideoDescription('video.user', 'video.videoTitle', 'video.songName', "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
//                       VideoActionsToolbar('video.likes', '45',
//                           "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
//                     ],
//                   ),
//                   const SizedBox(height: 2)
//                 ],
//               ),
//           ],
//         );
//
//
//
//
//
//     // return Column(
//     //   children: [
//     //     Expanded(child: VideoPlayer(controller)),
//     //     AnimatedCrossFade(
//     //       alignment: Alignment.bottomCenter,
//     //       sizeCurve: Curves.decelerate,
//     //       duration: const Duration(milliseconds: 400),
//     //       firstChild: Padding(
//     //         padding: const EdgeInsets.all(10.0),
//     //         child: CupertinoActivityIndicator(
//     //           color: Colors.white,
//     //           radius: 8,
//     //         ),
//     //       ),
//     //       secondChild: const SizedBox(),
//     //       crossFadeState:
//     //       isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//     //     ),
//     //   ],
//     // );
//   }
// }
