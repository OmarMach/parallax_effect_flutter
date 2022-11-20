import 'package:flutter/material.dart';
import 'package:parallax_effect/widgets/horizontal_parallax_image.dart';

import '../widgets/vertical_parallax_image.dart';

class VerticalParralaxScreen extends StatefulWidget {
  const VerticalParralaxScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VerticalParralaxScreen> createState() => _VerticalParralaxScreenState();
}

class _VerticalParralaxScreenState extends State<VerticalParralaxScreen> {
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
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: VerticalParallaxImage(
              url: 'http://source.unsplash.com/random/sig=$index',
              slide: (index - page).clamp(-1, 1).toDouble(),
            ),
          );
        },
      ),
    );
  }
}
