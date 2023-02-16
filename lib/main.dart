import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Carousel')),
      body: Carousel(),
    ),
  ));
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int activePage = 1;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: activePage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(images[index]),
              ),
            ),
          ),
          builder: (context, child) {
            double dist;
            try {
              dist = (_pageController.page! - index).abs();
            } catch (e) {
              dist = (activePage - index).abs().toDouble();
            }
            return Transform.scale(
              scale: dist < 1.0 ? (1.0 - dist) * 0.2 + 0.8 : 0.8,
              child: child,
            );
          },
        );
      },
    );
  }
}
