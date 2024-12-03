import 'package:flutter/material.dart';
import 'package:movieweb/utils/appString/appString.dart';
import 'package:movieweb/views/widgets/skeletons/carousel_skeleton.dart';
import 'package:movieweb/views/widgets/customDrawer.dart';
import 'package:movieweb/views/widgets/customNavbar.dart';
import 'package:movieweb/views/widgets/skeletons/nowPlaying_skeleton.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Customdrawer(),
      appBar: const Customnavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(Appstring.topRatedMovies,
                    style: Theme.of(context).textTheme.bodyLarge)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: CarouselSkeleton(),
                    )),
                const SizedBox(width: 20),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(Appstring.nowPlaying,
                            style: Theme.of(context).textTheme.bodyLarge)),
                    const SizedBox(height: 10),
                    const NowplayingSkeleton(),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 15),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(Appstring.explorePopularMovies,
                    style: Theme.of(context).textTheme.bodyLarge)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
