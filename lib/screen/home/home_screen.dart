import 'package:flutter/material.dart';

import '../message/message_screen.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: MessageScreen()
    );

  }
}
