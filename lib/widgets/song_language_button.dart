import 'package:flutter/material.dart';

class SongLanguageButton extends StatelessWidget {
  const SongLanguageButton({
    Key? key,
    required this.screenSize,
    required this.language,
    required this.fontFamily,
    required this.fontSize,
    required this.pageName,
  }) : super(key: key);

  final Size screenSize;
  final String language;
  final String fontFamily;
  final String pageName;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(pageName);
        Navigator.pushNamedAndRemoveUntil(
            context, pageName, (route) =>  route.isCurrent && route.settings.name ==  pageName
            ? false
            : true);
      },
      child: Container(
        width: screenSize.width * 0.75,
        height: screenSize.height * 0.20,
        decoration: BoxDecoration(
          color: const Color(0xFF7AABD1),
          gradient: const LinearGradient(colors: [
            Color(0XFF03BFCD),
            Color(0XFF7C2BE8),
          ]),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1C1E30).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            language,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
