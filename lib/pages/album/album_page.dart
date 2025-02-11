import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../album_details/album_details_page.dart';
import 'cubit/album_cubit.dart';
import 'cubit/album_state.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late AlbumCubit _cubit;

  @override
  void initState() {
    _cubit = AlbumCubit()..getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlbumCubit, AlbumState>(
        bloc: _cubit,
        builder: (_, state) {
          if (state.photos.isEmpty && state.isLoading == false) {
            return Text('Fotos não encontradas');
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: state.photos.length,
            separatorBuilder: (_, index) => const Gap(10),
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  state.photos[index].title ?? '',
                ),
                subtitle: Text(
                  state.photos[index].url ?? '',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbumDetails(
                        photoId: state.photos[index].id ?? 0,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
