import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movieweb/views/screens/homeScreen.dart';
import 'package:movieweb/views/screens/movieScreen.dart';

class Getroutes {
  static const String homeScreen = '/homescreen';
  static const String moiveScreen = '/moviescreen';

  static final List<GetPage> routes = [
    GetPage(name: homeScreen, page: () => Homescreen()),
    GetPage(name: moiveScreen, page: () => const Moviescreen()),
  ];
}
