import 'package:biztore/screen/video/video_items.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import '../../../components/constants.dart';
import '../../../model/video/video.dart';
import '../../widgets/video_actions_toolbar.dart';
import '../../widgets/video_description.dart';
import '../profile/profile_screen.dart';
import 'video_viewmodel.dart';


class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final locator = GetIt.instance;
  final videoViewModel = GetIt.instance<VideoViewModel>();
  int getIndex = 0;

  @override
  void initState() {
    super.initState();
    //videoViewModel.loadVideo(0);
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.blueGrey[100],
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       title: const Text('Flutter Video Player Demo'),
  //       centerTitle: true,
  //     ),
  //     body: ListView(
  //       children: <Widget>[
  //         VideoItems(
  //           videoPlayerController: VideoPlayerController.network(
  //               "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
  //           ),
  //           looping: true,
  //           autoplay: true,
  //         ),
  //         VideoItems(
  //           videoPlayerController: VideoPlayerController.network(
  //             'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/5.mp4?alt=media&token=965a0494-7aaf-4248-85c5-fefac581ee7f',
  //           ),
  //           looping: false,
  //           autoplay: true,
  //         ),
  //         VideoItems(
  //           videoPlayerController: VideoPlayerController.network(
  //              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/7.mp4?alt=media&token=2f6a3c9b-bfc4-483e-ad5b-bb7d539ee765",
  //           ),
  //           looping: false,
  //           autoplay: false,
  //         ),
  //         VideoItems(
  //           videoPlayerController: VideoPlayerController.network(
  //               'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'            ),
  //           autoplay: true,
  //           looping: true,
  //         ),
  //         VideoItems(
  //           videoPlayerController: VideoPlayerController.network(
  //               "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
  //           ),
  //           looping: true,
  //           autoplay: false,
  //         ),
  //       ],
  //     ),
  //   );



    @override
    Widget build(BuildContext context) {
      return ViewModelBuilder<VideoViewModel>.reactive(
          disposeViewModel: false,
          builder: (context, model, child) => videoScreen(),
          viewModelBuilder: () => videoViewModel);
    }

    Widget videoScreen() {
      return Scaffold(
        backgroundColor: GetIt.instance<VideoViewModel>().actualScreen == 0
            ?
              Colors.black
            : Colors.white,
        body: Stack(
          children: [
            PageView.builder(
              itemCount: 2,
              onPageChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
                if (value == 0) {
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
                } else {
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light);
                }
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return scrollFeed();
                } else {
                  return profileView();
                }
              },
            )
          ],
        ),
      );
    }

    Widget profileView() {
      return const SafeArea(
        child: ProfileScreen(uid: '11111', slideOutProfile: false),
      );
    }

    Widget scrollFeed() {
      return SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Expanded(child: feedVideos()),
        ],
      ));
    }

    Widget feedVideos() {
      return Stack(
        children: [
          PageView.builder(
            controller: PageController(
              initialPage: 0,
              viewportFraction: 1,
            ),
            itemCount: videoViewModel.videoSource?.listVideos.length,
            onPageChanged: (index) {
              index = index % (videoViewModel.videoSource!.listVideos.length);
              videoViewModel.changeVideo(index);
              // setState(() {
              //   getIndex = index;
              // });
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              index = index % (videoViewModel.videoSource!.listVideos.length);
              return VideoItems(
                videoPlayerController: VideoPlayerController.network(
                    "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
                ),
                looping: true,
                autoplay: false,
              );
              // index = index % (videoViewModel.videoSource!.listVideos.length);
              // return videoCard(videoViewModel.videoSource!.listVideos[index]);
            },
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(child: const Icon(Icons.arrow_back, color: whiteColor), onTap: (){
                      //videoViewModel.videoSource!.listVideos[getIndex].controller!.pause();
                      Get.back();
                    }),
                    const SizedBox(width: 7, height: 10),
                    // const Text('Following',
                    //     style: TextStyle(
                    //         fontSize: 17.0,
                    //         fontWeight: FontWeight.normal,
                    //         color: Colors.white70)),
                    // const SizedBox(width: 7,),
                    // Container(
                    //   color: Colors.white70,
                    //   height: 10,
                    //   width: 1.0,
                    // ),
                    // const SizedBox(
                    //   width: 7,
                    // ),
                    // const Text('For You',
                    //     style: TextStyle(
                    //         fontSize: 17.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white))
                  ]
              ),
            ),
          ),
        ],
      );
    }


    Widget videoCard(Video video) {
      return Stack(
        children: [
          video.controller != null && video.controller!.value.isPlaying
              ?
                GestureDetector(
                    onTap: () {
                      if (video.controller!.value.isPlaying) {
                        video.controller!.pause();
                        const Center(child: Icon(Icons.play_arrow, size: 60, color: Colors.grey,));
                      } else {
                        video.controller!.play();
                      }
                    },
                    child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: video.controller!.value.size.width ?? 0,
                            height: video.controller!.value.size.height ?? 0,
                            child:  CachedVideoPlayer(video.controller!),
                          ),
                        )
                    )
                )
              :
                Center(child: getCircularProgressIndicator()),

              //   GestureDetector(
              //     onTap: () {
              //       if (video.controller!.value.isPlaying) {
              //         video.controller?.pause();
              //       } else {
              //         video.controller?.play();
              //       }
              //     },
              //     child: SizedBox.expand(
              //         child: FittedBox(
              //           fit: BoxFit.cover,
              //           child: SizedBox(
              //             width: video.controller?.value.size.width ?? 0,
              //             height: video.controller?.value.size.height ?? 0,
              //             child: VideoPlayer(video.controller!),
              //           ),
              //         )
              //     ),
              //   )
              // : Center(child: getCircularProgressIndicator()),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  VideoDescription(video.user, video.videoTitle, video.songName, video.userPic),
                  VideoActionsToolbar(video.likes, video.comments,
                      "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
                ],
              ),
              const SizedBox(height: 2)
            ],
          ),
        ],
      );
    }

    @override
    void dispose() {
      videoViewModel.controller?.pause();
      videoViewModel.controller?.dispose();
      super.dispose();
    }

}
