import 'package:equatable/equatable.dart';

import '../../../domain/entities/photo.dart';

class AlbumDetailsState extends Equatable {
  final bool isLoading;
  final Photo photo;
  // Deve-se atentar a como o estado é inicializado no construtor
  const AlbumDetailsState({
    this.isLoading = false,
    this.photo = const Photo(),
  });

  // Este método é responsável por atribuir dados novos ao estado atual
  // Caso não seja passado nenhum valor, ele irá manter o valor atual
  AlbumDetailsState copyWith({
    bool? isLoading,
    Photo? photo,
  }) {
    return AlbumDetailsState(
      isLoading: isLoading ?? this.isLoading,
      photo: photo ?? this.photo,
    );
  }

  // Aqui são definidas as variáveis de estado
  @override
  List<Object?> get props => [
        isLoading,
        photo,
      ];
}