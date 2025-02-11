import 'package:equatable/equatable.dart';

import '../../../domain/entities/photo.dart';

class AlbumState extends Equatable {
  final bool isLoading;
  final List<Photo> photos;

  // Deve-se atentar a como o estado é inicializado no construtor
  const AlbumState({
    this.isLoading = false,
    this.photos = const [],
  });

  // Este método é responsável por atribuir dados novos ao estado atual
  // Caso não seja passado nenhum valor, ele irá manter o valor atual
  AlbumState copyWith({
    bool? isLoading,
    List<Photo>? photos,
  }) {
    return AlbumState(
      isLoading: isLoading ?? this.isLoading,
      photos: photos ?? this.photos,
    );
  }

  // Aqui são definidas as variáveis de estado
  @override
  List<Object?> get props => [
        isLoading,
        photos,
      ];
}
