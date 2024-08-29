import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/view/filterGridView/filtergridview.dart';
import 'package:flutter_application_8/app/widgets/upgrade_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> filters = const [
    'All',
    'Women fashion',
    'sexy',
    'superheroes',
    'fashion',
    '3D',
    'Christmas',
    'Characters',
    'Sports'
  ];
  late String selectedFilter;

  final List<String> imagePaths = [
    'assets/images/0e224cd4865bef54aeb1f4cc110b78dd.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/0e224cd4865bef54aeb1f4cc110b78dd.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    'assets/images/0e224cd4865bef54aeb1f4cc110b78dd.jpg',
    'assets/images/90a30a6661785a17e112c9efc3fa0cc6.jpg',
    'assets/images/874e5a2b273868f3ddc4ec3bb98cb739.jpg',
    // Add more image paths here
  ];

  final List<String> titles = [
    'Evening dress',
    'Latex',
    'Bulgarian Traditional',
    'Evening dress',
    'Latex',
    'Bulgarian Traditional',
    'Evening dress',
    'Latex',
    'Bulgarian Traditional',
    // Add more titles here
  ];

  @override
  void initState() {
    selectedFilter = filters[0]; // Default filter
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Avatarro",
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            height: 40,
            width: 80,
            margin: const EdgeInsets.all(10),
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
              child: Text(
                "PRO",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300, // Height of the CarouselSlider container
              child: CarouselSlider.builder(
                itemCount: 1,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 300,
                  pageSnapping: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        'assets/images/0e224cd4865bef54aeb1f4cc110b78dd.jpg',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most popular Al filters',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50, // Set height for the list of chips
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = filters[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: selectedFilter == filters[index]
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xff466cff),
                                          Color(0xffa22bff)
                                        ],
                                        stops: [0.25, 0.75],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      )
                                    : null, // No gradient when not selected
                                border: selectedFilter == filters[index]
                                    ? Border.all(
                                        color: Colors.transparent,
                                      )
                                    : null, // No border when not selected
                              ),
                              child: Chip(
                                side: const BorderSide(
                                  color: Color.fromRGBO(48, 48, 48, 1.0),
                                ),
                                backgroundColor:
                                    selectedFilter == filters[index]
                                        ? const Color.fromRGBO(28, 36, 102, 1.0)
                                        : const Color.fromRGBO(48, 48, 48, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                labelStyle: const TextStyle(fontSize: 16),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                label: Text(
                                  filters[index],
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilterGridView(),
                  const SizedBox(
                    height: 20,
                  ),
                  const UpgradeButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
