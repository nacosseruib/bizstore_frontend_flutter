import 'package:video_player/video_player.dart';

class Video {
  String id;
  String user;
  String userPic;
  String videoTitle;
  String songName;
  String likes;
  String comments;
  String url;

  VideoPlayerController? controller;

  Video(
      {required this.id,
      required this.user,
      required this.userPic,
      required this.videoTitle,
      required this.songName,
      required this.likes,
      required this.comments,
      required this.url});

  Video.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        user = json['user'],
        userPic = json['user_pic'],
        videoTitle = json['video_title'],
        songName = json['song_name'],
        likes = json['likes'],
        comments = json['comments'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['user_pic'] = this.userPic;
    data['video_title'] = this.videoTitle;
    data['song_name'] = this.songName;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['url'] = this.url;
    return data;
  }

  Future<Null> loadController() async {
    controller = VideoPlayerController.network(url);
    await controller?.initialize();
    controller?.setLooping(true);
  }


  static List<Video> videoData = [
    Video(
      id: '1',
      comments : '21',
      likes : '3.2k',
      songName : 'Song Title 1 - Artist 1',
      //url : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/4.mp4?alt=media&token=517ad60c-ca28-400e-ab46-49fb8c122d75',
        url : 'https://assets.mixkit.co/videos/preview/mixkit-young-woman-waking-up-in-the-morning-42896-large.mp4',
      user : 'user1',
      userPic : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile1.jpg?alt=media&token=567ea332-04e8-4c64-afb0-8152c6f12fec',
      videoTitle : 'Video 1'
    ),
    Video(
      id: '2',
      comments : '1',
      likes : '35k',
      songName : 'Song Title 2 - Artist 2',
      //url : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/1.mp4?alt=media&token=36032747-7815-473d-beef-061098f08c18',
        url : 'https://assets.mixkit.co/videos/preview/mixkit-white-sand-beach-and-palm-trees-1564-large.mp4',
      user : 'user2',
      userPic : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile2.jpeg?alt=media&token=b1fdd00d-5d6e-4705-980d-4ef3e70ff6c5',
      videoTitle : 'Video 2'
    ),
    Video(
      id: '3',
      comments : '434',
      likes : '21.4k',
      songName : 'Song Title 3 - Artist 3',
      //url : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/3.mp4?alt=media&token=a7ccda22-7264-4c64-9328-86a4c2ec31cd',
        url : 'https://assets.mixkit.co/videos/preview/mixkit-close-tour-through-the-middle-of-an-open-book-42926-large.mp4',
      user : 'user3',
      userPic : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile3.jpg?alt=media&token=d65b2ed7-4164-4149-a5c7-8620201e8411',
      videoTitle : 'Video 3'
    ),
    Video(
      id: '4',
      comments : '66',
      likes : '3m',
      songName : 'Song Title 4 - Artist 4',
      //url : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/2.mp4?alt=media&token=b6218221-6699-402b-8b89-7e3354ac32dc',
        url : 'https://assets.mixkit.co/videos/preview/mixkit-top-aerial-shot-of-seashore-with-rocks-1090-large.mp4',
      user : 'user4',
      userPic : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile4.jpg?alt=media&token=399ca1f4-2017-4f48-af21-0aa6a7b17550',
      videoTitle : 'Video 4'
    ),
    Video(
      id: '5',
      comments : '54',
      likes : '1.1k',
      songName : 'Song Title 5 - Artist 5',
      //url : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/5.mp4?alt=media&token=965a0494-7aaf-4248-85c5-fefac581ee7f',
        url : 'https://assets.mixkit.co/videos/preview/mixkit-woman-flipping-her-egg-omelet-42910-large.mp4',
      user : 'user5',
      userPic : 'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
      videoTitle : 'Video 5'
    ),
    Video(
      id: "6",
      comments : "43",
      likes : "5.2k",
      songName : "Song Title 6 - Artist 6",
      //url : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/7.mp4?alt=media&token=2f6a3c9b-bfc4-483e-ad5b-bb7d539ee765",
        url : 'https://assets.mixkit.co/videos/preview/mixkit-woman-preparing-her-lunch-in-the-morning-42908-large.mp4',
      user : "user6",
      userPic : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
      videoTitle : "Video 6"
    ),
    Video(
      id: "7",
      comments : "12",
      likes : "5k",
      songName : "Song Title 6 - Artist 6",
      //url : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/8.mp4?alt=media&token=87e20ffd-2b5c-422a-ad85-33b90b4e2169",
        url : 'https://assets.mixkit.co/videos/preview/mixkit-very-close-shot-of-the-leaves-of-a-tree-wet-18310-large.mp4',
      user : "user6",
      userPic : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
      videoTitle : "Video 7"
    ),
    // Video(
    //   id: "8",
    //   comments : "33",
    //   likes : "4.2k",
    //   songName : "Song Title 6 - Artist 6",
    //   //url : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/9.mp4?alt=media&token=83911bd2-6083-43d1-824e-2049f1fb11e7",
    //     url: 'https://assets.mixkit.co/videos/preview/mixkit-fresh-apples-in-a-row-on-a-natural-background-42946-large.mp4',
    //   user : "user6",
    //   userPic : "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
    //   videoTitle : "Video 8"
    // ),
    // Video(
    //     id: "9",
    //     comments : "43",
    //     likes : "15.2k",
    //     songName : "Song Title 6 - Artist 6",
    //     //url : "https://www.fluttercampus.com/video.mp4",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-lots-of-chips-and-dice-arranged-on-a-game-table-42931-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 9"
    // ),
    // Video(
    //     id: "10",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 6 - Artist 6",
    //     //url : "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-close-up-shot-of-a-computers-internal-system-42924-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 10"
    // ),
    // Video(
    //     id: "11",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 11 - Artist 11",
    //     //url : "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-huge-trees-in-a-large-green-forest-5040-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 11"
    // ),
    // Video(
    //     id: "12",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 12 - Artist 12",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-fireworks-illuminating-the-beach-sky-4157-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 12"
    // ),
    // Video(
    //     id: "13",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 13 - Artist 13",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-stars-in-space-1610-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 13"
    // ),
    // Video(
    //     id: "14",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 14 - Artist 14",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-people-pouring-a-warm-drink-around-a-campfire-513-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 14"
    // ),
    // Video(
    //     id: "15",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 15 - Artist 15",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-rain-falling-on-the-water-of-a-lake-seen-up-18312-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 15"
    // ),
    // Video(
    //     id: "16",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 16 - Artist 16",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-young-woman-taking-a-shower-42916-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 16"
    // ),
    // Video(
    //     id: "17",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 17 - Artist 17",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-frying-diced-bacon-in-a-skillet-43063-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 17"
    // ),
    // Video(
    //     id: "18",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 18 - Artist 18",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-curvy-road-on-a-tree-covered-hill-41537-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 18"
    // ),
    // Video(
    //     id: "19",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 19 - Artist 19",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-aerial-panorama-of-a-landscape-with-mountains-and-a-lake-4249-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 19"
    // ),
    // Video(
    //     id: "20",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 20 - Artist 21",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-lake-surrounded-by-dry-grass-in-the-savanna-5030-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 20"
    // ),
    // Video(
    //     id: "21",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 21 - Artist 21",
    //     url :   'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-down-a-mountain-41576-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 21"
    // ),
    // Video(
    //     id: "22",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 22 - Artist 22",
    //     url :  'https://assets.mixkit.co/videos/preview/mixkit-close-up-view-of-a-rotating-vinyl-record-42922-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 22"
    // ),
    // Video(
    //     id: "23",
    //     comments : "23",
    //     likes : "11.2k",
    //     songName : "Song Title 23 - Artist 23",
    //     url : 'https://assets.mixkit.co/videos/preview/mixkit-waterfall-in-forest-2213-large.mp4',
    //     user : "user6",
    //     userPic : "https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png",
    //     videoTitle : "Video 23"
    // ),


  ];
}
