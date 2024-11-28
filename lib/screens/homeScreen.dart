import 'package:flutter/material.dart';
import 'package:movieweb/widgets/customDrawer.dart';
import 'package:movieweb/widgets/customNavbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Customdrawer(),
      appBar: const Customnavbar(),
      body: Center(child: Text("HOMEPAGE")),
    );
  }
}
