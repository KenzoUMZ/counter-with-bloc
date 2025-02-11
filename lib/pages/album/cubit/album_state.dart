import 'package:equatable/equatable.dart';

class AlbumState extends Equatable{
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;
  const AlbumState({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  AlbumState copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }){
    return AlbumState(
      albumId: albumId,
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }

  @override
  List<Object?> get props =>[
    albumId,
    id,
    title,
    url,
    thumbnailUrl,
  ];
}