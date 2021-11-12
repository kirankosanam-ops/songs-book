import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  double fSize = 24.0;
  Color fColor = Colors.white;

  void decreaseFSize() {
    setState(() {
      fSize -= 1;
    });
  }

  void increaseFSize() {
    setState(() {
      fSize += 1;
    });
  }

  void resetFSize() {
    setState(() {
      fSize = 24;
      _scaleFactor = 1.0;
    });
  }

  void _modalBottomSheetMenu(String title, Size screenSize) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              constraints: const BoxConstraints(minHeight: 180.0),
              height: screenSize.height * 0.27,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xA01B1D2E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.songNumber + '. ' + widget.lyricsName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily:
                                  widget.lyrics[0].contains(RegExp(r'[A-Z]'))
                                      ? 'ZenAntiqueSoft'
                                      : 'Suvarnamu',
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            constraints: const BoxConstraints(minHeight: 65.0),
                            width: screenSize.width * 0.85,
                            height: screenSize.height * 0.09,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                border: Border.all(color: Colors.purpleAccent)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // const SizedBox(
                                //   width: 10.0,
                                // ),
                                InkWell(
                                  onTap: () {
                                    // print("decrease");
                                    setState(() {
                                      resetFSize();
                                    });
                                  },
                                  child: SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: const Text(
                                      'Change Font Size',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'ZenAntiqueSoft'),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // print("decrease");
                                        setState(() {
                                          decreaseFSize();
                                        });
                                      },
                                      child: const SizedBox(
                                        width: 30.0,
                                        child: Icon(Icons.remove,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        fSize.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontFamily: 'ZenAntiqueSoft'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // print("increase");
                                        setState(() {
                                          increaseFSize();
                                        });
                                      },
                                      child: const SizedBox(
                                        width: 30.0,
                                        child: Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // color: Colors.white,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          });
        });
  }
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    var screenSize = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(children: [
          const BackgroundGradient(isLyrics: true),
          Stack(fit: StackFit.loose, children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 1.0, bottom: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _modalBottomSheetMenu(
                        widget.songNumber + '. ' + widget.lyricsName,
                        screenSize);
                  });
                },
                child: SizedBox(
                  width: screenSize.width * 0.9,
                  height: screenSize.height,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: GestureDetector(
                      onScaleStart: (details) {
                        _baseScaleFactor = _scaleFactor;
                      },
                      onScaleUpdate: (details) {
                        setState(() {
                          _scaleFactor = _baseScaleFactor * details.scale;
                        });
                      },
                      child: Text(
                        // splitLyrics(),
                        widget.lyrics,
                        textScaleFactor: _scaleFactor,
                        style: TextStyle(
                            color: fColor,
                            height: 1.5,
                            fontSize: fSize,
                            fontFamily:
                                widget.lyrics[0].contains(RegExp(r'[A-Z]'))
                                    ? 'ZenAntiqueSoft'
                                    : 'Suvarnamu'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
