import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

uptadeAlbum() async{
  final dio = Dio();
  var response = await dio.get('https://jsonplaceholder.typicode.com/photos');

}

Future<List<Photo>> fetchPhotos() async{
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody){
  final parsed = (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo{
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

  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}