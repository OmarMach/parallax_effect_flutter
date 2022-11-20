import 'package:flutter/material.dart';

void main() => runApp(const ParallaxEffectApp());

class ParallaxEffectApp extends StatelessWidget {
  const ParallaxEffectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
