// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imageURL;
  final String name;
  final String information;

  final GlobalKey backgroundImageKey=GlobalKey();

  MovieListItem({super.key,
  required this.imageURL,
  required this.name,
  required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children:[
              Image.asset(
                imageURL,
                width: double.infinity,
                key: backgroundImageKey,
                fit: BoxFit.cover,
              ),
            // ignore: prefer_const_constructors
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Colors.transparent,
                      Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6,0.95]
                    )
                )
                )
              ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        information,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
          ]
          ),
        ),
        ),
    );
  }
}

