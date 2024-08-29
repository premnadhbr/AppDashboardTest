import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> imagePaths;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.imagePaths,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(31, 29, 34, 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onItemTapped(0);
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    if (selectedIndex == 0) {
                      return const LinearGradient(
                        colors: [Color(0xff466cff), Color(0xffa22bff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    } else {
                      return const LinearGradient(
                        colors: [Colors.grey, Colors.grey],
                      ).createShader(bounds);
                    }
                  },
                  child: Image.asset(
                    imagePaths[0],
                    color: selectedIndex == 0 ? Colors.white : Colors.grey[100],
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemTapped(1);
            },
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xff466cff), Color(0xffa22bff)],
                  stops: [0.25, 0.75],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffa22bff).withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  imagePaths[1], // Center button image
                  color: selectedIndex == 1
                      ? Colors.white
                      : Colors.grey[100], // Constant white color for the icon
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onItemTapped(2);
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    if (selectedIndex == 2) {
                      return const LinearGradient(
                        colors: [Color(0xff466cff), Color(0xffa22bff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    } else {
                      return const LinearGradient(
                        colors: [Colors.grey, Colors.grey],
                      ).createShader(bounds);
                    }
                  },
                  child: Image.asset(
                    imagePaths[2],
                    color: selectedIndex == 2 ? Colors.white : Colors.grey[100],
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
