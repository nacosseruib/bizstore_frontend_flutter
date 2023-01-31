import 'package:get/get.dart';


class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get user => _user.value;
  Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    List<String> thumbnails = [];
    // var myVideos = await firestore
    //     .collection('videos')
    //     .where('uid', isEqualTo: _uid.value)
    //     .get();

    // for (int i = 0; i < myVideos.docs.length; i++) {
    //   thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
    // }

    // DocumentSnapshot userDoc =
    //     await firestore.collection('users').doc(_uid.value).get();
    // final userData = userDoc.data()! as dynamic;
    // String name = userData['name'];
    // String profilePhoto = userData['profilePhoto'];
    // int likes = 0;
    // int followers = 0;
    // int following = 0;
    // bool isFollowing = false;
    //
    // for (var item in myVideos.docs) {
    //   likes += (item.data()['likes'] as List).length;
    // }
    // var followerDoc = await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('followers')
    //     .get();
    // var followingDoc = await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('following')
    //     .get();
    // followers = followerDoc.docs.length;
    // following = followingDoc.docs.length;
    //
    // firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('followers')
    //     .doc(authController.user.uid)
    //     .get()
    //     .then((value) {
    //   if (value.exists) {
    //     isFollowing = true;
    //   } else {
    //     isFollowing = false;
    //   }
    // });

    _user.value = {
      'followers': '210', //followers.toString(),
      'following': '32k', //following.toString(),
      'isFollowing': true, //isFollowing,
      'likes': '39', //likes.toString(),
      'profilePhoto': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png', //profilePhoto,
      'name': 'Ajax Toss', //name,
      'thumbnails': [
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png',
        'https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png',
        'https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png',
        'https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png',
        'https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/Sample-Video-File.png',
        'https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
        'https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c',
      ], //thumbnails,
    };
    // update();
  }

  followUser() async {
    // var doc = await firestore
    //     .collection('users')
    //     .doc(_uid.value)
    //     .collection('followers')
    //     .doc(authController.user.uid)
    //     .get();
    //
    // if (!doc.exists) {
    //   await firestore
    //       .collection('users')
    //       .doc(_uid.value)
    //       .collection('followers')
    //       .doc(authController.user.uid)
    //       .set({});
    //   await firestore
    //       .collection('users')
    //       .doc(authController.user.uid)
    //       .collection('following')
    //       .doc(_uid.value)
    //       .set({});
    //   _user.value.update(
    //     'followers',
    //     (value) => (int.parse(value) + 1).toString(),
    //   );
    // } else {
    //   await firestore
    //       .collection('users')
    //       .doc(_uid.value)
    //       .collection('followers')
    //       .doc(authController.user.uid)
    //       .delete();
    //   await firestore
    //       .collection('users')
    //       .doc(authController.user.uid)
    //       .collection('following')
    //       .doc(_uid.value)
    //       .delete();
    //   _user.value.update(
    //     'followers',
    //     (value) => (int.parse(value) - 1).toString(),
    //   );
    // }
    // _user.value.update('isFollowing', (value) => !value);
    // update();
  }
}
