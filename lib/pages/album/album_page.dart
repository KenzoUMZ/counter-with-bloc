import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/photo.dart';
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
              Photo photo = state.photos[index];
              return UiCard(
                title: photo.title ?? '',
                url: photo.url ?? '',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbumDetails(
                        photoId: photo.id ?? 0,
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

class UiCard extends StatelessWidget {
  final String title;
  final String url;
  final VoidCallback onTap;
  const UiCard({
    super.key,
    required this.title,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            splashColor: Colors.white,
            onTap: () {},
            child: SizedBox(
              width: 300,
              height: 100,
              child: ListTile(
                title: Text(
                  title,
                  style: GoogleFonts.lato(),
                ),
                subtitle: Text(
                  url,
                  style: GoogleFonts.abel(),
                ),
                onTap: () {
                  onTap();
                },
              ),
            )),
      ),
    );
  }
}
