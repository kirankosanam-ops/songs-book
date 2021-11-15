import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:songs_book/song_book/view/lyrics_view.dart';

class LyricTile extends StatelessWidget {
  const LyricTile({
    Key? key,
    required this.number,
    required this.songName,
    required this.songLyric,
  }) : super(key: key);

  final int number;
  final String songName;
  final String songLyric;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double tileHeight = songName.length > 31 ? 80.0 : 80.0;
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 70.0),
          width: screenSize.width * 0.96,
          height: tileHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    spreadRadius: 3,
                    blurRadius: 5)
              ],
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              // color: kListTileColor,
              color: kBackgroundColor,
              // color: Color(0xff020114),
    ),
          child: InkWell(
            onTap: () {
              // print("new Page \n" + songLyric);
              // final emptyLines = '\n'.allMatches(songLyric).length;
              // print(emptyLines);
              print("\n\n\n\n"+songName.length.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LyricsView(
                          lyrics: songLyric,
                          lyricsName: songName,
                          songNumber: number.toString(),
                        )),
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: const BoxDecoration(
                      color: kInLyricsTextColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'ZenAntiqueSoft',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: screenSize.width * 0.72,

                    child: Text(
                      songName.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily:
                              songName.toString()[0].contains(RegExp(r'[A-Z]'))
                                  ? 'ZenAntiqueSoft'
                                  : 'Suvarnamu'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
