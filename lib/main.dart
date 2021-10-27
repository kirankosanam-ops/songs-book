import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/view/english_chorus.dart';
import 'package:songs_book/view/english_hymns.dart';
import 'package:songs_book/view/homepage.dart';
import 'package:songs_book/view/telugu_chorus.dart';
import 'package:songs_book/view/telugu_songs.dart';
import 'package:songs_book/view/telulgu_hymns.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Songs Book',
      initialRoute: '/',
      routes: {
        '/': (context) =>  const HomePage(),
        '/english_hymns': (context) =>  const EnglishHymns(),
        '/english_chorus': (context) => const EnglishChorus(),
        '/telugu_hymns': (context) => const TeluguHymns(),
        '/telugu_chorus': (context) => const TeluguChorus(),
        '/telugu_songs': (context) => const TeluguSongs(),
        // '/songs_list': (context) => SongsList(),
      },

    );
  }
}
