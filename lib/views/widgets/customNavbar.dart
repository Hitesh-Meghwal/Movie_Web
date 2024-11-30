import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movieweb/utils/appString/appString.dart';

class Customnavbar extends StatelessWidget implements PreferredSizeWidget {
  const Customnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(Appstring.cineScope,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.yellow))),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width * 0.55,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Appstring.searchMovie,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel, 
                          color: Colors.amber,
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
