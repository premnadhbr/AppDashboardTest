import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterGridView extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/f2def5a46d4d513953eeb22deaa125fc.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/AI-creates-what-the-average-person.png',
    'assets/images/f2def5a46d4d513953eeb22deaa125fc.jpg',
    'assets/images/images.jpeg',
    'assets/images/images (1).jpeg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
  ];

  final List<String> titles = [
    'Evening dress',
    'Latex',
    'Bulgarian ',
    'Evening dress',
    'Latex',
    'Bulgarian ',
    'Evening dress',
    'Latex',
    'Evening dress',
    'Latex',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
                height: 130,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              titles[index],
              overflow: TextOverflow.clip,
              style: GoogleFonts.ptSans(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
