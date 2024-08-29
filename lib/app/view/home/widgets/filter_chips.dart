import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_8/utils/const.dart';

Widget buildFilterChips(
    String selectedFilter, ValueChanged<String> onFilterChanged) {
  return SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              onFilterChanged(filters[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: selectedFilter == filters[index]
                    ? const LinearGradient(
                        colors: [Color(0xff466cff), Color(0xffa22bff)],
                        stops: [0.25, 0.75],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : null, // No gradient when not selected
                border: selectedFilter == filters[index]
                    ? Border.all(
                        color: Colors.transparent,
                      )
                    : null,
              ),
              child: Chip(
                side: const BorderSide(
                  color: Color.fromRGBO(48, 48, 48, 1.0),
                ),
                backgroundColor: selectedFilter == filters[index]
                    ? const Color.fromRGBO(28, 36, 102, 1.0)
                    : const Color.fromRGBO(48, 48, 48, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                label: Text(
                  filters[index],
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
