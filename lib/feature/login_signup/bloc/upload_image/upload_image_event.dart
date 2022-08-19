import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class UploadImageEvent extends Equatable {
  const UploadImageEvent();
}

class UploadImage extends UploadImageEvent {
  const UploadImage({required this.uint8list, required this.fileName});
  final Uint8List uint8list;
  final String fileName;
  @override
  List<Object> get props => [uint8list, fileName];
}
