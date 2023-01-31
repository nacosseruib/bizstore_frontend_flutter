import 'package:flutter/material.dart';
import '../../network/local/cache_helper.dart';
import '../network/sqlite_data/cubit.dart';
import 'constants.dart';


class SwitchWidget extends StatefulWidget {
  @override
  SwitchWidgetClass createState() => new SwitchWidgetClass();
}


class SwitchWidgetClass extends State {
  bool switchControl = CacheHelper.getData(key: 'isDarkMode');

  void toggleSwitch(bool value) {
    AppCubit.get(context).isDarkMode != switchControl;
    if (switchControl == true) {
      setState(() {
        switchControl = false;
      });

      AppCubit.get(context).changeAppMode();
    } else {
      setState(() {
        switchControl = true;
      });

      AppCubit.get(context).changeAppMode();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 1,
          child: Switch(
            onChanged: toggleSwitch,
            value: switchControl,
            activeColor: primaryLightColor,
            activeTrackColor: primaryDeepColor,
            inactiveThumbColor: whiteColor,
            inactiveTrackColor: greyColor,
          )),
    ]);
  }
}
