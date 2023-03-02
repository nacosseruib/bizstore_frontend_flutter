import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../components/constants.dart';
import '../../components/components.dart';
import '../../model/chat/chat_model.dart';
import 'chat_detail_screen.dart';


class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

final getChatList = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dummyChatModel.length,
        itemBuilder: (context, index)=>Stack(
          alignment: Alignment.center,
          children: [
            index == 0
                ?
                //AI CHAT
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChatDetailScreen(), arguments: [
                      {'chatName': mySmartAINameConstant},
                      {'chatPhoto': 'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'},
                    ]);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: customAdvanceNetworkImage(
                            'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'
                        ),
                        backgroundColor: primaryDeepColor,
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(mySmartAINameConstant, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                          subtitle: Row(children: const [
                            Icon(Icons.done_all, size: 15, color: primaryLightColor),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Let's chat and ask me any question you are not clear with.",
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ]),
                          trailing: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, right: 0.0),
                                child: Text('Now',),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            :
              //OTHER CHATS
              GestureDetector(
                  onTap: () {
                    Get.to(() => ChatDetailScreen(), arguments: [
                      {'chatName': '${dummyChatModel[index].firstName!} ${dummyChatModel[index].lastName!}'},
                      {'chatPhoto': dummyChatModel[index].profilePhoto!}
                    ]);
                  },
                  child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: customAdvanceNetworkImage(dummyChatModel[index].profilePhoto!),
                          backgroundColor: primaryDeepColor,
                        ),
                        Expanded(
                        child: ListTile(
                          title: Text('${dummyChatModel[index].firstName!} ${dummyChatModel[index].lastName!}',
                              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                          subtitle: Row(children: [
                            Icon(
                              //dummyChatModel[index].seenStatusColor == null &&
                              (index % 2 == 1) ? Icons.done_all : Icons.done,
                              size: 15,
                              color: primaryLightColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  dummyChatModel[index].chatMessage,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ]),
                          trailing: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, right: 0.0),
                                child: Text('Yesterday'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ],
                  ),
              ),
            const SizedBox(height: 0.0),
          ],
        ),
      )
  );


class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left:9.0, top: 10.0, right: 0.0, bottom: 0.1),
                      child: getChatList,
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "addFriendToChat",
            onPressed: () {},
            backgroundColor: primaryDeepColor,
            splashColor: primaryDeepColor,
            hoverColor: flashColor,
            tooltip: 'Add Friend',
            elevation: 50,
            //splashColor: Colors.grey,
            child: const Icon(Icons.person_add, color: Colors.white, size: 29,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
  }
}

