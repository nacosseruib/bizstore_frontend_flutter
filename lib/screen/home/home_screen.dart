import 'package:flutter/material.dart';
import '../message/message_screen.dart';
import 'home_appbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: HomeAppBar()
    );

  }
}
