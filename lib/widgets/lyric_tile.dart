import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/view/lyrics_view.dart';

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
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 70.0),
          width: screenSize.width * 0.96,
          height: 70.0,
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
            color: Color(0xFF31314F),
          ),
          child: InkWell(
            onTap: () {
              print("new Page" + songLyric);
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
                    width: screenSize.width * 0.13,
                    height: screenSize.height * 0.065,
                    decoration: const BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0),
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
