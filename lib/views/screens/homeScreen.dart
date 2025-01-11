import 'package:flutter/material.dart';
import 'package:movieweb/utils/appString/appString.dart';
import 'package:movieweb/views/widgets/footer.dart';
import 'package:movieweb/views/widgets/skeletons/carousel_skeleton.dart';
import 'package:movieweb/views/widgets/customDrawer.dart';
import 'package:movieweb/views/widgets/customNavbar.dart';
import 'package:movieweb/views/widgets/skeletons/nowPlaying_skeleton.dart';
import 'package:movieweb/views/widgets/skeletons/popularMovies_skeleton.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
    super.initState();
    
  }

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
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                //The LayoutBuilder dynamically computes a grid height based on
                //the available width, designed to accommodate 3 rows of items with an aspect ratio adjustment.
                child: LayoutBuilder(builder: (context, constraints) {
                  // Divides the total available width into 5 equal parts.
                  //Scales each part by 1.4, likely adjusting the grid cell height for an aspect ratio.
                  //Multiplies by 3, probably to fit 3 rows vertically.
                  double gridheight = (constraints.maxWidth / 4) * 1.4 * 3;
                  return SizedBox(
                      height: gridheight, child: const PopularmoviesSkeleton());
                })),
            const SizedBox(height: 8),
            const Footer()
          ],
        ),
      ),
    );
  }
}
