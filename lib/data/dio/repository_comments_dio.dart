import 'package:dio/dio.dart';

import '../../domain/entities/comments.dart';

Future<List<Comments>> fetchComments() async {
  final dio = Dio();
  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/comments');

  return (response.data as List).map((comments) {
    return Comments.fromJson(comments);
  }).toList();
}