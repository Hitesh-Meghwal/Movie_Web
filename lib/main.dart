import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieweb/res/colors/appColors.dart';
import 'package:movieweb/utils/dependencyInjection/app_dependency.dart';
import 'package:movieweb/utils/routes/getRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDepenency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Website',
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        primaryColor: Appcolors.primaryColor, // Example primary color
        scaffoldBackgroundColor: Appcolors.primaryColor, // Background color
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white70,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white60,
          ),
          bodySmall: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Appcolors.primaryColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: Getroutes.routes,
      initialRoute: Getroutes.homeScreen,
    );
  }
}
