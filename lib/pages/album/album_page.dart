import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'album_details.dart';
import 'dio/repository_dio.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data;
            return ListView.separated(
              itemCount: data?.length ?? 0,
              separatorBuilder: (context, index) => Gap(10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlbumDetails(photId: data[index].id,)),
                    );
                  },
                  child: ListTile(
                    title: Text(data![index].title),
                    subtitle: Text(data[index].url),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// class AlbumPage extends StatefulWidget {
//   const AlbumPage({super.key});

//   @override
//   State<AlbumPage> createState() => _AlbumPage();
// }

// class _AlbumPage extends State<AlbumPage> {
//   late Future<List<Photo>> futurePhotos = fetchPhotos();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Photo>>(
//           future: futurePhotos,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return const Center(
//                 child: Text('Anerror has ocurred!'),
//               );
//             } else if (snapshot.hasData) {
//               return PhotoList(photos: snapshot.data!);
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }

// class PhotoList extends StatelessWidget {
//   const PhotoList({super.key, required this.photos});
//   final List<Photo> photos;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Text(photos[index].title);
//       },
//     );
//   }
// }
