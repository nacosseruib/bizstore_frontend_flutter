import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/constants.dart';


/// detail screen of the image, display when tap on the image bubble
class ViewDetailsChatImageScreen extends StatefulWidget {
  final String tag;
  final Widget image;

  const ViewDetailsChatImageScreen({Key? key, required this.tag, required this.image}) : super(key: key);

  @override
  ViewDetailsChatImageScreenState createState() => ViewDetailsChatImageScreenState();
}

/// created using the Hero Widget
class ViewDetailsChatImageScreenState extends State<ViewDetailsChatImageScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          leading: IconButton( onPressed: () { Get.back(); }, icon: const Icon(Icons.arrow_back),),
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 0.0),
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 70,),
                  IconButton( onPressed: () { },  tooltip: 'Star', color: whiteColor, iconSize: 25, icon: const Icon(Icons.message),),
                  IconButton( onPressed: () { },  tooltip: 'Share', color: whiteColor, iconSize: 25, icon: const Icon(Icons.share),),
                  IconButton( onPressed: () { },  tooltip: 'Download', color: whiteColor, iconSize: 25, icon: const Icon(Icons.download),),
                  IconButton( onPressed: () { },  tooltip: 'Star', color: whiteColor, iconSize: 25, icon: const Icon(Icons.star),),
                ],
              ),
            ),
          ),
        ),
    body: Hero(
        tag: widget.tag,
        child: Scaffold(
          body: Center(
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: widget.image,
              ),
          ),
        ),
      )
    );
  }
}
