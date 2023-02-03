import 'package:get_it/get_it.dart';

import '../screen/video/video_viewmodel.dart';


final locator = GetIt.instance;

void setupGetItLocator() {
  locator.registerSingleton<VideoViewModel>(VideoViewModel());
}
