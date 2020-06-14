class ImageModel {
  String id;
  String rawUrl;
  String url;
  String description;
  String altDescription;

  ImageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        rawUrl = json['urls']['regular'],
        url = json['urls']['small'],
        description = json['description'] ?? '',
        altDescription = json['alt_description'] ?? '';
}
