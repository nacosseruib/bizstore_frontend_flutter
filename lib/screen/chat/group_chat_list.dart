import 'package:flutter/material.dart';


class GroupChatList extends StatefulWidget {
  const GroupChatList({Key? key}) : super(key: key);

  @override
  State<GroupChatList> createState() => _GroupChatListState();
}

class _GroupChatListState extends State<GroupChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(child: Center(child: Text('Group Chat'),)),),
    );
  }
}

