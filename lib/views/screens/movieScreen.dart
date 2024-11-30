import 'package:flutter/material.dart';
import 'package:movieweb/views/widgets/customDrawer.dart';

class Moviescreen extends StatelessWidget {
  const Moviescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customdrawer(),
      appBar: AppBar(),
      body: Center(child: Text("MOVIESCREEN")),
    );
  }
}
