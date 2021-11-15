import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:songs_book/song_book/widgets/index_view.dart';

class EnglishChorus extends StatelessWidget {
  const EnglishChorus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          color: Color(0xff020114),
          // color: kBackgroundColor,
        ),
        IndexView(
          screenSize: screenSize,
          songsType: 'Eng_Chrous_Name',
        ),
      ]),
    );
  }
}
