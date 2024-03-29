import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodrecipes/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        padding: EdgeInsets.all(1.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorPalette().searchBarFill),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Find your recipe ...',
              contentPadding: EdgeInsets.fromLTRB(2.0, 2.0, 5.0, 1.0),
              hintStyle: GoogleFonts.sourceSans3(color: Color.fromARGB(255, 8, 33, 66)),
              border: InputBorder.none,
              fillColor: ColorPalette().searchBarFill,
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Iconify(
                  Ri.search_2_fill,
                  color: Color.fromARGB(255, 20, 111, 230),
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20.0, maxWidth: 40.0),
              prefixIconColor: Color.fromARGB(255, 13, 22, 34)),
          style: GoogleFonts.sourceSans3(color: Color.fromARGB(255, 9, 24, 44)),
        ),
      ),
    );
  }
}