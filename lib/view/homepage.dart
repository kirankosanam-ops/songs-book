import 'package:flutter/material.dart';
import 'package:songs_book/widgets/background_gradient.dart';
import 'package:sqflite/sqflite.dart';
import 'package:songs_book/widgets/song_language_button.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        const BackgroundGradient(isLyrics:false),
        Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.55,
              child: const Center(
                child: Image(
                  image: AssetImage('images/songs_book.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.width * 0.15,
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
                    fontFamily: 'GreatVibes',
                    fontSize: 40.0,
                    pageName: '/english_hymns',
                  ),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
                  SongLanguageButton(
                      screenSize: screenSize,
                      language: 'English Chorus',
                      fontFamily: 'GreatVibes',
                      fontSize: 40.0,
                      pageName: '/english_chorus'),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
                  SongLanguageButton(
                    screenSize: screenSize,
                    language: 'తెలుగులోకి అనువాదం\nచెయ్యబడిన పాటలు ',
                    fontFamily: 'Suvarnamu',
                    fontSize: 30.0,
                    pageName: '/telugu_hymns',
                  ),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
                  SongLanguageButton(
                    screenSize: screenSize,
                    language: 'పల్లవులు',
                    fontFamily: 'Suvarnamu',
                    fontSize: 40.0,
                    pageName: '/telugu_chorus',
                  ),
                  SizedBox(
                    width: screenSize.width * 0.08,
                  ),
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
            )
          ],
        ),
      ]),
    );
  }
}
