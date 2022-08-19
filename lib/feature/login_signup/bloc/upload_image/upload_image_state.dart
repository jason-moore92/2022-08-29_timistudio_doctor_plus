import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class UploadImageState extends Equatable {
  const UploadImageState();
  @override
  List<Object> get props => [];
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {
  const UploadImageSuccess({required this.uint8list, required this.fileName});
  final Uint8List uint8list;
  final String fileName;
  @override
  List<Object> get props => [uint8list, fileName];
}

class UploadImageFailure extends UploadImageState {
  const UploadImageFailure({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
