import 'package:flutter/material.dart';

class LyricTextView extends StatefulWidget {
  const LyricTextView(
      {required this.scaleFactor,
      required this.fColor,
      required this.fSize,
      required this.lyrics});

  final String lyrics;
  final double scaleFactor;
  final Color fColor;
  final double fSize;

  @override
  State<LyricTextView> createState() => _LyricTextViewState();
}

class _LyricTextViewState extends State<LyricTextView> {
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 0.4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _baseScaleFactor = _scaleFactor;
      },
      onScaleUpdate: (details) {
        setState(() {
          _scaleFactor = _baseScaleFactor * details.scale;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text(
          widget.lyrics,
          textScaleFactor: widget.scaleFactor,
          style: TextStyle(
              color: widget.fColor,
              height: 1.5,
              fontSize: widget.fSize,
              fontFamily: widget.lyrics[0].contains(RegExp(r'[A-Z]'))
                  ? 'ZenAntiqueSoft'
                  : 'Suvarnamu'),
        ),
      ),
    );
  }
}
