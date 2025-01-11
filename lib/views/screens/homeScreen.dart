import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieweb/controller/movies_controller.dart';
import 'package:movieweb/utils/appString/appString.dart';
import 'package:movieweb/views/widgets/footer.dart';
import 'package:movieweb/views/widgets/skeletons/carousel_skeleton.dart';
import 'package:movieweb/views/widgets/customDrawer.dart';
import 'package:movieweb/views/widgets/customNavbar.dart';
import 'package:movieweb/views/widgets/skeletons/nowPlaying_skeleton.dart';
import 'package:movieweb/views/widgets/skeletons/popularMovies_skeleton.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final MoviesController _moviesController = Get.find();

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
                    _nowPlayingWidget(),
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

  Widget _nowPlayingWidget() {
    return FutureBuilder(
        future: _moviesController.getNowPlayingList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: NowplayingSkeleton());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text(_moviesController.errorMsg.value));
          }
          final nowPlayingList = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: nowPlayingList!.length,
              itemBuilder: (context, index) {
                final movies = nowPlayingList[index];
                return ListTile(
                  leading: Container(
                    color: Colors.grey.shade800,
                    height: 120,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: movies.backdropPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(movies.title,
                      style: Theme.of(context).textTheme.bodyMedium),
                  subtitle: Text(
                    movies.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              });
        });
  }
}
