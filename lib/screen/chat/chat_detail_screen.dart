import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../components/components.dart';
import '../../components/constants.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../../widgets/chat/custom_chat_bubbles_text.dart';



class ChatDetailScreen extends StatefulWidget{
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {

  dynamic _chatListArgumentData = Get.arguments;
  final TextEditingController _sendChatMessageController = TextEditingController();
  late Widget _changeChatSendButton = recordMediaButton();
  final _chatTextFieldfocusNode = FocusNode();
  bool emojiShowing = false;
  Icon emojiIcon = Icon(Icons.insert_emoticon, size: 30,);
  double containerBelowChatTextFieldSize = 0.0;
  bool attachmentShowHide = true;
  ScrollController chatChildScrollViewController = ScrollController();




  //Show system keyboard
  void showKeyboard() async {
    _chatTextFieldfocusNode.requestFocus();
  }

  //dismiss system keyboard
  void dismissKeyboard() async {
      _chatTextFieldfocusNode.unfocus();
      FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
      _chatTextFieldfocusNode.addListener(() {
        setState(() {
          if(_chatTextFieldfocusNode.hasFocus) {
            emojiIcon = const Icon(Icons.insert_emoticon, size: 30,);
            emojiShowing = false;
            containerBelowChatTextFieldSize = 0.0;
          }
        });
    });
  }

  @override
  void dispose() {
    _chatTextFieldfocusNode.dispose();
    super.dispose();
  }

  _showEmojiIcons(){
    dismissKeyboard();
    Future.delayed(const Duration(milliseconds: 5), () {
      return setState(() {
        emojiShowing = !emojiShowing;
        if(emojiShowing){
          //dismissKeyboard();
            containerBelowChatTextFieldSize = 235.0;
            emojiIcon = const Icon(Icons.keyboard, size: 30,);
        }else{
          emojiIcon = const Icon(Icons.insert_emoticon, size: 30,);
          containerBelowChatTextFieldSize = 0.0;
          showKeyboard();
        }
      });
    });
  }
  _onEmojiSelected(Emoji emoji) {
    setState(() {
      //_sendChatMessageController.text += emoji.emoji;
      if(_sendChatMessageController.text == "") {
        _changeChatSendButton = recordMediaButton();
        attachmentShowHide = true;
      }else{
        _changeChatSendButton = sendMessageButton();
        attachmentShowHide = false;
      }
    });
  }

  _onBackspacePressed() {
    _sendChatMessageController
      ..text = _sendChatMessageController.text.characters.skipLast(0).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _sendChatMessageController.text.length));
      setState(() {
        if(_sendChatMessageController.text == "") {
          _changeChatSendButton = recordMediaButton();
        }else{
          _changeChatSendButton = sendMessageButton();
        }
      });
  }


  Widget sendMessageButton() {
    return IconButton(
      onPressed: () {},
      tooltip: 'Send',
      color: whiteColor,
      icon: const Icon(Icons.send, size: 25.0),
      hoverColor: primaryLightColor,
      splashColor: flashColor,
      padding: const EdgeInsets.only(left: 2.0),
    );
  }

  Widget recordMediaButton() {
    return IconButton(
      onPressed: () {},
      tooltip: 'Record',
      color: whiteColor,
      icon: const Icon(Icons.keyboard_voice, size: 25.0),
      hoverColor: primaryLightColor,
      splashColor: flashColor,
      padding: const EdgeInsets.only(bottom: 2.0),
    );
  }

  Widget emojiWidget(Color textFormFieldThemeColor) {
    return Expanded(
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Offstage(
          offstage: !emojiShowing,
          child: SizedBox(
              height: 235,
              child: EmojiPicker(
                textEditingController: _sendChatMessageController,
                onEmojiSelected: (category, emoji) {
                  _onEmojiSelected(emoji);
                },
                onBackspacePressed: _onBackspacePressed,
                config: Config(
                  columns: 7,
                  emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: textFormFieldThemeColor,
                  indicatorColor: primaryLightColor,
                  iconColor: Colors.grey,
                  iconColorSelected: primaryLightColor,
                  backspaceColor: primaryLightColor,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  showRecentsTab: true,
                  recentsLimit: 28,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ), // Needs to be const Widget
                  loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                ),
              ),
          ),
        ),

      ),
    );
  }

  Widget messageInputBar(Color textFormFieldThemeColor, Color textFormFieldThemeColorBorder, Color textFieldColor) {
      return Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 5, top: 3),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: textFormFieldThemeColor,
                      border: Border.all(
                        color: textFormFieldThemeColorBorder,
                        width: 2,
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () { _showEmojiIcons(); },
                        //tooltip: 'Emoticon',
                        color: primaryDeepColor,
                        icon: emojiIcon,
                        hoverColor: primaryLightColor,
                        splashColor: flashColor,
                        padding: const EdgeInsets.only(bottom: 0.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _sendChatMessageController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            //labelText: 'Type your message',
                            hintText: 'Type your message',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.only(
                                left: 2.0,
                                right: 2.0,
                                bottom: 12.0,
                                top: 12.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                  borderRadius: BorderRadius.circular(100)
                            ) ,
                            focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(100)
                            ) ,
                            border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                          maxLines: 6,
                          minLines: 1,
                          cursorWidth: 1.5,
                          cursorColor: primaryDeepColor,
                          cursorHeight: 29,
                          textAlignVertical: TextAlignVertical.center,
                          scrollPadding: const EdgeInsets.all(1),
                          restorationId: 'non-null',
                          style: TextStyle(color: textFieldColor, fontSize: 20, fontWeight: FontWeight.w400),
                          focusNode: _chatTextFieldfocusNode,
                          onChanged: (text) {
                            setState(() {
                                if(_sendChatMessageController.text == "") {
                                  _changeChatSendButton = recordMediaButton();
                                  attachmentShowHide = true;
                                }else{
                                  _changeChatSendButton = sendMessageButton();
                                  attachmentShowHide = false;
                                }
                              });
                          },
                        ),
                      ),
                      SizedBox(
                         child: attachmentShowHide == true ? IconButton(
                              onPressed: () {},
                              tooltip: 'Attach',
                              color: primaryDeepColor,
                              icon: const Icon(Icons.attach_file_rounded, size: 30.0),
                              hoverColor: primaryLightColor,
                              splashColor: flashColor,
                              padding: const EdgeInsets.only(bottom: 1.0),
                            ) : const SizedBox(width: 15.0),
                       ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5.0,),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 23,
                backgroundColor: primaryLightColor,
                child: _changeChatSendButton ?? recordMediaButton(),
              ),
            ),
          ],
        ),
      );
   }

   @override
   Widget build(BuildContext context) {
     //Set TextFormField Theme Color
     final bool getCurrentTheme = Theme.of(context).brightness == Brightness.dark;

     Color textFormFieldThemeColor, textFormFieldThemeColorBorder, textFieldColor;
     if(getCurrentTheme == true){
       textFormFieldThemeColor = chatReceiverColorDark;
       textFormFieldThemeColorBorder = blackLightColor;
       textFieldColor = whiteColor;
     }else{
       textFormFieldThemeColor = chatReceiverColor;
       textFormFieldThemeColorBorder = Color(0xFFE0E0E0);
       textFieldColor = blackColor;
     }

     //Get Chat Backgroud Image
     final String chatBgWallpaper = getCurrentTheme == true ? chatBgWallpaperDark : chatBgWallpaperLight;

     return WillPopScope(
          child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 0.0),
                child: Row(
                  children: [
                    IconButton( onPressed: () { Get.back(); }, color: whiteColor, icon: const Icon(Icons.arrow_back), hoverColor: primaryLightColor,),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: customAdvanceNetworkImage(_chatListArgumentData[1]['chatPhoto']),
                      backgroundColor: primaryDeepColor,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_chatListArgumentData[0]['chatName'], style: TextStyle(color: whiteColor, fontSize: 20, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 1,),
                          const Text("online", style: TextStyle(color: whiteColor, fontSize: 14),),
                        ],
                      ),
                    ),
                    IconButton( onPressed: () { },  tooltip: 'Audio Call', color: whiteColor, iconSize: 25, icon: const Icon(Icons.call), hoverColor: primaryLightColor,),
                    IconButton( onPressed: () { },  tooltip: 'Video Call', color: whiteColor, iconSize: 30, icon: const Icon(Icons.videocam_outlined), hoverColor: primaryLightColor,),
                    PopupMenuButton(
                      icon: const Icon(Icons.more_vert, color: whiteColor,),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(child: Text('Search', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Profile', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Mute Notifications', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Select Message', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Delete Chat', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Report', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                          const PopupMenuItem(child: Text('Block', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17))),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: greyColor,
              image: DecorationImage(
                  image: AssetImage(chatBgWallpaper),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: chatChildScrollViewController,
                  restorationId: "chatScroll",
                  reverse: true,
                  child: Column(
                    children: [
                        DateChip(
                            date: DateTime(2023, 02, 21),
                        ),
                      CustomChatBubblesText(
                        id: "1",
                        text: 'Hello dude, i wanna send you the photo now! Hello dude, Hello dude, eh eneef i wanna send you the photo now! i wanna send you the photo now! Hello dude, i wanna send you the photo now!',
                        dateTime: "03:02 pm",
                        isSender: false,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),
                      CustomChatBubblesText(
                        id: "2",
                        text: 'Hello, wanna send you photo now!',
                        dateTime: "03:02 pm",
                        isSender: false,
                        sent: true,
                      ),
                      CustomChatBubblesText(
                        id: "3",
                        text: 'Okay',
                        dateTime: "03:42 pm",
                        isSender: true,
                        sent: true,
                      ),
                      CustomChatBubblesText(
                        id: "4",
                        text: 'Still waiting',
                        dateTime: "05:22 pm",
                        isSender: true,
                        delivered: true,
                      ),
                      DateChip(
                        date: DateTime.now(),
                      ),
                      CustomChatBubblesText(
                        id: "5",
                        image: 'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg',
                        text: 'This is the image. uhuh uh u huuh This is the image. This is the image. This is the image. This is the image. This is the image. This is the image.',
                        dateTime: "11:02 pm",
                        isSender: true,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),

                      CustomChatBubblesText(
                        id: "6",
                        image: 'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg',
                        //text: 'Hello dude, i wanna send you the photo now!',
                        dateTime: "03:02 pm",
                        isSender: false,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),
                      CustomChatBubblesText(
                        id: "7",
                        text: 'Nice photo',
                        dateTime: "10:02 am",
                        isSender: false,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),
                      CustomChatBubblesText(
                        id: "7",
                        text: 'Nice photo',
                        image: 'https://cdn.pixabay.com/photo/2016/11/29/02/28/attractive-1866858__340.jpg',
                        dateTime: "11:12 am",
                        isSender: false,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),
                      CustomChatBubblesText(
                        id: "8",
                        text: '?',
                        dateTime: "10:02 am",
                        isSender: false,
                        sent: true,
                        delivered: true,
                        seen: true,
                      ),
                      CustomChatBubblesText(
                        id: "9",
                        text: 'I guess the chat bubbles is better now!',
                        dateTime: "09:02 pm",
                        isSender: true,
                        sent: true,
                      ),

                      // DateChip(
                      //     date: DateTime(2023, 02, 21)
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'Hello dude, i wanna send you the photo now!',
                      //   isSender: false,
                      //   color: chatSender,
                      //   textStyle: TextStyle(fontSize: 18,color: blackColor,),
                      // ),
                      // DateChip(
                      //   date: DateTime.now(),
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'I am cool. Okay send it and let me see what is there.',
                      //   color: chatReceiver,
                      //   isSender: true,
                      //   sent: true,
                      //   delivered: true,
                      //   seen: true,
                      //   textStyle: TextStyle(fontSize: 18,color: whiteColor,),
                      // ),
                      // BubbleNormalImage(
                      //   id: '1',
                      //   image: _chatImage('https://i.gadgets360cdn.com/large/bb_ki_vines_body_1579760395127.jpg'),
                      //   color: greyColor,
                      //   isSender: false,
                      //   tail: false,
                      //   sent: true,
                      //   delivered: false,
                      //   seen: false,
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'Please check this image may be you will like it.',
                      //   color: chatReceiver,
                      //   isSender: true,
                      //   sent: true,
                      //   delivered: true,
                      //   seen: true,
                      //   textStyle: TextStyle(fontSize: 18,color: whiteColor,),
                      // ),
                      // BubbleNormalImage(
                      //   id: '2',
                      //   image: _chatImage('https://cdn.pixabay.com/photo/2016/11/29/02/28/attractive-1866858__340.jpg'),
                      //   color: greyColor,
                      //   isSender: true,
                      //   tail: false,
                      //   sent: true,
                      //   delivered: false,
                      //   seen: false,
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'I am cool. Okay send it and let me see what is there.',
                      //   color: chatReceiver,
                      //   isSender: true,
                      //   sent: true,
                      //   delivered: true,
                      //   seen: true,
                      //   textStyle: TextStyle(fontSize: 18,color: whiteColor,),
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'what?',
                      //   color: chatSender,
                      //   textStyle: TextStyle(fontSize: 18,color: blackColor,),
                      //   isSender: false,
                      //   sent: true,
                      //   delivered: true,
                      //   seen: false,
                      // ),
                      // const BubbleSpecialOne(
                      //   text: 'I am cool. Okay send it and let me see what is there.',
                      //   color: chatReceiver,
                      //   isSender: true,
                      //   sent: true,
                      //   delivered: false,
                      //   seen: false,
                      //   textStyle: TextStyle(fontSize: 18,color: whiteColor,),
                      // ),
                      SizedBox(height: 67,),
                    ],
                  ),
                ),

                Expanded(
                  child:  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: EdgeInsets.only(bottom: containerBelowChatTextFieldSize),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(chatBgWallpaper),
                              fit: BoxFit.cover),
                        ),
                        child: messageInputBar(textFormFieldThemeColor, textFormFieldThemeColorBorder, textFieldColor)
                    ),
                  ),
                ),
                emojiShowing ? emojiWidget(textFormFieldThemeColor) : Container(),
              ],
            ),
          ),
          ),
          onWillPop: () async {
            if (emojiShowing) {
              setState(() {
                emojiShowing = false;
                emojiIcon = const Icon(Icons.insert_emoticon, size: 30,);
                containerBelowChatTextFieldSize = 0.0;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
      );
    }
}