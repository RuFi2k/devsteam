import 'dart:convert';

import 'package:devsteamtask/config/unsplash_api_config.dart';
import 'package:devsteamtask/models/image_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final UnsplashConfig config = UnsplashConfig();

  Future<List<ImageModel>> getImages({int pageNumber = 1}) async {
    http.Response response = await http.get(
        'https://api.unsplash.com/photos/?client_id=${config.apiKey}&page=$pageNumber');
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<ImageModel>((element) => ImageModel.fromJson(element))
          .toList();
    }
    //failed to get data
    return null;
  }

  //Did not used in this project, but can be used in future as good practice.
  Future<String> getImageUrlById(String id) async {
    http.Response response = await http
        .get('https://api.unsplash.com/photos/$id/?client_id=${config.apiKey}');
    if (response.statusCode == 200) {
      return json.decode(response.body)['urls']['raw'];
    }
    //failed to get data
    return null;
  }
}
