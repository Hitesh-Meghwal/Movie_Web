import 'package:get/get.dart';
import 'package:movieweb/controller/movies_controller.dart';

class AppDepenency {
  static void init() {
    // Initialize all your controllers and services
    Get.lazyPut<MoviesController>(() => MoviesController());
  }
}
