import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../chat/SingleChatWidget.dart';


class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
                  child: Padding(
                   padding: const EdgeInsets.only(left:8.0, top: 0.1, right: 8.0, bottom: 0.1),
                  child: ListView(
                  children: const [
                    SingleChatWidget(
                        chatTitle: "Arya Stark",
                        chatMessage: 'I wish GoT had better ending',
                        seenStatusColor: primaryDeepColor,
                        imageUrl:
                        'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
                    SingleChatWidget(
                        chatTitle: "Robb Stark",
                        chatMessage: 'Did you check Maisie\'s latest post?',
                        seenStatusColor: blackColor,
                        imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
                    SingleChatWidget(
                        chatTitle: "Jaqen H'ghar",
                        chatMessage: 'Valar Morghulis',
                        seenStatusColor: blackColor,
                        imageUrl:
                        'https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg'),
                    SingleChatWidget(
                        chatTitle: "Sansa Stark",
                        chatMessage: 'The North Remembers',
                        seenStatusColor: primaryLightColor,
                        imageUrl:
                        'https://i.insider.com/5ce420e193a15232821d3084?width=700'),
                    SingleChatWidget(
                        chatTitle: "Jon Snow",
                        chatMessage: 'Stick em\' with the pointy end',
                        seenStatusColor: blackColor,
                        imageUrl:
                        'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
                    SingleChatWidget(
                        chatTitle: "Arya Stark",
                        chatMessage: 'I wish GoT had better ending',
                        seenStatusColor: primaryLightColor,
                        imageUrl:
                        'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
                    SingleChatWidget(
                        chatTitle: "Robb Stark",
                        chatMessage: 'Did you check Maisie\'s latest post?',
                        seenStatusColor: blackColor,
                        imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
                    SingleChatWidget(
                        chatTitle: "Jon Snow",
                        chatMessage: 'Stick em\' with the pointy end',
                        seenStatusColor: primaryLightColor,
                        imageUrl:
                        'https://i.insider.com/5cb3c8e96afbee373d4f2b62?width=700'),
                  ],
                ),
              ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "addFriendToChat",
            onPressed: () {},
            backgroundColor: primaryDeepColor,
            tooltip: 'Add Friend',
            elevation: 7,
            //splashColor: Colors.grey,
            child: const Icon(Icons.person_add, color: Colors.white, size: 29,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
  }
}

