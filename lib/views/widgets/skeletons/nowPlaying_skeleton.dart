import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowplayingSkeleton extends StatelessWidget {
  const NowplayingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  color: Colors.grey,
                  height: 120,
                  width: 80,
                ),
                title: Container(height: 20, color: Colors.grey),
                subtitle: Container(height: 20, color: Colors.grey),
              );
            }));
  }
}
