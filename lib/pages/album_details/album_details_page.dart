import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/dio/repository_dio.dart';
import '../../domain/entities/photo.dart';
import 'cubit/album_details_cubit.dart';
import 'cubit/album_details_state.dart';

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
  late AlbumDetailsCubit _cubit;

  @override
  void initState() {
    _cubit = AlbumDetailsCubit()..getPhoto(id: widget.photoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlbumDetailsCubit, AlbumDetailsState>(
          bloc: _cubit,
          builder: (_, state) {
            if (state.photo.id == null && state.isLoading == false) {
              return Text('Foto não encotrada');
            }
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    (state.photo.id ?? 0).toString(),
                    style: GoogleFonts.abel(),
                  ),
                  Text(
                    state.photo.thumbnailUrl ?? '',
                    style: GoogleFonts.abel(),
                  ),
                  Text(
                    state.photo.title ?? '',
                    style: GoogleFonts.abel(),
                  ),
                  Text(
                    state.photo.url ?? '',
                    style: GoogleFonts.abel(),
                  ),
                  Text(
                    (state.photo.albumId ?? 0).toString(),
                    style: GoogleFonts.abel(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}