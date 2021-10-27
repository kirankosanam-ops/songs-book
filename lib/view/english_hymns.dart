import 'package:flutter/material.dart';
import 'package:songs_book/widgets/background_gradient.dart';
import 'package:songs_book/widgets/index_view.dart';
import 'package:songs_book/widgets/lyric_tile.dart';

class EnglishHymns extends StatelessWidget {
  const EnglishHymns({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const BackgroundGradient(isLyrics:false),
        IndexView(screenSize: screenSize, songsType: 'Eng_Song_Name',),
      ]),
    );
  }
}


