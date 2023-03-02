import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../screen/chat/view_details_chat_image_screen.dart';


class CustomChatBubblesText extends StatelessWidget {
  final bool isSender;
  final String text;
  final String id;
  final String image;
  final String video;
  final String audio;
  final String file;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final String dateTime;
  final double vPadding;
  final double hPadding;
  final void Function()? onTap;

   const CustomChatBubblesText({
    Key? key,
    this.isSender = true,
    this.text = "",
    this.id = "",
    this.image = "",
    this.video = "",
    this.audio = "",
    this.file = "",
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.dateTime = "",
    this.vPadding = 1.5,
    this.hPadding = 4.0,
    this.onTap,
  }) : super(key: key);


  // //Determine the Chat Bubbles Tails
  // int senderCount = 0;
  // int receiverCount = 0;
  // if(isSender == true){
  // senderCount += 1;
  // receiverCount = 0;
  // }else{
  // senderCount = 0;
  // receiverCount += 1;
  // }
  // if(senderCount <= 1){
  // tail = true;
  // }else{
  // tail = false;
  // }
  // if(receiverCount <= 1){
  // tail = true;
  // }else{
  // tail = false;
  // }


  //Network Image Widget
  Widget imageWidget(String imageUrl){
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        fadeInCurve: Curves.easeOut,
        alignment: Alignment.topCenter,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            getCircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.download_for_offline, color: greyColor, size: 40,),
      );
  }
  //Image Widget
  Widget chatImageWidget(String imageUrl){
    var errorLoadingImg = "";
    return Container(
        constraints: const BoxConstraints(
          // maxHeight: 300,
          // minHeight: 100,
        ),
        padding: const EdgeInsets.only(bottom: 0.0),
        width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Center(
          child: imageWidget(imageUrl),
        )
      )
    );
  }

  //Content Media Widget
  Widget contentMediaWidget(String id, bool stateTick, String? text, String mediaUrl, String mediaType, bool isSender) {
    return Hero(
          tag: id,
          child: GestureDetector(
            onTap: () {
              Get.to(()=> ViewDetailsChatImageScreen(tag: id, image: imageWidget(mediaUrl)));
            },
            child: Padding(
              padding: stateTick
                ? const EdgeInsets.only(right: 0, bottom: 0)
                : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: mediaType == "image"
                      ? chatImageWidget(mediaUrl)   //show image else
                      : chatImageWidget(mediaUrl),   //other media video, audio, etc
          ),
        )
    );
  }


  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    //Get system Theme mode - SET BUBLLES BACKGROUD AND COLOR AND Chat text style
    final bool getCurrentTheme = Theme.of(context).brightness == Brightness.dark;
    Color getBgBubbleColor;
    TextStyle chatTextStyle;
    if(getCurrentTheme == true){
      getBgBubbleColor = isSender ? chatSenderColor : chatReceiverColorDark;
      chatTextStyle = TextStyle(color: isSender == true ? whiteDeemColor : whiteDeemColor, fontSize: 16);
    }else{
      getBgBubbleColor = isSender ? chatSenderColor : chatReceiverColor;
      chatTextStyle = TextStyle(color: isSender == true ? whiteColor : blackColor, fontSize: 16);
    }

    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Colors.grey,
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Colors.grey,
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Colors.lightBlue,
      );
    }


    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: CustomPaint(
          painter: CustomChatBubblesSpecial(
              color: getBgBubbleColor,
              alignment: isSender ? Alignment.topRight : Alignment.topLeft,
              tail: tail
          ),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .8,
                minWidth: MediaQuery.of(context).size.width * .23,
            ),
            margin: isSender
                ? stateTick
                  ? EdgeInsets.fromLTRB(3, 3, 12, 3)
                  : EdgeInsets.fromLTRB(3, 3, 12, 3)
                : EdgeInsets.fromLTRB(12, 3, 3, 3),
            child: Stack(
              children: <Widget>[
                video != ""
                ?
                  contentMediaWidget(id, stateTick, text, video, "video", isSender)
                :  audio != ""
                ?
                  contentMediaWidget(id, stateTick, text, audio, "audio", isSender)
                : file != ""
                ?
                  contentMediaWidget(id, stateTick, text, file, "file", isSender)
                : image != ""
                ?
                  Column(
                      children: [
                        contentMediaWidget(id, stateTick, text, image, "image", isSender),
                        text != ""
                            ? Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text(text, style: chatTextStyle, textAlign: TextAlign.left,),
                              )
                            : Container()
                    ],
                  )
                :
                  Padding(
                      padding: stateTick
                          ? const EdgeInsets.only(right: 2, bottom: 15, left: 4)
                          : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      child: Text(text, style: chatTextStyle, textAlign: TextAlign.left,),
                  ),

                  Positioned(
                      bottom: 0, right: 20,
                      child: Text(dateTime, style: TextStyle(color: isSender ? chatReceiverColor : chatSenderColor, fontSize: 13),)
                  ),
                  stateIcon != null && stateTick ? Positioned(bottom: 0, right: 0, child: stateIcon,) : const SizedBox(width: 1,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



///custom painter use to create the shape of the chat bubble
///
/// [color],[alignment] and [tail] can be changed

class CustomChatBubblesSpecial extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  CustomChatBubblesSpecial({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  double _radius = 20.0;
  double _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (alignment == Alignment.topRight) {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        var path = Path();
        path.moveTo(size.width - _x, 0);
        path.lineTo(size.width - _x, 10);
        path.lineTo(size.width, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              size.width - _x,
              0.0,
              size.width,
              size.height,
              topRight: Radius.circular(3),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        var path = Path();
        path.moveTo(_x, 0);
        path.lineTo(_x, 10);
        path.lineTo(0, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0.0,
              _x,
              size.height,
              topLeft: Radius.circular(3),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
