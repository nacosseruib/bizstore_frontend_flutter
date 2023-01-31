import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../components/constants.dart';
import '../../controller/profile/profile_controller.dart';


class ProfileScreen  extends StatefulWidget {
  final String uid;
  final bool? slideOutProfile;
  const ProfileScreen ({Key? key, required this.uid, this.slideOutProfile}) : super(key: key);
  @override
  State<ProfileScreen > createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen > with SingleTickerProviderStateMixin {
  late final ProfileController profileController = Get.put(ProfileController());
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) { //controller.user.isEmpty
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: ProfileAppbar(MediaQuery.of(context).size.width, userController: controller),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 35),
                        const Text(
                          "@ajaxsamson",
                          style:  TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.user['name'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        ProfileIconButtons(userController: controller)
                      ],
                    ),
                  ),
                  const ProfileBody()
                ],
              ),
            ),
          );
        }
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(const [
          SizedBox(height: 20),
          ListTile(
            title: Text("Custom Notifications"),
            leading: Icon(Icons.notification_add),
          ),
          ListTile(
            title: Text("Disappearing messages"),
            leading: Icon(Icons.message),
          ),
          ListTile(
            title: Text("Mute Notifications"),
            leading: Icon(Icons.mic_off),
          ),
          ListTile(
            title: Text("Media visibility"),
            leading: Icon(Icons.save),
          ),
          SizedBox(
            height: 350,
          ),
        ]));
  }
}

class ProfileIconButtons extends StatelessWidget {
  final ProfileController userController;

  ProfileIconButtons({Key? key, required this.userController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              userController.user['following'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 15,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        Column(
          children: [
            Text(
              userController.user['followers'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Followers',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 15,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        Column(
          children: [
            Text(
              userController.user['likes'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Services',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  Tween<double>? profilePicTranslateTween;
  ProfileController userController;

  ProfileAppbar(this.screenWidth, {required this.userController}) {
    profilePicTranslateTween = Tween<double>(begin: screenWidth / 2 - 45 - 40 + 15, end: 40.0);
  }

  static final appBarColorTween = ColorTween(begin: Colors.black54, end: Colors.black);

  static final appbarIconColorTween = ColorTween(begin: Colors.black54, end: Colors.black);

  static final UserNameTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final UserNameFontSizeTween = Tween<double>(begin: 20.0, end: 16.0);

  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;
    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () { Get.back(); },
              icon: const Icon(Icons.arrow_back, size: 25, color: whiteColor),
              //color: appbarIconColorTween.transform(relativeScroll),
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, size: 25, color: whiteColor),
              //color: appbarIconColorTween.transform(relativeScroll),
            ),
          ),
          Positioned(
              top: 15, left: 90, child: displayUserName(relativeScroll70px)),
          Positioned(
              top: 5,
              left: profilePicTranslateTween!.transform(relativeScroll70px),
              child: displayProfilePicture(relativeScroll70px)),
        ],
      ),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          userController.user['profilePhoto'],
          // placeholder: (context, url) =>
          // const CircularProgressIndicator(),
          // errorWidget: (context, url, error) =>
          // const Icon(Icons.error, size: 30,),
        ),
      ),
    );
  }

  Widget displayUserName(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.8) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            0.0,
            UserNameTranslateTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
          ),
        child: Text(
          userController.user['name'],
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: UserNameFontSizeTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(ProfileAppbar oldDelegate) {
    return true;
  }
}