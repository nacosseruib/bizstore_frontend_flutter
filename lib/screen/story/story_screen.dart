import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../model/story/data_story_model.dart';
import '../../widgets/ripple_effect/ripple_animation.dart';


class StoryScreen extends SliverPersistentHeaderDelegate {
  StoryScreen(this.size, {Key? key});
  final double size;

  final storyText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text("Stories", style: TextStyle(fontWeight: FontWeight.bold ),),
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
        alignment: Alignment.center,
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              color: primaryDeepColor,
              boxShadow: const [
                BoxShadow(blurRadius: 1),
              ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: customAdvanceNetworkImage(dummyStoryData[index].profilepic),
                ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          index == 0
              ? const Positioned(
                  left: 50.0,
                  bottom: 20,
                  child: CircleAvatar(
                    backgroundColor: flashColor,
                    radius: 10.0,
                    //child: RipplesAnimation(child: Icon(Icons.add),),
                    child: Icon(Icons.add,size: 15.0, color: whiteColor,),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 68.0, right: 0.0, bottom: 0.0),
                  child: Text(dummyStoryData[index].name,
                      style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                  ),

                )
        ],
      ),
    ),
  );

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: size,
      margin: const EdgeInsets.only(left: 2.0, top: 0.0, right: 2.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         Container(
             margin: const EdgeInsets.only(left: 7.0, top: 5.0, right: 7.0, bottom: 0.0),
             child:  storyText
         ),
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
  bool shouldRebuild(StoryScreen oldDelegate) {
    return oldDelegate.size != size;
  }
}