import 'package:get/get.dart';

import '../datasource/remote/services/dio/rest_client.dart';



class InitialBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RestClient(), permanent: true);
  }
}