import 'package:devsteamtask/models/image_model.dart';
import 'package:devsteamtask/services/api_service.dart';
import 'package:devsteamtask/widgets/image_node.dart';
import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  ImageListState createState() => ImageListState();
}

class ImageListState extends State<ImageList> {
  List<ImageModel> images = List<ImageModel>();
  int pageNumber = 0;
  ScrollController listController = ScrollController();

  void initData() async {
    var list = await ApiService().getImages(pageNumber: pageNumber++);
    if (list != null)
      setState(() {
        images.addAll(list);
      });
  }

  @override
  void initState() {
    pageNumber = 0;
    listController.addListener(() {
      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        initData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return ListView(
      controller: listController,
      children: <Widget>[
        if (images != null)
          for (var img in images) ImageNode(image: img)
        else
          Center(
            child: Text('Oops! Some problems detected.'),
          ),
      ],
    );
  }
}
