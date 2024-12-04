import 'package:flutter/material.dart';

class PopularmoviesSkeleton extends StatelessWidget {
  const PopularmoviesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.7),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: Container(color: Colors.grey.shade800))],
          ),
        );
      },
    );
  }
}
