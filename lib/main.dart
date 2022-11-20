import 'package:flutter/material.dart';

void main() => runApp(const ParallaxEffect());

class ParallaxEffect extends StatelessWidget {
  const ParallaxEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ParallaxImage(
                url: 'http://source.unsplash.com/random/sig=$index',
                horizontalSlide: (index - page).clamp(-1, 1).toDouble(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ParallaxImage extends StatelessWidget {
  const ParallaxImage({
    Key? key,
    required this.url,
    required this.horizontalSlide,
  }) : super(key: key);

  final String url;
  final double horizontalSlide;

  @override
  Widget build(BuildContext context) {
    final scale = 1 - horizontalSlide.abs();
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * ((scale * 0.8) + 0.8),
        height: size.height * ((scale * 0.2) + 0.2),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            url,
            alignment: Alignment(horizontalSlide, 1),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
