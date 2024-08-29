
import 'package:flutter/material.dart';

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
        crossAxisCount: 3, // 3 items per row
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
        childAspectRatio: 0.7, // Adjust the aspect ratio for better proportions
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
                fit: BoxFit.cover, // Ensure the image fills the container
                height: 130, // Fixed height for the image
                width:
                    double.infinity, // Make the image fill the available width
              ),
            ),
            const SizedBox(height: 5), // Space between image and text
            Text(
              titles[index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
