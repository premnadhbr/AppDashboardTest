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

  bool showTextFiled = true;

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
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showTextFiled
                      ? Row(
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
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  showTextFiled = !showTextFiled;
                                });
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 35,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      : TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey, // Adjust icon color
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(48, 48, 48, 1.0),
                            hintText: "Search...",
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Adjust hint text color
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none, // Remove border side
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none, // Remove border side
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none, // Remove border side
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showTextFiled = !showTextFiled;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(13),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: const Icon(Icons.close),
                              ),
                            ),
                          ),
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
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(31, 29, 34, 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
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
                      color:
                          selectedIndex == 2 ? Colors.white : Colors.grey[100],
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1),
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
              onTap: () => _onItemTapped(2),
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
                        // Return a fallback shader (e.g., solid transparent color)
                        return const LinearGradient(
                          colors: [Colors.grey, Colors.grey],
                        ).createShader(bounds);
                      }
                    },
                    child: Image.asset(
                      imagePaths[2],
                      color:
                          selectedIndex == 2 ? Colors.white : Colors.grey[100],
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
