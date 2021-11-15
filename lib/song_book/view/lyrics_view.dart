import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songs_book/song_book/constants.dart';
import 'package:songs_book/song_book/widgets/dark_mode_background_gradient.dart';
import 'package:songs_book/song_book/widgets/light_mode_background_gradient.dart';

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
  static double fSize = 50.0;
  static Color fColor = Colors.white;
  static Color tColor = kInLyricsTextColor;
  static TextAlign tAlignment = TextAlign.center;
  static Widget appearance = const DarkModeBackgroundGradient(isLyrics: true);
  static Color frostedGlass = const Color(0xff1C1E30).withOpacity(0.3);

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
      fSize = 50.0;
      _scaleFactor = 1.0;
    });
  }

  void leftAlign() {
    setState(() {
      tAlignment = TextAlign.left;
    });
  }

  void centerAlign() {
    setState(() {
      tAlignment = TextAlign.center;
    });
  }

  void rightAlign() {
    setState(() {
      tAlignment = TextAlign.right;
    });
  }

  void darkMode() {
    setState(() {
      appearance = const DarkModeBackgroundGradient(isLyrics: true);
      fColor = Colors.white;
      tColor = kInLyricsTextColor;
      tColor = Colors.white;

      frostedGlass = Color(0xff1C1E30).withOpacity(0.3);
    });
  }

  void lightMode() {
    setState(() {
      appearance = const LightModeBackgroundGradient(isLyrics: true);
      fColor = Colors.black;
      tColor = Colors.deepOrange;
      tColor = Colors.black;
      frostedGlass = Colors.white.withOpacity(0.33);
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
              height: screenSize.height * 0.35,
              color: Colors.transparent,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0xc03c3c3c),
                        color: frostedGlass,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15.0, left: 15.0, right: 15.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.songNumber + '. ' + widget.lyricsName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: tColor,
                                  fontFamily: widget.lyrics[0]
                                          .contains(RegExp(r'[A-Z]'))
                                      ? 'ZenAntiqueSoft'
                                      : 'Suvarnamu',
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                constraints:
                                    const BoxConstraints(minHeight: 65.0),
                                width: screenSize.width * 0.85,
                                height: screenSize.height * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    border: Border.all(color: tColor)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // print("decrease");
                                        setState(() {
                                          resetFSize();
                                        });
                                      },
                                      child: SizedBox(
                                        width: screenSize.width * 0.45,
                                        child: Text(
                                          '  Change Font Size',
                                          style: TextStyle(
                                              color: tColor,
                                              fontSize: 20.0,
                                              fontFamily: 'ZenAntiqueSoft'),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          focusColor: Colors.yellowAccent,
                                          // onTapDown: (value){
                                          //
                                          //   print("tap and hold "+value.);
                                          //
                                          // },
                                          onTap: () {
                                            // print("decrease");
                                            setState(() {
                                              decreaseFSize();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(Icons.remove_circle,
                                                size: 30.0, color: fColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            " " + fSize.toString() + " ",
                                            style: TextStyle(
                                                color: tColor,
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
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(Icons.add_circle,
                                                size: 30.0, color: fColor),
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
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                constraints:
                                    const BoxConstraints(minHeight: 65.0),
                                width: screenSize.width * 0.85,
                                height: screenSize.height * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    border: Border.all(color: tColor)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // const SizedBox(
                                    //   width: 10.0,
                                    // ),
                                    SizedBox(
                                      width: screenSize.width * 0.45,
                                      child: Text(
                                        '  Text Alignment',
                                        style: TextStyle(
                                            color: tColor,
                                            fontSize: 20.0,
                                            fontFamily: 'ZenAntiqueSoft'),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          focusColor: Colors.yellowAccent,
                                          onTap: () {
                                            // print("decrease");
                                            setState(() {
                                              leftAlign();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(
                                                Icons.format_align_left_rounded,
                                                size: 30.0,
                                                color: fColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // print("increase");
                                            setState(() {
                                              centerAlign();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(
                                                Icons
                                                    .format_align_center_rounded,
                                                size: 30.0,
                                                color: fColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // print("increase");
                                            setState(() {
                                              rightAlign();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(
                                                Icons
                                                    .format_align_right_rounded,
                                                size: 30.0,
                                                color: fColor),
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
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                constraints:
                                    const BoxConstraints(minHeight: 65.0),
                                width: screenSize.width * 0.85,
                                height: screenSize.height * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    border: Border.all(color: tColor)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // const SizedBox(
                                    //   width: 10.0,
                                    // ),
                                    SizedBox(
                                      width: screenSize.width * 0.45,
                                      child: Text(
                                        '  Appearance',
                                        style: TextStyle(
                                            color: tColor,
                                            fontSize: 20.0,
                                            fontFamily: 'ZenAntiqueSoft'),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          focusColor: Colors.yellowAccent,
                                          onTap: () {
                                            // print("decrease");
                                            setState(() {
                                              darkMode();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(Icons.dark_mode_rounded,
                                                size: 30.0, color: fColor),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // print("increase");
                                            setState(() {
                                              lightMode();
                                            });
                                          },
                                          child: SizedBox(
                                            width: 30.0,
                                            child: Icon(
                                                Icons.light_mode_rounded,
                                                size: 30.0,
                                                color: fColor),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            );
          });
        });
  }

  static double _scaleFactor = 1.0;
  double _baseScaleFactor = 0.4;

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
          appearance,
          Stack(fit: StackFit.loose, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _modalBottomSheetMenu(
                        widget.songNumber + '. ' + widget.lyricsName,
                        screenSize);
                  });
                },
                child: SizedBox(
                  width: screenSize.width,
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
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 40.0),
                            child: Text(
                              widget.songNumber + '. ' + widget.lyricsName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: fColor,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontSize: 27,
                                  fontFamily: widget.lyrics[0]
                                          .contains(RegExp(r'[A-Z]'))
                                      ? 'ZenAntiqueSoft'
                                      : 'Suvarnamu'),
                            ),
                          ),
                          Text(
                            // splitLyrics(),
                            widget.lyrics,
                            textAlign: tAlignment,
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
                        ],
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
