import 'package:dio/dio.dart';

Future<List<Photo>> fetchPhotos() async {
  final dio = Dio();
  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/photos');

  return (response.data as List).map((photo) {
    return Photo.fromJson(photo);
  }).toList();
}

Future<Photo> fetchSinglePhoto({required int id}) async{
  final dio = Dio();

  Response response = await dio.get('https://jsonplaceholder.typicode.com/photos/$id');

  return Photo.fromJson(response.data);
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
