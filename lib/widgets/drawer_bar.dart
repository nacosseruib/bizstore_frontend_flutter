import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/changeTheme.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../controller/profile/profile_controller.dart';
import '../screen/profile/profile_screen.dart';


class DrawerBar extends StatefulWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  late final ProfileController profileController = Get.put(ProfileController());


  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                    'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'),
                backgroundColor: primaryDeepColor,
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(appDisplayName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 25),
                  Text('@ajaxsamson', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Text('Ajax Samson', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _estimateWidget('Followers', '826'),
              _estimateWidget('Following', '251'),
              _estimateWidget('Services.', '1,299'),
            ],
          ),
          SizedBox(height: 10),
          Divider()
        ],
      ),
    );
  }

  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(count,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(text),
            ],
          )),
    );
  }


  Widget _settingRow(BuildContext context, IconData icon1, String text, bool isEnabled, Widget routeTo) {
    return isEnabled == true ? InkWell(child: Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: <Widget>[
          Icon(icon1),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 17,fontWeight: FontWeight.normal,)),
          const Expanded(child: SizedBox()),
        ],
      ),
    ),
        onTap:(){ Get.to(() => routeTo); }
    ) : Container();

  }

  Widget _logout(BuildContext context, IconData icon1, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(icon1),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold,)),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Drawer(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: _headerWidget(context),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [const SizedBox(width: 20), const Icon(Icons.dark_mode_outlined), const SizedBox(width: 10),
                            const Text('Night', ), const Spacer(), SwitchWidget()
                          ]),
                          _settingRow(context, Icons.person, 'My Profile', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.notifications, 'Notification', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.message_sharp, 'Message', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.store_mall_directory_outlined, 'My Products/Services', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.wallet, 'My Wallet', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.settings, 'Settings', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          const SizedBox(height: 5),
                          const Divider(indent: 20, endIndent: 20, height: 0,),
                          const SizedBox(height: 5),
                          _settingRow(context, Icons.motorcycle_outlined, 'Get a Rider/Taxi', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.support_agent, 'Talk to Consultant/agent', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.help_outline_sharp, 'Talk to AI Agent', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.home_work, 'Errands Services', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.newspaper, 'News', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.article_sharp, 'Blogs', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.audiotrack_sharp, 'Musics', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.movie_creation_outlined, 'Movies', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          _settingRow(context, Icons.gamepad_outlined, 'Games', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                          const SizedBox(height: 5),
                          const Divider(indent: 20, endIndent: 20, height: 0,),
                          const SizedBox(height: 5),
                          _settingRow(context, Icons.exit_to_app, 'Logout', true, const ProfileScreen(uid: '28282', slideOutProfile: false)),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}

