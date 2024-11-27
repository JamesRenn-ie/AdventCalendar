import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advent Calendar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AdventCalendarBoxes(),
    );
  }
}

class AdventCalendarBoxes extends StatefulWidget {
  const AdventCalendarBoxes({super.key});

  @override
  State<AdventCalendarBoxes> createState()=> _AdventCalendarBoxesState();
}

class _AdventCalendarBoxesState extends State<AdventCalendarBoxes>{
  final _colourList = List<Color>.generate(25, (i) => Colors.blueAccent);
  final _dateList = List<String>.generate(25, (i) => "${i+1}");
  final _messageList = List<String>.generate(25, (i) => "Message goes here!");
  final _openedList = List<bool>.generate(25, (i) => false);

  void onBoxClick(int index) {
    setState(() {
          _colourList[index-1] = Colors.white;
          _openedList[index-1] = true;
    });
  }

  Text generateText(int index){
    if (_openedList[index] == true) {
          return Text(
                  _messageList[index],
                  style: const TextStyle( 
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                      )
                    );
    } else {
      return Text(
                  _dateList[index],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                      )
                    );
    }
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
                color: _colourList[index],
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
                child: generateText(index)
              ),
            ),
          );
        },
      ),
    );
  }
}
