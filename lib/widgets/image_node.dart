import 'package:devsteamtask/models/image_model.dart';
import 'package:devsteamtask/screens/full_size_image.dart';
import 'package:devsteamtask/widgets/image_node_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNode extends StatelessWidget {
  final ImageModel image;
  ImageNode({@required this.image});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return FullSizeImage(
            url: image.rawUrl,
          );
        }));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(image.url), fit: BoxFit.cover)),
          ),
          NodeText(
              description: image.description.isEmpty
                  ? image.altDescription
                  : image.description)
        ],
      ),
    );
  }
}
