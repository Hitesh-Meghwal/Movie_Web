import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: CarouselSlider(
            items: List.generate(5, (index) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade800,
                  ),
                );
              });
            }),
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                viewportFraction: 1.0)));
  }
}
