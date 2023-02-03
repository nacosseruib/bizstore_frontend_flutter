import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/constants.dart';
import '../../widgets/drawer_bar.dart';
import '../chat/chat_list_screen.dart';
import '../post/post_list.dart';
import '../video/video_screen.dart';
import 'home_story_screen.dart';


  class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
  }

  class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
    late AnimationController _ColorAnimationController;
    late AnimationController _TextAnimationController;
    late Animation _colorTween, _iconColorTween;
    late Animation<Offset> _transTween;

    @override
    void initState() {
      _ColorAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
      _colorTween = ColorTween(begin: Colors.transparent, end: const Color(0xFFee4c4f)).animate(_ColorAnimationController);
      _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.white).animate(_ColorAnimationController);
      _TextAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 0));
      _transTween = Tween(begin: const Offset(-10, 40), end: Offset(-10, 0)).animate(_TextAnimationController);
      super.initState();
    }
    bool scrollListener(ScrollNotification scrollInfo) {
      if (scrollInfo.metrics.axis == Axis.vertical) {
        _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);
        _TextAnimationController.animateTo((scrollInfo.metrics.pixels - 350) / 50);
        return true;
      }else{
        return false;
      }
    }


    @override
  Widget build(BuildContext context) {
    //final List<String> tabs = <String>['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          drawer: const DrawerBar(),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                 SliverAppBar(
                   //expandedHeight: 45,
                    title: Row(
                      children:  [
                        InkWell(child:  const Icon(Icons.menu), onTap:(){ Scaffold.of(context).openDrawer(); }),
                        const SizedBox(width: 25),
                        const Text('Biztore'),
                      ],
                    ),
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    floating: true,
                    actions: [
                      InkWell(child: const Icon(Icons.ondemand_video_sharp), onTap:(){ Get.to(() => VideoScreen()); }),
                      const SizedBox(width: 25),
                      InkWell(child: const Icon(Icons.search), onTap:(){ }),
                      PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        itemBuilder: (context) {
                          return [
                            // In this case, we need 5 popupmenuItems one for each option.
                            const PopupMenuItem(child: Text('Scene', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                            const PopupMenuItem(child: Text('Search', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                            const PopupMenuItem(child: Text('Create New Product', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                            const PopupMenuItem(child: Text('Upload New Video', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                            const PopupMenuItem(child: Text('Create New Post', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                            const PopupMenuItem(child: Text('Create New Group', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          ];
                        },
                      ),
                    ],
                    elevation: 0.0,
                ),
                SliverPersistentHeader(delegate: HomeStoryScreen(70.0)),
                SliverPersistentHeader(pinned: true, delegate: HomeAppTabs(50.0, scrollListener)),
              ];
            },
            body: const TabBarView(
                  children: [
                    ChatListScreen(),
                    ChatListScreen(),
                    PostList(),
                    Center(child: Text('Store Here')),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class HomeAppTabs extends SliverPersistentHeaderDelegate {
  final double size;
  bool Function(ScrollNotification) scrollListener;
  HomeAppTabs(this.size, this.scrollListener);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
        return Scaffold(
            body: NotificationListener<ScrollNotification>(
            onNotification: scrollListener,
            child:Container(
              height: size,
              child: const TabBar(
                indicatorWeight: 3,
                isScrollable: true,
                tabs: [
                  Tab(child: Text('Chats', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
                  Tab(child: Text('Groups', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
                  Tab(child: Text('Post', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
                  Tab(child: Text('Services', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
                  //Tab(icon: Icon(Icons.store_outlined, size: 25, textDirection: TextDirection.ltr,)),
                ],
              ),
            )
          )
        );

  }
  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(HomeAppTabs oldDelegate) {
    return oldDelegate.size != size;
  }
}
