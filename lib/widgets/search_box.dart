import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.search,
          color: Colors.purpleAccent,
        ),
        SizedBox(
          width: screenSize.width * 0.72,
          child: TextFormField(
            onFieldSubmitted: (value){
              print(value);
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                hintText: "Search for Song or Number"),
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     print("Search");
        //   },
        //   child: const Icon(
        //     Icons.arrow_right_alt_rounded,
        //     color: Colors.purpleAccent,
        //   ),
        // )
      ],
    );
  }
}