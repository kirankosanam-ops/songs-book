import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:songs_book/song_book/widgets/index_view.dart';

class TeluguSongs extends StatelessWidget {
  const TeluguSongs({Key? key}) : super(key: key);

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
          songsType: 'Tel_Song_Name',
        ),
      ]),
    );
  }
}
