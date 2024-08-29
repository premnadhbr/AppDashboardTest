import 'package:flutter/material.dart';
import 'app/view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 24, 1.0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(31, 29, 34, 1.0), // AppBar background
        ),
      ),
    );
  }
}








//  return Scaffold(
//       body: Center(child: Text('Your content here')),
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(31, 29, 34, 1.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(
//             imagePaths.length,
//             (index) {
//               bool isSelected = selectedIndex == index;
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     // Gradient overlay for selected item
//                     if (isSelected)
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [Color(0xff466cff), Color(0xffa22bff)],
//                             stops: [0.25, 0.75],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                         ),
//                       ),
//                     // Image with color effect
//                     ColorFiltered(
//                       colorFilter: ColorFilter.mode(
//                         isSelected ? Colors.transparent : Colors.grey,
//                         BlendMode.srcIn,
//                       ),
//                       child: Image.asset(
//                         imagePaths[index],
//                         height: 24,
//                         width: 24,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );