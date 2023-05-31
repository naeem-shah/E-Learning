import 'package:flutter/material.dart';
import 'package:qubo/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "Satoshi",
        chipTheme: ChipThemeData(
          shape: const StadiumBorder(),
          selectedColor: const Color(0xff6141BB),
          side: BorderSide.none,
          backgroundColor: const Color(0xffF0EBFF),
          labelStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: const Color(0xff32235A)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ThemeData _buildTheme(brightness) {
//   var baseTheme = ThemeData(brightness: brightness);
//
//   return baseTheme.copyWith(
//     textTheme: GoogleFonts.,
//   );
// }

final List<OutlineModel> outlines = [
  OutlineModel(
    image: 'assets/icons/smile.svg',
    outline: 'Live classes',
    number: '26',
  ),
  OutlineModel(
    image: 'assets/icons/cap.svg',
    outline: 'Weekly exams',
  ),
  OutlineModel(
      image: 'assets/icons/video.svg',
      outline: 'Recorded videos',
      number: '40'),
  OutlineModel(
    image: 'assets/icons/study.svg',
    outline: 'Study notes',
  ),
];
