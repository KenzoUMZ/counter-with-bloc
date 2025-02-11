import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async{
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

class AlbumPage extends StatefulWidget{
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPage();
}

class _AlbumPage extends State<AlbumPage>{
  late Future<List<Photo>> futurePhotos;

  @override
  void initState(){
    super.initState();
    futurePhotos = fetchPhotos(http.Client());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if(snapshot. hasError){
            return const Center(
              child: Text('Anerror has ocurred!'),
            );
          }else if(snapshot.hasData){
            return PhotoList(photos: snapshot.data!);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}

class PhotoList extends StatelessWidget {
  const PhotoList({super.key, required this.photos});
  final List<Photo> photos;

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index){
        return Text(photos[index].title);
      },
    );
  }
}