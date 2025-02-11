import 'package:flutter/material.dart';

import '../../data/dio/repository_dio.dart';
import '../../domain/entities/photo.dart';

class AlbumDetails extends StatefulWidget {
  final int photoId;
  const AlbumDetails({
    super.key,
    required this.photoId,
  });

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Photo>(
          future: fetchSinglePhoto(id: widget.photoId),
          builder: (context, snapshot) {
            Photo? photo = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Text(
                    (photo?.id ?? 0).toString(),
                  ),
                  Text(
                    photo?.thumbnailUrl ?? '',
                  ),
                  Text(
                    photo?.title ?? '',
                  ),
                  Text(
                    photo?.url ?? '',
                  ),
                  Text(
                    (photo?.albumId ?? 0).toString(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
