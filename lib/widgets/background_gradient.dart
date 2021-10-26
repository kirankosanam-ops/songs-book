import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
    required this.isLyrics,
  }) : super(key: key);

  final bool isLyrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isLyrics
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 1.0],
                colors: [
                  Color(0XFF803BFC),
                  Color(0XFF3F66FC),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [
                  Color(0xff1C1E30),
                  Color(0xff1B1D2E),
                ],
              ),
      ),
    );
  }
}
