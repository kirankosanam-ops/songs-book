import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:songs_book/widgets/background_gradient.dart';


class LyricsView extends StatefulWidget {
  const LyricsView({
    Key? key,
    required this.lyrics,
    required this.lyricsName,
    required this.songNumber,
  }) : super(key: key);
  final String lyrics;
  final String lyricsName;
  final String songNumber;

  @override
  _LyricsViewState createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const BackgroundGradient(isLyrics: true),
        SafeArea(
          child: Stack(fit: StackFit.loose, children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
              ),
              child: SizedBox(
                width: screenSize.width * 0.9,
                height: screenSize.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    widget.lyrics,
                    style: const TextStyle(
                        color: Colors.white,
                        height: 1.5,
                        fontSize: 22.0,
                        fontFamily: 'ZenAntiqueSoft'),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.81,
                    left: screenSize.width * 0.05),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 10.0,
                        blurRadius: 10.0,
                        offset: const Offset(0, 3.0),
                      ),
                    ],
                  ),
                  child: Text(
                    widget.songNumber + '. ' + widget.lyricsName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontFamily: 'ZenAntiqueSoft',
                      fontSize: 24.0,
                    ),
                  ),
                ))
          ]),
        ),
      ]),
    );
  }
}
