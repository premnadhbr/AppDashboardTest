import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/view/home/widgets/textfield.dart';
import 'package:flutter_application_8/utils/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/bottmnavbar.dart';
import 'widgets/filter_chips.dart';
import 'widgets/filtered_gridview.dart';
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

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  bool showTextFiled = true;

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
                      : CustomTextField(
                          showTextFiled: showTextFiled,
                          onVisibilityChanged: (value) {
                            setState(() {
                              showTextFiled = value;
                            });
                          },
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
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        imagePaths: imagePathBottomNavbar,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
