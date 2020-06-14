import 'package:flutter/material.dart';

class NodeText extends StatelessWidget {
  final String description;
  NodeText({@required this.description});

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.black.withOpacity(0), Colors.black]),
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 25),
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        description,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
