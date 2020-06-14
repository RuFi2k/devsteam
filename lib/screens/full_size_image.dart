import 'package:flutter/material.dart';

class FullSizeImage extends StatelessWidget {
  final String url;
  FullSizeImage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.network(
        url,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white.withOpacity(0.75),
        child: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        hoverColor: Colors.white,
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
