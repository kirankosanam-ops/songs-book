import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:songs_book/constants.dart';
import 'package:songs_book/controller/song_index.dart';
import 'package:songs_book/widgets/search_box.dart';
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
  }

  @override
  void initState() {
    lyricIndex = [];
    openDB().then(
      (value) => setState(() => {getSongIndex()}),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget.screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              child: SearchBox(
                screenSize: widget.screenSize,
              ),
              width: widget.screenSize.width * 0.9,
              height: 55.0,
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
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
      ),
    );
  }
}
