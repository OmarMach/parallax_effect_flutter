import 'package:flutter/material.dart';

class VerticalParallaxImage extends StatelessWidget {
  const VerticalParallaxImage({
    Key? key,
    required this.url,
    required this.slide,
  }) : super(key: key);

  final String url;
  final double slide;

  @override
  Widget build(BuildContext context) {
    final double scale = 1 - slide.abs();
    final Size size = MediaQuery.of(context).size;

    final imageHeight = size.height * ((scale * .8) + .8);
    final imageWidth = size.width * ((scale * .6) + .6);

    return Center(
      child: SizedBox(
        height: imageHeight,
        width: imageWidth,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            url,
            alignment: Alignment(1, slide),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
