
import 'package:flutter/material.dart';

class LightModeBackgroundGradient extends StatelessWidget {
  const LightModeBackgroundGradient({
    Key? key,
    required this.isLyrics,
  }) : super(key: key);

  final bool isLyrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:
        LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            Color(0xffFFFFFF),
            Color(0xffFFFFFF),
          ],
        ),
      ),
    );
  }
}
