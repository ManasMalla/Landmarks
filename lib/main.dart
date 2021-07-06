import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landmarks/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LandMarksApp(),
    );
  }
}

List<List<Object>> landmarks = [
  ["Turtle Rock", "turtlerock", false],
  ["Silver Salmon Creek", "silversalmoncreek", false],
  ["Chilkoot Trail", "chilkoottrail", false],
  ["St. Mary Lake", "stmarylake", false],
  ["Twin Lake", "twinlake", false],
  ["Lake McDonald", "lakemcdonald", false],
  ["Charley Rivers", "charleyrivers", false],
  ["Icy Bay", "icybay", false],
  ["Rainbow Lake", "rainbowlake", false],
  ["Hidden Lake", "hiddenlake", false],
  ["Chincoteague", "chincoteague", false],
  ["Lake Umbagog", "umbagog", false],
];

class LandMarksApp extends StatefulWidget {
  LandMarksApp({Key? key}) : super(key: key);
  @override
  State<LandMarksApp> createState() => _LandMarksAppState();
}

class _LandMarksAppState extends State<LandMarksApp> {
  void markFavourite(int index) {
    setState(() {
      landmarks[index][2] = true;
    });
  }

  void unmarkFavourite(int index) {
    setState(() {
      landmarks[index][2] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landmarks",
            style: GoogleFonts.quicksand(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        leading: Container(
          padding: EdgeInsets.all(12),
          child: SvgPicture.asset(
            "assets/images/menu.svg",
            color: Colors.grey[600],
          ),
        ),
        leadingWidth: 48,
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          crossAxisCount: 1,
          childAspectRatio: 1.7,
          children: generateCards(landmarks),
        ),
      ),
    );
  }

  List<Widget> generateCards(List<List<Object>> landmarks) {
    List<Widget> cards = [];
    for (List<Object> landmark in landmarks) {
      cards.add(
        CardView(
          name: landmark[0] as String,
          image: landmark[1] as String,
          star: landmark[2] as bool,
          index: landmarks.indexOf(landmark),
          markFavourite: markFavourite,
          unmarkFavourite: unmarkFavourite,
        ),
      );
    }
    return cards;
  }
}
