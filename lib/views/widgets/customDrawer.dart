import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movieweb/utils/appString/appString.dart';
import 'package:movieweb/utils/routes/getRoutes.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text("MOvIe WEb",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 15),
            _buildTextButton(context, () {
              Get.toNamed(Getroutes.homeScreen);
            }, Appstring.home),
            const SizedBox(height: 5),
            _buildTextButton(context, () {
              Get.toNamed(Getroutes.moiveScreen);
            }, Appstring.movies)
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(
      BuildContext context, VoidCallback ontap, String label) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: ontap,
          child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
    );
  }
}
