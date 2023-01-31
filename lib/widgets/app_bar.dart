import 'package:flutter/material.dart';

import '../components/constants.dart';




class AppBarWidget extends AppBar {
  final String? appTitle;
  final String? showTabBar;
  AppBarWidget({this.appTitle, this.showTabBar, super.key}) : super(
    title: Text(appTitle!, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

    leading: Builder(builder: (context) =>
        IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer()
        ),
    ),

        //More options - Right top Conner
      actions: [
        //InkWell(child: const Icon(Icons.nature_people_outlined), onTap:(){ VideoScreen(); }),
        //const SizedBox(width: 25),


        InkWell(child: const Icon(Icons.ondemand_video_sharp), onTap:(){ }),
        const SizedBox(width: 25),
        InkWell(child: const Icon(Icons.search), onTap:(){ }),
       PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            itemBuilder: (context) {
              return [
                // In this case, we need 5 popupmenuItems one for each option.
                const PopupMenuItem(child: Text('Rolls', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                const PopupMenuItem(child: Text('Search', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                const PopupMenuItem(child: Text('Create New Product', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                const PopupMenuItem(child: Text('Upload New Video', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                const PopupMenuItem(child: Text('Create New Post', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                const PopupMenuItem(child: Text('Create New Group', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
              ];
            },
        ),
       ],

    bottom: const TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: whiteColor,
      indicatorWeight: 3,
      labelColor: Colors.white,
      //unselectedLabelColor: Colors.white60,
      isScrollable: true,
      tabs: [
        Tab(
          child: Text('Chats', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
        ),
        Tab(
          child: Text('Groups', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
        ),
        Tab(
          child: Text('Post', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
        ),
        Tab(
          child: Icon(Icons.store_outlined, size: 25,),
        ),
      ],
    ),

  );
}