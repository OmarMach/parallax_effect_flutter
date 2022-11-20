import 'package:flutter/material.dart';

class HorizontalParallaxImage extends StatelessWidget {
  const HorizontalParallaxImage({
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

    final imageHeight = size.height * ((scale * 0.2) + 0.2);
    final imageWidth = size.width * ((scale * 0.8) + 0.8);

    return Center(
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            url,
            alignment: Alignment(slide, 1),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
