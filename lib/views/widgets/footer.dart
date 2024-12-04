import 'package:flutter/material.dart';
import 'package:movieweb/utils/appString/appString.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Appstring.copyright,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey.shade400)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.image, color: Colors.grey.shade400),
                tooltip: "Instagram",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_library, color: Colors.grey.shade400),
                tooltip: "Youtube",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.link, color: Colors.grey.shade400),
                tooltip: "Twitter",
              )
            ],
          ),
          const SizedBox(height: 8),
          //Wrap widget in Flutter is used to arrange children in
          //a horizontal or vertical sequence, automatically wrapping
          //them to the next line or column when there’s not enough space in the current line or column.
          Wrap(
            spacing: 16,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    Appstring.aboutUs,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey.shade400),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    Appstring.privacyPolicy,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey.shade400),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    Appstring.termsOfService,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey.shade400),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
