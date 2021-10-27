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

  void _modalBottomSheetMenu(String title, Size screenSize) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            constraints: BoxConstraints(minHeight: 180.0),
            height: screenSize.height * 0.27,
            color: Colors.transparent,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff1B1D2E),
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
                          padding: EdgeInsets.all(10.0),
                          constraints: BoxConstraints(minHeight: 65.0),
                          width: screenSize.width * 0.85,
                          height: screenSize.height * 0.09,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              border: Border.all(color: Colors.purpleAccent)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.45,
                                child: const Text(
                                  'Change Font Size',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'ZenAntiqueSoft'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("decrease");
                                  setState(() {
                                    fSize -= 1;
                                  });
                                },
                                child: const SizedBox(
                                  width: 30.0,
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
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
                                  print("increase");
                                  setState(() {
                                    fSize += 1;
                                  });
                                },
                                child: const SizedBox(
                                  width: 30.0,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
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
  }

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
    bool viewVisible = true;

    void showWidget() {
      if (viewVisible == false) {
        setState(() {
          viewVisible = true;
        });
      } else {
        setState(() {
          viewVisible = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const BackgroundGradient(isLyrics: true),
        Stack(fit: StackFit.loose, children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 0.05,
                right: screenSize.width * 0.05,
                top: 50.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _modalBottomSheetMenu(
                      widget.songNumber + '. ' + widget.lyricsName, screenSize);
                });
              },
              child: SizedBox(
                width: screenSize.width * 0.9,
                height: screenSize.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    widget.lyrics,
                    style: TextStyle(
                        color: fColor,
                        height: 1.5,
                        fontSize: fSize,
                        fontFamily: widget.lyrics[0].contains(RegExp(r'[A-Z]'))
                            ? 'ZenAntiqueSoft'
                            : 'Suvarnamu'),
                  ),
                ),
              ),
            ),
          ),
          // Visibility(
          //   maintainAnimation: true,
          //   maintainSize: true,
          //   maintainState: true,
          //   visible: viewVisible,
          //   child: Padding(
          //       padding: EdgeInsets.only(
          //           top: screenSize.height - screenSize.height * 0.08 - 30.0,
          //           left: screenSize.width * 0.05),
          //       child: InkWell(
          //         onTap: () {
          //           setState(() {
          //             _modalBottomSheetMenu(
          //                 widget.songNumber + '. ' + widget.lyricsName,
          //                 screenSize);
          //           });
          //         },
          //         child: Container(
          //           constraints: const BoxConstraints(minHeight: 60.0),
          //           width: screenSize.width * 0.9,
          //           height: screenSize.height * 0.08,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius:
          //                 const BorderRadius.all(Radius.circular(15.0)),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.3),
          //                 spreadRadius: 10.0,
          //                 blurRadius: 10.0,
          //                 offset: const Offset(0, 3.0),
          //               ),
          //             ],
          //           ),
          //           child: Center(
          //             child: Text(
          //               widget.songNumber + '. ' + widget.lyricsName,
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 color: Colors.deepPurple,
          //                 fontFamily:
          //                     widget.lyricsName[0].contains(RegExp(r'[A-Z]'))
          //                         ? 'ZenAntiqueSoft'
          //                         : 'Suvarnamu',
          //                 fontSize: 24.0,
          //               ),
          //             ),
          //           ),
          //         ),
          //       )),
          // ),
        ]),
      ]),
    );
  }
}
