import 'package:flutter/material.dart';
import 'package:songs_book/song_book/widgets/song_language_button.dart';

import '../constants.dart';

class SongsHomePage extends StatefulWidget {
  const SongsHomePage({Key? key}) : super(key: key);

  @override
  _SongsHomePageState createState() => _SongsHomePageState();
}

class _SongsHomePageState extends State<SongsHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          // color: kBackgroundColor,
          color: Color(0xff020114),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.40,
              child: const Center(
                child: Image(
                  image: AssetImage('images/songs_book_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  SongLanguageButton(
                    screenSize: screenSize,
                    language: 'English Hymns',
                    fontFamily: 'AlexBrush',
                    fontSize: 40.0,
                    pageName: '/english_hymns',
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  SongLanguageButton(
                      screenSize: screenSize,
                      language: 'English Chorus',
                      fontFamily: 'ZenAntiqueSoft',
                      fontSize: 25.0,
                      pageName: '/english_chorus'),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
                  // SongLanguageButton(
                  //   screenSize: screenSize,
                  //   language: 'తెలుగులోకి అనువాదం\nచెయ్యబడిన పాటలు ',
                  //   fontFamily: 'Suvarnamu',
                  //   fontSize: 30.0,
                  //   pageName: '/telugu_hymns',
                  // ),
                  // SizedBox(
                  //   width: screenSize.width * 0.08,
                  // ),
                  // SongLanguageButton(
                  //   screenSize: screenSize,
                  //   language: 'పల్లవులు',
                  //   fontFamily: 'Suvarnamu',
                  //   fontSize: 40.0,
                  //   pageName: '/telugu_chorus',
                  // ),
                  // SizedBox(
                  //   width: screenSize.width * 0.08,
                  // ),
                  SongLanguageButton(
                    screenSize: screenSize,
                    language: 'కీర్తనలు',
                    fontFamily: 'Suvarnamu',
                    fontSize: 40.0,
                    pageName: '/telugu_songs',
                  ),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
