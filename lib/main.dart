import 'package:flutter/material.dart';
import 'package:house_price_prediction/pictures.dart';
import 'package:house_price_prediction/drop.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff081b25),
                  Color(0xff081b25),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // carousel and content
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: SizedBox(
                    height: 290.0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        initialPage: 2,
                        autoPlay: true,
                      ),
                      items: Category.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    right: 16.0,
                    left: 16,
                  ),
                  child: DropDownMenuExample(),
                ),
              ],
            ),
          ),

          Positioned(
            top: 50,
            right: 17,
            child: IconButton(
              icon: const Icon(Icons.history, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Category category;
  const HeroCarouselCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5000,
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(category.image, fit: BoxFit.cover, width: 3000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
