import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:songs_book/song_book/widgets/index_view.dart';

class TeluguHymns extends StatelessWidget {
  const TeluguHymns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          color: kBackgroundColor,
        ),
        IndexView(
          screenSize: screenSize,
          songsType: 'Eng_Song_Name',
        ),
      ]),
    );
  }
}
