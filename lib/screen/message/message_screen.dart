import 'package:flutter/material.dart';
import '../../widgets/drawer_bar.dart';
import '../chat/chat_list_screen.dart';
import '../post/post_list.dart';



class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
        drawer: const DrawerBar(),
        body:  SafeArea(
             child: TabBarView(
                children: [
                  const ChatListScreen(),
                  Container(child: Center(child: Text('Group Here'),)),
                  const PostList(),
                  Container(child: Center(child: Text('Store Here'),)),
                ],
            ),
          ),
        )
    );
  }
}
