import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dio/repository_dio.dart';
import '../../../domain/entities/photo.dart';
import 'album_details_state.dart';

class AlbumDetailsCubit extends Cubit<AlbumDetailsState> {

AlbumDetailsCubit() : super(const AlbumDetailsState());
  
  Future<void> getPhoto({required int id}) async{
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    Photo photo = await fetchSinglePhoto(id: id);
    emit(
      state.copyWith(
        isLoading: false,
        photo: photo,
      ),
    );
  }

}
