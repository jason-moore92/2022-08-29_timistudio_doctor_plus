import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  const PhotoModel(
      {required this.namePhoto, required this.image, required this.uploaded});
  final String image;
  final String namePhoto;
  final DateTime uploaded;

  @override
  List<Object?> get props => [namePhoto, image, uploaded];
}
