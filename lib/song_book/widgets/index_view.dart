import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:sqflite/sqflite.dart';

import 'lyric_tile.dart';

class IndexView extends StatefulWidget {
  const IndexView({
    Key? key,
    required this.screenSize,
    required this.songsType,
  }) : super(key: key);

  final Size screenSize;
  final String songsType;

  @override
  State<IndexView> createState() => _IndexViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('songsType', songsType));
  }
}

class _IndexViewState extends State<IndexView> {
  List<LyricTile> lyricIndex = [];

  Future openDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "demo_asset_example.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "songs.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    db = await openDatabase(path, readOnly: true);
    return db;
  }

  void getSongIndex() async {
    final List<Map<String, dynamic>> songsIndex = await db
        .rawQuery('SELECT ' + widget.songsType + ', Number from Table_indexx');
    final List<Map<String, dynamic>> songLyrics =
        await db.rawQuery('SELECT ' + widget.songsType + ' from SongBook');

    // print(songLyrics);
    setState(() {
      lyricIndex = [];
      for (int i = 0; i < songsIndex.length; i++) {
        if (songsIndex[i][widget.songsType] != 'THE END') {
          lyricIndex.add(LyricTile(
            number: songsIndex[i]['Number'],
            songName: songsIndex[i][widget.songsType],
            songLyric: songLyrics[i][widget.songsType] + '\n\n\n',
          ));
        } else {
          break;
        }
      }
    });
  }

  void getSearchedSongIndex(int searchNumber, String keyword) async {
    if (searchNumber <= 0 && keyword == '') {
    } else if (searchNumber > 0 && keyword == '') {
      // Searching through number
      String queryIndex = "SELECT " +
          widget.songsType +
          ", Number FROM Table_indexx WHERE Number LIKE '${searchNumber.toString()}%'";
      String queryLyric = "SELECT " +
          widget.songsType +
          " FROM SongBook WHERE Number LIKE '${searchNumber.toString()}%'";
      print(queryIndex);
      print(queryLyric);
      // List<Map> res = await db.rawQuery("SELECT " +
      //     widget.songsType +
      //     " FROM SongBook WHERE Number LIKE '%${searchNumber.toString()}%'");
      // print('first' + res.toString());
      final List<Map<String, dynamic>> songsIndex =
          await db.rawQuery(queryIndex);
      final List<Map<String, dynamic>> songLyrics =
          await db.rawQuery(queryLyric);
      print(songsIndex);

      // print(songLyrics);
      setState(() {
        lyricIndex = [];
        for (int i = 0; i < songsIndex.length; i++) {
          if (songsIndex[i][widget.songsType] != 'THE END') {
            lyricIndex.add(LyricTile(
              number: songsIndex[i]['Number'],
              songName: songsIndex[i][widget.songsType],
              songLyric: songLyrics[i][widget.songsType] + '\n\n\n\n\n',
            ));
          } else {
            break;
          }
        }
      });
    } else if (searchNumber <= 0 && keyword != '') {
      String queryIndex = "SELECT " +
          widget.songsType +
          ", Number FROM Table_indexx WHERE " +
          widget.songsType +
          " LIKE '%${keyword}%'";
      String queryLyric = "SELECT " +
          widget.songsType +
          " FROM SongBook WHERE " +
          widget.songsType +
          " LIKE '%${keyword}%'";
      final List<Map<String, dynamic>> songsIndex =
          await db.rawQuery(queryIndex);
      final List<Map<String, dynamic>> songLyrics =
          await db.rawQuery(queryLyric);

      // print(songLyrics);
      setState(() {
        lyricIndex = [];
        int le = (songsIndex.length < songLyrics.length)
            ? songsIndex.length
            : songLyrics.length;
        print(le);
        for (int i = 0; i < le; i++) {
          if (songsIndex[i][widget.songsType] != 'THE END') {
            lyricIndex.add(LyricTile(
              number: songsIndex[i]['Number'],
              songName: songsIndex[i][widget.songsType],
              songLyric: songLyrics[i][widget.songsType] + '\n\n\n\n\n',
            ));
          } else {
            break;
          }
        }
      });
    }
  }

  @override
  void initState() {
    lyricIndex = [];
    openDB().then(
      (value) => setState(() => {getSongIndex()}),
    );
    super.initState();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);

    return ListView(
      scrollDirection: Axis.vertical,
      children: [Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget.screenSize.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              width: widget.screenSize.width * 0.96,
              height: 55.0,
              decoration: const BoxDecoration(
                color: kListTileColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: kInLyricsTextColor,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: widget.screenSize.width * 0.72,
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          if (value == '') {
                            setState(() {
                              getSongIndex();
                            });
                          } else if (isNumeric(value)) {
                            getSearchedSongIndex(int.parse(value), '');
                          } else if (!isNumeric(value)) {
                            getSearchedSongIndex(0, value);
                          }
                        });
                      },
                      cursorColor: kInLyricsTextColor,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      decoration: const InputDecoration(
                          focusColor: kInLyricsTextColor,
                          hoverColor: kInLyricsTextColor,
                          fillColor: kInLyricsTextColor,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.0),
                          hintText: "Search for Song or Number",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //get songs Index from database of songsType

            Column(
              children: lyricIndex,
            )
          ],
        ),
      ),]
    );
  }
}
