import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/view/filterGridView/filtergridview.dart';
import 'package:flutter_application_8/utils/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/filter_chips.dart';
import 'widgets/slider_widget.dart';
import 'widgets/upgrade_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String selectedFilter;

  int selectedIndex = 0;
  List<String> imagePaths = [
    'assets/images/png-transparent-computer-icons-home-house-home-angle-building-rectangle-thumbnail-removebg-preview.png',
    'assets/images/png-clipart-computer-icons-camera-iphone-graphy-camera-photography-camera-icon-removebg-preview.png',
    'assets/images/png-clipart-hexagonal-illustration-hexagon-shape-pattern-blocks-shapes-angle-text-removebg-preview.png',
  ];

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: buildCarouselSlider(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(31, 29, 34, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most popular AI filters',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildFilterChips(selectedFilter, (filter) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  }),
                  const SizedBox(height: 20),
                  FilterGridView(),
                  const SizedBox(height: 20),
                  const UpgradeButton(),
                  const SizedBox(height: 20),
                  FilterGridView(),
                  const SizedBox(height: 20),
                  const UpgradeButton(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(31, 29, 34, 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: Container(
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
                      color: selectedIndex == 2 ? Colors.white : Colors.grey,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1), // Center button index
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff466cff),
                      Color(0xffa22bff)
                    ], // Constant gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    imagePaths[1], // Center button image
                    color: Colors.white, // Constant white color for the icon
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Container(
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
                        // Return a fallback shader (e.g., solid transparent color)
                        return const LinearGradient(
                          colors: [Colors.grey, Colors.grey],
                        ).createShader(bounds);
                      }
                    },
                    child: Image.asset(
                      imagePaths[2],
                      color: selectedIndex == 2 ? Colors.white : Colors.grey,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
