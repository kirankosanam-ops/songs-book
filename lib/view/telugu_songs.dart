import 'package:flutter/material.dart';
import 'package:songs_book/widgets/background_gradient.dart';
import 'package:songs_book/widgets/index_view.dart';

class TeluguSongs extends StatelessWidget {
  const TeluguSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const BackgroundGradient(isLyrics:false),
        SafeArea(
          child: IndexView(screenSize: screenSize, songsType: 'Tel_Song_Name',),
        ),
      ]),
    );  }
}
