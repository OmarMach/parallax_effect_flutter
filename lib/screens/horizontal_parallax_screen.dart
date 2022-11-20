import 'package:flutter/material.dart';

import '../widgets/horizontal_parallax_image.dart';

class HorizontalParralaxScreen extends StatefulWidget {
  const HorizontalParralaxScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalParralaxScreen> createState() => _HorizontalParralaxScreenState();
}

class _HorizontalParralaxScreenState extends State<HorizontalParralaxScreen> {
  late PageController _pageController;
  double page = 0.0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: .5,
    );

    _pageController.addListener(() {
      setState(() {
        page = _pageController.page!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: HorizontalParallaxImage(
              url: 'http://source.unsplash.com/random/sig=$index',
              slide: (index - page).clamp(-1, 1).toDouble(),
            ),
          );
        },
      ),
    );
  }
}
