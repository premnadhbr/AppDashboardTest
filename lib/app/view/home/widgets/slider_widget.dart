import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCarouselSlider({
  double width = double.infinity,
  double height = 260,
  List<String> imageUrls = const [
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
  ],
  List<String> overlayTexts = const [
    'Al Avatar',
    'Al Fashion',
    'business headshot',
    'Al Avatar',
    'Al Fashion',
    'business headshot',
  ],
}) {
  return SizedBox(
    width: width,
    height: height,
    child: CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        height: height,
        pageSnapping: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  imageUrls[itemIndex],
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  overlayTexts[itemIndex],
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  child: ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        imageUrls[itemIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20, // Adjust this value as needed
                right: 20, // Adjust this value as needed
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    gradient: const LinearGradient(
                      colors: [Color(0xff466cff), Color(0xffa22bff)],
                      stops: [0.25, 0.75],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffa22bff).withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    'try',
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
