import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dio/repository_dio.dart';
import '../../../domain/entities/photo.dart';
import 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(const AlbumState());

  Future<void> getPhotos() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    List<Photo> photos = await fetchPhotos();
    emit(
      state.copyWith(
        isLoading: false,
        photos: photos,
      ),
    );
  }
}
