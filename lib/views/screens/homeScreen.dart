import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieweb/controller/movies_controller.dart';
import 'package:movieweb/utils/appConstant/app_constant.dart';
import 'package:movieweb/utils/appString/appString.dart';
import 'package:movieweb/views/widgets/footer.dart';
import 'package:movieweb/views/widgets/customDrawer.dart';
import 'package:movieweb/views/widgets/customNavbar.dart';
import 'package:movieweb/views/widgets/skeletons/carousel_skeleton.dart';
import 'package:movieweb/views/widgets/skeletons/nowPlaying_skeleton.dart';
import 'package:movieweb/views/widgets/skeletons/popularMovies_skeleton.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final MoviesController _moviesController = Get.find();

  @override
  void initState() {
    super.initState();
    _moviesController.getNowPlayingMovies();
    _moviesController.getTopRatedMovies();
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold))),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: _carouselSlider(context),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 10),
                    _nowPlayingWidget(context),
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

  Widget _nowPlayingWidget(BuildContext context) {
    return Obx(() {
      // Check if the list is empty and display a message or loader
      if (_moviesController.nowPlayingMovieList.isEmpty) {
        return Center(
            child: Text(_moviesController.errorMsg.value,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey)));
      }

      return _moviesController.isLoading.value
          ? const NowplayingSkeleton()
          : ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _moviesController.nowPlayingMovieList.length,
              itemBuilder: (context, index) {
                final movies = _moviesController.nowPlayingMovieList[index];
                return ListTile(
                  onTap: () {
                    // Handle movie tap event
                  },
                  leading: SizedBox(
                    height: 120,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppConstant.imagePath}${movies.backdropPath}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  title: Text(
                    movies.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.yellow),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    movies.overview,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
    });
  }

  Widget _carouselSlider(BuildContext context) {
    return Obx(() {
      if (_moviesController.topRatedMovieList.isEmpty) {
        return Center(
            child: Text(_moviesController.errorMsg.value,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey)));
      }
      return _moviesController.isLoading.value
          ? const CarouselSkeleton()
          : CarouselSlider(
              items: _moviesController.topRatedMovieList.map((movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppConstant.imagePath}${movie.backdropPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                viewportFraction: 1.0,
              ),
            );
    });
  }
}
