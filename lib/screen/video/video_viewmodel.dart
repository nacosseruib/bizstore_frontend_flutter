import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import '../../../controller/video/video_controller.dart';



class VideoViewModel extends BaseViewModel {
  CachedVideoPlayerController? controller;
  VideosAPI? videoSource;

  int prevVideo = 0;

  int actualScreen = 0;

  VideoViewModel() {
    videoSource = VideosAPI();
  }

  changeVideo(index) async {
    if (videoSource!.listVideos[index].controller == null) {
      await videoSource!.listVideos[index].loadController();
      videoSource!.listVideos[index].controller!.initialize();
      videoSource!.listVideos[index].controller!.play();
      notifyListeners();
    }
    //videoSource?.listVideos[prevVideo].controller?.removeListener(() {});
    if (videoSource!.listVideos[prevVideo].controller != null) {
      videoSource!.listVideos[prevVideo].controller!.pause();
    }
    prevVideo = index;
    notifyListeners();

    if (kDebugMode) {
      print(index);
    }
  }

  void loadVideo(int index) async {
    int videoLength = videoSource!.listVideos.length;
    for(int i = 0; i <= videoLength; i++) {
      // Create a CachedVideoPlayerController and specify the video file
      await videoSource!.listVideos[i].loadController();
      videoSource!.listVideos[i].controller!.initialize().then((_) {
       if(i < 1){
         videoSource!.listVideos[i].controller?.play();
         notifyListeners();
       }
      });


    }
    // if (videoSource!.listVideos.length > index) {
    //   await videoSource!.listVideos[index].loadController();
    //   videoSource!.listVideos[index].controller!.initialize();
    //   videoSource!.listVideos[index].controller?.play();
    //   notifyListeners();
    // }
  }

  void setActualScreen(index) {
    actualScreen = index;
    if (index == 0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }

}
