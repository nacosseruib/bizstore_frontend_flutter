import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../model/story/data_story_model.dart';


class HomeStoryScreen extends SliverPersistentHeaderDelegate {
  HomeStoryScreen(this.size, {Key? key});
  final double size;

  final storyText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text("Trends", style: TextStyle(fontWeight: FontWeight.bold ),),
      Row(
        children: const [
          //Icon(Icons.play_arrow),
          Text("View More",style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      )
    ],
  );

  final storyProfile = Expanded(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dummyStoryData.length,
      itemBuilder: (context,index)=>Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:NetworkImage(dummyStoryData[index].profilepic),
                )
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          index == 0 ? const Positioned(
            right: 3.0,
            child: CircleAvatar(
              backgroundColor: primaryDeepColor,
              radius: 10.0,
              child: Icon(Icons.add,size: 14.0, color: whiteColor,),
            ),
          ): Container()
        ],
      ),
    ),
  );

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: size,
      margin: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         Container(
             margin: const EdgeInsets.only(left: 5.0, right: 5.0),
             child:  storyText
         ),  //check above image for understanding
          storyProfile
        ],
      ),

    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(HomeStoryScreen oldDelegate) {
    return oldDelegate.size != size;
  }
}