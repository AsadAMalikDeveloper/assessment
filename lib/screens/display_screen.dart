
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final List<String> givenValues;

  const DisplayScreen(this.givenValues, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: givenValues.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Center(
                child: Text(
                  'Value ${index + 1}: ${givenValues[index]}',
                  overflow: TextOverflow.ellipsis,
                )),
          );
        },
      ),
    );
  }
}