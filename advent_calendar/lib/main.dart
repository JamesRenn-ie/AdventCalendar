import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Boxes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AdventCalendarBoxes(),
    );
  }
}

class AdventCalendarBoxes extends StatefulWidget {
  @override
  State<AdventCalendarBoxes> createState()=> _AdventCalendarBoxesState();
}

class _AdventCalendarBoxesState extends State<AdventCalendarBoxes>{
  var _list = List<Color>.generate(25, (i) => Colors.blueAccent);
  void onBoxClick(int index) {
    setState(() {
          _list[index-1] = Colors.white;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder( 
        itemCount: 25, // Number of boxes
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onBoxClick(index + 1), // Placeholder event
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _list[index],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Box ${index + 1}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
