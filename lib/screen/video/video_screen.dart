import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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


  @override
  void initState() {
    videoViewModel.loadVideo(0);
    videoViewModel.loadVideo(1);
    super.initState();
  }



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
              if (value == 1) {
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

      // floatingActionButton: FloatingActionButton(
      //   heroTag: "addVideoBtn",
      //   onPressed: () {navigateTo(context, '/pickvideo');},
      //   backgroundColor: primaryDeepColor,
      //   tooltip: 'Add New Video',
      //   elevation: 5,
      //   //splashColor: Colors.grey,
      //   child: const Icon(Icons.add_circle, color: Colors.white, size: 29,),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


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
          //controller: pageController,
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
          ),
          itemCount: videoViewModel.videoSource?.listVideos.length,
          onPageChanged: (index) {
            index = index % (videoViewModel.videoSource!.listVideos.length);
            videoViewModel.changeVideo(index);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            index = index % (videoViewModel.videoSource!.listVideos.length);
            return videoCard(videoViewModel.videoSource!.listVideos[index]);
          },
        ),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Filter',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white70)),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    color: Colors.white70,
                    height: 10,
                    width: 1.0,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('For You',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ]),
          ),
        ),
      ],
    );
  }


  Widget videoCard(Video video) {
    return Stack(
      children: [
        video.controller != null
            ? GestureDetector(
          onTap: () {
            if (video.controller!.value.isPlaying) {
              video.controller?.pause();
            } else {
              video.controller?.play();
            }
          },
          child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: video.controller?.value.size.width ?? 0,
                  height: video.controller?.value.size.height ?? 0,
                  child: VideoPlayer(video.controller!),
                ),
              )
          ),
        )
            : Center(
            child: getCircularProgressIndicator()
        ),
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
    videoViewModel.controller?.dispose();
    super.dispose();
  }
}
