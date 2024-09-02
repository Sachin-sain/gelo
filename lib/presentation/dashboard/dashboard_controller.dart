
import 'package:get/get.dart';

import '../../constants/constants.dart';


class DashboardController extends GetxController {
  int selected = 0;
  getIndex(int index) {
    selected = index;
    update([ControllerBuilders.dashboardController]);
  }

}