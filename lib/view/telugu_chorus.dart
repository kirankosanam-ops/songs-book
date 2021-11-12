import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/widgets/background_gradient.dart';
import 'package:songs_book/widgets/index_view.dart';

class TeluguChorus extends StatelessWidget {
  const TeluguChorus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const BackgroundGradient(isLyrics: false),
        IndexView(
          screenSize: screenSize,
          songsType: 'Eng_Chrous_Name',
        ),
      ]),
    );
  }
}
