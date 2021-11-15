import 'package:flutter/material.dart';

class DarkModeBackgroundGradient extends StatelessWidget {
  const DarkModeBackgroundGradient({
    Key? key,
    required this.isLyrics,
  }) : super(key: key);

  final bool isLyrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:
        // isLyrics
        //     ? const LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   // stops: [0.0, 1.0],
        //   colors: [
        //     // Color(0xff11052C),
        //     // Color(0xff11052C),
        //     Color(0xff1C1E30),
        //     Color(0xff1C1E30),
        //     Color(0xff1B1D2E),
        //     Color(0XFFE6DDC4),
        //     Color(0XFFF0E9D2),
        //     Color(0XFF090910),
        //     Color(0XFF000000),
        //   ],
        // )
        //     :
        LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [
                  Color(0xff020114),
                  Color(0xff020114),
                ],
              ),
      ),
    );
  }
}
